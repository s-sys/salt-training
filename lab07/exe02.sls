# Criar um reactor que garanta que o serviço atd esteja sempre em estado
# stopped no ambiente.

# No minion2 crie o arquivo /etc/salt/minion.d/beacons.conf com
# o seguinte conteúdo:
# beacons:
#   service:
#     - services:
#         atd:
#           onchangeonly: True

# Após a criação do arquivo o minion deve ser reiniciado:
# systemctl restart salt-minion.service

# Verifique a saída do event bus do salt master utilizando o comando:
# salt-run state.event pretty=True

# Observe mensagens como esta:
# salt/beacon/minion2/service/atd	{
#     "_stamp": "2021-06-19T18:56:12.659195",
#     "atd": {
#         "running": true
#     },
#     "id": "minion2",
#     "service_name": "atd"
# }

# No salt master crie o arquivo /srv/salt/lab07/exe02.sls com o
# seguinte conteúdo:
{% if data["service_name"] == "atd" %}
{% set state = data["atd"] %}
{% if state.running == true %}
lab07_exe02_servico_atd_fora_do_ar:
  local.service.stop:
    - tgt: {{ data['id'] }}
    - args:
      - name: atd.service
{% endif %}
{% endif %}

# No salt master crie o arquivo /etc/salt/master.d/reactor.conf com
# as instruções para o reactor conforme a seguir:
# reactor:
#   - salt/beacon/*/service/atd:
#     - /srv/salt/lab07/exe02.sls

# Após a criação do arquivo o salt master deve ser reiniciado:
# systemctl restart salt-master.service

# No minion2 realize a parada do servidor atd:
# systemctl stop atd.service

# Verifique a seguinte saída e ações no event bus:
## Notificação de que o serviço está em execução.
#
# salt/beacon/minion2/service/atd	{
#     "_stamp": "2021-06-19T19:39:39.588303",
#     "atd": {
#         "running": true
#     },
#     "id": "minion2",
#     "service_name": "atd"
# }
#
## Notificação de que um job com a função service.stop foi disparado
## com target para o minion2.
#
# salt/job/20210619193939635599/new	{
#     "_stamp": "2021-06-19T19:39:39.649130",
#     "arg": [
#         {
#             "__kwarg__": true,
#             "name": "atd.service"
#         }
#     ],
#     "fun": "service.stop",
#     "jid": "20210619193939635599",
#     "minions": [
#         "minion2"
#     ],
#     "missing": [],
#     "tgt": "minion2",
#     "tgt_type": "glob",
#     "user": "root"
# }
# 
## Retorno do minion2 com o status da ação realizada. 
# 
# salt/job/20210619193939635599/ret/minion2	{
#     "_stamp": "2021-06-19T19:39:40.128606",
#     "cmd": "_return",
#     "fun": "service.stop",
#     "fun_args": [
#         {
#             "name": "atd.service"
#         }
#     ],
#     "id": "minion2",
#     "jid": "20210619193939635599",
#     "retcode": 0,
#     "return": true,
#     "success": true
# }
#
## Atualizado do beacon notificação de que o serviço está parado.
#
# salt/beacon/minion2/service/atd	{
#     "_stamp": "2021-06-19T19:39:40.632704",
#     "atd": {
#         "running": false
#     },
#     "id": "minion2",
#     "service_name": "atd"
# }
