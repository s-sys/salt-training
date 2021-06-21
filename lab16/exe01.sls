# Instale e configure o salt-api no servidor Salt Master.

# No servidor salt-master instale o salt-api:
# apt install salt-api

# Crie o arquivo /etc/salt/master.d/api.conf com o seguinte conteúdo:
# rest_cherrypy:
#   port: 8000
#   disable_ssl: true
# 
# external_auth:
#   pam:
#     ubuntu:
#       - .*

# Reinicie o serviço salt-master e salt-api:
# systemctl enable salt-api
# systemctl restart salt-api
# systemctl restart salt-master

# Faça um teste com a API pela linha de comando:
# curl -sSk http://localhost:8000/login \
#   -H 'Accept: application/x-yaml' \
#   -d username='ubuntu' \
#   -d password='linux' \
#   -d eauth='pam'

# Será retornado a seguinte saída em caso de sucesso na autenticação:
# return:
# - eauth: pam
#   expire: 1624274678.7136219
#   perms:
#   - '*':
#     - '*.*'
#   start: 1624231478.713621
#   token: 614e201922b74f14b757f6feb3d8f7cfbc7a9961
#   user: ubuntu

# Utilize o valor do token acima em uma nova chamada:
# curl -sSk http://localhost:8000 \
#   -H 'Accept: application/x-yaml' \
#   -H 'X-Auth-Token: 614e201922b74f14b757f6feb3d8f7cfbc7a9961' \
#   -d client=local \
#   -d tgt='*' \
#   -d fun=test.ping

# Veja o resultado retornado pela API:
# return:
# - minion1: true
#   minion2: true
#   minion3: true
#   minion4: true
#   minion5: true
#   minion6: true
