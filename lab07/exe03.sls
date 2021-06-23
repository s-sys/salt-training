# Criar um beacon para notificar sobre mudanças no arquivo /etc/important.txt.
# O reactor deve garantir que o arquivo seja restaurado para o conteúdo e 
# permissões padrão do arquivo, conforme a seguinte:
# Arquivo: /etc/important.txt
# Permissões: Usuário: root, Grupo: root, Modo de acesso: 644
# Conteúdo do arquivo: "Este é um arquivo com conteúdo importante."
# Estas ações devem ser executadas apenas para o minion1.

# No minion1 crie o arquivo /etc/salt/minion.d/beacons.conf com
# o seguinte conteúdo:
# beacons:
#   inotify:
#     - files:
#         /etc/important.txt:
#           mask:
#             - attrib
#             - create
#             - modify
#             - delete
#             - delete_self
#     - disable_during_state_run: True

# Documentação do beacon inotify disponível no endereço:
# https://docs.saltproject.io/en/latest/ref/beacons/all/salt.beacons.inotify.html

# Para a utilização do beacon inotify é necessário que o pacote
# inotify esteja instalado para a mesma versão do python em uso
# pelo salt-minion.
# apt install python3-pyinotify

# Após a criação do arquivo o minion deve ser reiniciado:
# systemctl restart salt-minion.service
# Se o inotify precisou ser instalado, o salt-minion também
# deve ser reiniciado para fazer uso do módulo python.

# No salt master crie o arquivo /etc/salt/master.d/reactor.conf com
# as instruções para o reactor conforme a seguir:
# reactor:
#   - salt/beacon/*/inotify//etc/important.txt:
#     - /srv/salt/lab07/exe03.sls

# Após a criação do arquivo o salt master deve ser reiniciado:
# systemctl restart salt-master.service

# No salt master crie o arquivo /srv/salt/lab07/exe03.sls com o
# seguinte conteúdo:
{% if data["path"] == "/etc/important.txt" and
   data["id"] == "minion1" %}
lab07_exe03_corrige_arquivo_importante:
  local.state.apply:
    - tgt: {{ data['id'] }}
    - args:
      - mods: lab07.exe03_state
{% endif %}

# Crie também o arquivo /srv/salt/lab07/exe03_state.sls com o
# seguinte conteúdo:
# lab07_exe03_state_arquivo_importante:
#   file.managed:
#     - name: /etc/important.txt
#     - contents: "Este é um arquivo com conteúdo importante."
#     - user: root
#     - group: root
#     - mode: "0644"

# Verifique a saída do event bus do salt master utilizando o comando:
# salt-run state.event pretty=True

# Faça ações de alteração, exclusão, mudanças de permissões no arquivo
# /etc/important.txt e verifique os eventos gerados no event bus:

# salt/beacon/minion1/inotify//etc/important.txt	{
#     "_stamp": "2021-06-19T20:26:54.098022",
#     "change": "IN_ATTRIB",
#     "id": "minion1",
#     "path": "/etc/important.txt"
# }
# salt/job/20210619202654233167/new	{
#     "_stamp": "2021-06-19T20:26:54.240291",
#     "arg": [
#         {
#             "__kwarg__": true,
#             "mods": "lab07.exe03_state"
#         }
#     ],
#     "fun": "state.apply",
#     "jid": "20210619202654233167",
#     "minions": [
#         "minion1"
#     ],
#     "missing": [],
#     "tgt": "minion1",
#     "tgt_type": "glob",
#     "user": "root"
# }
# salt/job/20210619202654233167/ret/minion1	{
#     "_stamp": "2021-06-19T20:26:55.614835",
#     "cmd": "_return",
#     "fun": "state.apply",
#     "fun_args": [
#         {
#             "mods": "lab07.exe03_state"
#         }
#     ],
#     "id": "minion1",
#     "jid": "20210619202654233167",
#     "out": "highstate",
#     "retcode": 0,
#     "return": {
#         "file_|-lab07_exe03_arquivo_importante_|-/etc/important.txt_|-managed": {
#             "__id__": "lab07_exe03_arquivo_importante",
#             "__run_num__": 0,
#             "__sls__": "lab07.exe03_state",
#             "changes": {
#                 "diff": "--- \n+++ \n@@ -0,0 +1 @@\n+Este é um arquivo com conteúdo importante.\n",
#                 "mode": "0644"
#             },
#             "comment": "File /etc/important.txt updated",
#             "duration": 76.12,
#             "name": "/etc/important.txt",
#             "result": true,
#             "start_time": "20:26:55.416895"
#         }
#     },
#     "success": true
# }

# Configure o mesmo beacon em outro minion e verifique que não será
# gerada nenhuma execução de state.
