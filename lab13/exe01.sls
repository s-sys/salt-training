# Crie um orchestrate que utilize a fórmula MySQL para instalar o banco de
# dados no minion5 e que instale o serviço apache no minion4. A ação deve
# ser coordenada para que o servidor apache no minion4 seja instalado
# somente após o sucesso de configuração do banco de dados MySQL no minion5.

# Crie o arquivo /srv/pillar/lab13/mysql.sls com o seguinte conteúdo:
# mysql:
#   global:
#     client-server:
#       default_character_set: utf8
# 
#   clients:
#     mysql:
#       default_character_set: utf8
#     mysqldump:
#       default_character_set: utf8
# 
#   library:
#     client:
#       default_character_set: utf8
# 
#   server:
#     root_user: 'root'
#     root_password: 'Passw0rd123'
# 
#     mysqld:
#       bind-address: 0.0.0.0

# Ajuste o arquivo /srv/pillar/top.sls para conter o seguinte trecho:
# base:
#   'minion5':
#     - lab13.mysql

# Pode ser necessário garantir que o pillar foi atualizado em todos os minions:
# salt '*' saltutil.refresh_pillar

# Crie o state /srv/salt/lab13/exe01_mysql.sls para a instalação do banco de
# dados MySQL:
# include:
#   - mysql

# Crie o arquivo /srv/salt/lab13/map.jinja com o seguinte conteúdo:
# {% set apache = salt['grains.filter_by']({
#     'Ubuntu': {'pkg': 'apache2', 'srv': 'apache2'},
#     'CentOS': {'pkg': 'httpd', 'srv': 'httpd'},
#     'SUSE': {'pkg': 'apache2', 'srv': 'apache2'},
# }, grain='os', default='Ubuntu') %}

# Crie o state /srv/salt/lab13/exe01_apache.sls para a instalação do
# serviço Apache:
# {%- from 'lab13/map.jinja' import apache with context %}
# lab13_exe01_instala_apache:
#   pkg.installed:
#     - name: {{ apache.pkg }}
# 
# lab13_exe01_habilita_apache:
#   service.running:
#     - name: {{ apache.srv }}
#     - enable: True

# Crie o arquivo de orchestrate em /srv/salt/lab13/exe01_orch.sls para
# definir as ações de orquestração:
lab13_exe01_instala_mysql:
  salt.state:
    - tgt: 'minion5'
    - sls:
      - lab13.exe01_mysql

lab13_exe01_instala_apache:
  salt.state:
    - tgt: 'minion4'
    - sls:
      - lab13.exe01_apache
    - require:
      - salt: lab13_exe01_instala_mysql

# Execute a orquestração e verifque a saída:
# salt-run state.orch lab13.exe01_orch

# master_master:
# ----------
#           ID: lab13_exe01_instala_mysql
#     Function: salt.state
#       Result: True
#      Comment: States ran successfully. No changes made to minion5.
#      Started: 19:39:50.194107
#     Duration: 84178.706 ms
#      Changes:   
# ----------
#           ID: lab13_exe01_instala_apache
#     Function: salt.state
#       Result: True
#      Comment: States ran successfully. Updating minion4.
#      Started: 19:41:14.373863
#     Duration: 18360.274 ms
#      Changes:   
#               minion4:
#               ----------
#                         ID: lab13_exe01_instala_apache
#                   Function: pkg.installed
#                       Name: httpd
#                     Result: True
#                    Comment: The following packages were installed/updated: httpd
#                    Started: 15:41:18.353194
#                   Duration: 13598.016 ms
#                    Changes:   
#                             ----------
#                             apr:
#                                 ----------
#                                 new:
#                                     1.4.8-7.el7
#                                 old:
#                             apr-util:
#                                 ----------
#                                 new:
#                                     1.5.2-6.el7
#                                 old:
#                             httpd:
#                                 ----------
#                                 new:
#                                     2.4.6-97.el7.centos
#                                 old:
#                             httpd-tools:
#                                 ----------
#                                 new:
#                                     2.4.6-97.el7.centos
#                                 old:
#                             mailcap:
#                                 ----------
#                                 new:
#                                     2.1.41-2.el7
#                                 old:
#               ----------
#                         ID: lab13_exe01_habilita_apache
#                   Function: service.running
#                       Name: httpd
#                     Result: True
#                    Comment: Service httpd has been enabled, and is running
#                    Started: 15:41:31.976812
#                   Duration: 592.012 ms
#                    Changes:   
#                             ----------
#                             httpd:
#                                 True
#               
#               Summary for minion4
#               ------------
#               Succeeded: 2 (changed=2)
#               Failed:    0
#               ------------
#               Total states run:     2
#               Total run time:  14.190 s
# 
# Summary for master_master
# ------------
# Succeeded: 2 (changed=1)
# Failed:    0
# ------------
# Total states run:     2
# Total run time: 102.539 s
