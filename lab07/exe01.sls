# Criar um beacon para notificar sobre o status do serviço atd.

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
