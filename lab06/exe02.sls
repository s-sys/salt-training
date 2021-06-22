# Crie um state para a instalação de todos pacotes retornados em uma
# lista no grains chamado packages.

# Escolha um minion e crie o arquivo /etc/salt/minion.d/grains.conf
# com o seguinte conteúdo:
# grains:
#   packages:
#     - htop
#     - sysstat
#     - vim

# Pode ser necessário forçar a atualização dos grains:
# salt '*' saltutil.refresh_grains

{% set packages = salt['grains.get']('packages', []) %}

{% for pkg in packages %}
lab06_exe02_instala_pacote_{{ pkg }}:
  pkg.installed:
    - name: {{ pkg }}
{% endfor %}
