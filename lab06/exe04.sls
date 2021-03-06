# Crie um state que garanta que todos os serviços passados como uma lista
# no pillar services estejam em execução na máquina. Associe este pillar
# apenas ao minion3.

# Crie o arquivo /srv/pillar/lab06/services.sls com o seguinte conteúdo:
# services:
#   - ssh.service
#   - atd.service
#   - cron.service

# Configure o top.sls do pillar para que a informação do pillar "services"
# esteja disponível apenas para o minion minion3, conforme abaixo:
# base:
#   'minion3':
#     - lab06.services

# Pode ser necessário garantir que todos os minions atualizaram seus
# pillars antes de prosseguir:
# salt '*' saltutil.refresh_pillar

# Crie o arquivo /srv/salt/lab06/exe04.sls com o seguinte conteúdo:
{% set services = salt['pillar.get']('services', []) %}

{% for service in services %}
executa_servico_{{ service }}:
  service.running:
    - name: {{ service }}
{% endfor %}

# Execute o comando abaixo para aplicar o state no minion3:
# salt 'minion3' state.apply lab06.exe04

# Execute o comando abaixo para aplicar o state no minion4 e verifque
# o resultado:
# salt 'minion4' state.apply lab06.exe04

# Você perceberá que não foi executado nenhum state, pois o minion4 não
# possui acesso ao pillar "services".
