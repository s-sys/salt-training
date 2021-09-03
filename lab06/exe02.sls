# Crie um state para a instalação de todos os pacotes retornados em uma
# lista no grains chamado packages.

# Escolha um minion (por exemplo, minion2) e crie o arquivo 
# /etc/salt/minion.d/grains.conf com o seguinte conteúdo:
# grains:
#   packages:
#     - htop
#     - sysstat
#     - vim

# Pode ser necessário forçar a atualização dos grains:
# salt '*' saltutil.refresh_grains

# Crie um arquivo no servidor salt master em /srv/salt/lab06/exe02.sls
# com o seguinte conteúdo:
{% set packages = salt['grains.get']('packages', []) %}

{% for pkg in packages %}
lab06_exe02_instala_pacote_{{ pkg }}:
  pkg.installed:
    - name: {{ pkg }}
{% endfor %}

# Execute o comando abaixo para a execução do state no minion escolhido:
# salt 'minion2' state.apply lab06.exe02

# Execute o comando abaixo no minion2:
# salt-call -l debug state.apply lab06.exe02

# Verifque a saída renderizada referente ao processamento do código e
# observe o seguinte trecho:

# lab06_exe02_instala_pacote_htop:
#   pkg.installed:
#     - name: htop
# 
# lab06_exe02_instala_pacote_sysstat:
#   pkg.installed:
#     - name: sysstat
# 
# lab06_exe02_instala_pacote_vim:
#   pkg.installed:
#     - name: vim 
