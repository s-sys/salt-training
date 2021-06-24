# Crie um state para a instalação do pacote apache em todos os minions Linux.
# Crie um map.jinja para tratar o nome do pacote e do serviço para todas as
# distribuições Linux existentes no ambiente. Crie uma condicional para que
# o apache não seja instalado caso o processo nginx esteja em execução.
# Extra: Crie um pillar chamado force_remove_nginx com o valor de True e
# associe a todos os minions. Caso o pillar estiver definido com o valor de
# True, force a removação do nginx e a instalação o apache. Adicione uma
# entrada de log salt em modo debug informando quando o pacote nginx for
# removido.

# Crie o arquivo /srv/pillar/lab12/nginx.sls com o seguinte conteúdo:
# force_remove_nginx: True

# Ajuste o arquivo /srv/pillar/top.sls para conter o seguinte trecho:
# base:
#   '*':
#     - lab12.nginx

# Pode ser necessário garantir que o pillar foi atualizado em todos os minions:
# salt '*' saltutil.refresh_pillar

# Verifique o valor do grain os de todos os minions:
# salt '*' grains.item os

# Crie o arquivo /srv/salt/lab12/map.jinja com o seguinte conteúdo:
# {% set apache = salt['grains.filter_by']({
#     'Ubuntu': {'pkg': 'apache2', 'srv': 'apache2'},
#     'CentOS': {'pkg': 'httpd', 'srv': 'httpd'},
#     'SUSE': {'pkg': 'apache2', 'srv': 'apache2'},
# }, default='Ubuntu', grain='os') %}
#
# {% set nginx = salt['grains.filter_by']({
#     'Ubuntu': {'pkg': 'nginx-core', 'proc': 'nginx'},
#     'CentOS': {'pkg': 'nginx', 'proc': 'nginx'},
#     'SUSE': {'pkg': 'nginx', 'proc': 'nginx'},
# }, default='Ubuntu', grain='os') %}

# Crie o arquivo /srv/salt/lab12/exe01.sls com o seguinte conteúdo:
{%- set os = salt['grains.get']('kernel', '') %}

{%- if os == "Linux" %}
{%- from 'lab12/map.jinja' import apache with context %}
{%- from 'lab12/map.jinja' import nginx with context %}
{%- set force_remove_nginx = salt['pillar.get']('force_remove_nginx', False) %}

{%- if force_remove_nginx is sameas True %}
{%- do salt.log.debug('=====> Removendo pacote ' ~ nginx.pkg) %}
lab12_exe01_remove_nginx:
  pkg.purged:
    - name: {{ nginx.pkg }}
{%- endif %}

lab12_exe01_instala_apache:
  pkg.installed:
    - name: {{ apache.pkg }}
    {%- if force_remove_nginx is sameas True %}
    - require:
      - id: lab12_exe01_remove_nginx
    {%- endif %}
    - onlyif:
      - test $(pgrep -c {{ nginx.proc }}) -eq 0

lab12_exe01_habilita_servico_apache:
  service.running:
    - name: {{ apache.srv }}
    - enable: True
    - require:
      - pkg: {{ apache.pkg }}
    - onlyif:
      - test $(pgrep -c {{ nginx.proc }}) -eq 0
{%- endif %}

# Execute o state no minion3 e verifque a saída:
# salt 'minion3' state.apply lab12.exe01

# minion3:
# ----------
#           ID: lab12_exe01_remove_nginx
#     Function: pkg.purged
#         Name: nginx-core
#       Result: True
#      Comment: All targeted packages were purged.
#      Started: 16:04:19.308142
#     Duration: 9319.847 ms
#      Changes:   
#               ----------
#               installed:
#                   ----------
#                   libnginx-mod-http-auth-pam:
#                       ----------
#                       new:
#                           1.14.0-0ubuntu1.9
#                       old:
#                   libnginx-mod-http-dav-ext:
#                       ----------
#                       new:
#                           1.14.0-0ubuntu1.9
#                       old:
#                   libnginx-mod-http-echo:
#                       ----------
#                       new:
#                           1.14.0-0ubuntu1.9
#                       old:
#                   libnginx-mod-http-subs-filter:
#                       ----------
#                       new:
#                           1.14.0-0ubuntu1.9
#                       old:
#                   libnginx-mod-http-upstream-fair:
#                       ----------
#                       new:
#                           1.14.0-0ubuntu1.9
#                       old:
#                   nginx-core:
#                       ----------
#                       new:
#                       old:
#                           1.14.0-0ubuntu1.9
#                   nginx-full:
#                       ----------
#                       new:
#                           1.14.0-0ubuntu1.9
#                       old:
#               removed:
#                   ----------
# ----------
#           ID: lab12_exe01_instala_apache
#     Function: pkg.installed
#         Name: apache2
#       Result: True
#      Comment: onlyif condition is false
#      Started: 16:04:31.438143
#     Duration: 1031.5 ms
#      Changes:   
# ----------
#           ID: lab12_exe01_habilita_servico_apache
#     Function: service.running
#         Name: apache2
#       Result: True
#      Comment: onlyif condition is false
#      Started: 16:04:32.470446
#     Duration: 29.025 ms
#      Changes:   
# 
# Summary for minion3
# ------------
# Succeeded: 3 (changed=1)
# Failed:    0
# ------------
# Total states run:     3
# Total run time:  10.380 s
