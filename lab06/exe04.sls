# Crie um state que garanta que todos os serviços passados como uma lista
# no pillar services estejam em execução na máquina.

# Crie o arquivo /srv/pillar/lab06/services.sls com o seguinte conteúdo:
# services:
#   - ssh.service
#   - atd.service
#   - cron.service

# Configure o top.sls do pillar para que a informação do pillar services
# esteja disponível apenas para o minion minion3, conforme a seguinte:
# base:
#   'minion3':
#     - lab06.services

# Pode ser necessário garantir que todos os minions atualizaram seus
# pillars antes de prosseguir:
# salt '*' saltutil.refresh_pillar

{% set services = salt['pillar.get']('services', {}) %}

{% for service in services %}
executa_servico_{{ service }}:
  service.running:
    - name: {{ service }}
{% endfor %}
