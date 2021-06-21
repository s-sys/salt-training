# Crie um código python para utilizar a salt-api para executar a função
# test.ping para todos os minions do ambiente e imprima a saída.

# Crie o arquivo /root/code.py com o seguinte conteúdo:
# #!/usr/bin/env python3
# import requests
# 
# session = requests.Session()
# session.post('http://localhost:8000/login', json={
#   'username': 'ubuntu',
#   'password': 'linux',
#   'eauth': 'pam',
# })
# 
# resp = session.post('http://localhost:8000', json=[{
#   'client': 'local',
#   'tgt': '*',
#   'fun': 'test.ping',
# }])
# 
# print(resp.json())

# Execute o código python:
# python3 /root/code.py

# Verifique a saída do script python:
# {'return': [{'minion2': True, 'minion1': True, 'minion3': True, 'minion4': True, 'minion5': True, 'minion6': True}]}
