# Crie um state que instale todos os softwares definidos em um pillar de
# nome "softwares". Associe este pillar apenas ao minion1.

# Crie o arquivo /srv/pillar/lab06/softwares.sls com o seguinte conteúdo:
# softwares:
#   - htop
#   - vim
#   - sysstat
#   - ntopng
#   - cowsay

# Configure o top.sls do pillar para que a informação do pillar "services"
# esteja disponível apenas para o minion minion1, conforme a seguinte:
# base:
#   'minion1':
#     - lab06.softwares

# Pode ser necessário garantir que todos os minions atualizaram seus
# pillars antes de prosseguir:
# salt '*' saltutil.refresh_pillar

# Crie o arquivo /srv/salt/lab06/exe05.sls com o seguinte conteúdo:
{% set softwares = salt['pillar.get']('softwares', []) %}

{% for software in softwares %}
instala_software_{{ software }}:
  pkg.installed:
    - name: {{ software }}
{% endfor %}

# Execute o comando abaixo para aplicar o state no minion1:
# salt 'minion1' state.apply lab06.exe05
