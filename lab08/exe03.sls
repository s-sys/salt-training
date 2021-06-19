# Utilize a formula mysql-formula para instalar o banco da dados MySQL
# no minion3. Após a instalação e configuração do banco de dados através
# da fórmula crie um pillar chamado 'my_database' para cadastrar informações
# dos banco de dados, usuários e senha de cada banco. O pillar deverá
# ser acessível apenas para o minion3. Após isso, crie um state que fará
# a automação da criação do banco de dados, do usuário com a senha definida
# e a atribuição das permissões FULL conforme dados coletados do pillar
# 'my_database'.

# No servidor salt master faça um clone da formula mysql-formula do github:
# mkdir -p /opt/salt-formulas
# cd /opt/salt-formulas
# git clone https://github.com/saltstack-formulas/mysql-formula

# Altere o arquivo /etc/salt/master.d/fileroots.conf com o seguinte conteúdo:
# file_roots:
#   base:
#     - /srv/salt
#     - /opt/salt-formulas/vim-formula
#     - /opt/salt-formulas/openssh-formula
#     - /opt/salt-formulas/mysql-formula

# Após a criação do arquivo o salt master deve ser reiniciado:
# systemctl restart salt-master.service

# Altere o arquivo /srv/salt/top.sls para adicionar uma entrada para a
# execução da fórmula mysql apenas no minion3 da seguinte forma:
# base:
#   'minion3':
#     - mysql

# Crie o arquivo /srv/pillar/lab08/mysql.sls com o seguinte conteúdo:
# mysql:
#   global:
#     client-server:
#       default_character_set: utf8
#   clients:
#     mysql:
#       default_character_set: utf8
#     mysqldump:
#       default_character_set: utf8
#   library:
#     client:
#       default_character_set: utf8
#   server:
#     root_user: 'root'
#     root_password: 'Passw0rd123'
#     mysqld:
#       bind-address: 0.0.0.0
# 
# my_database:
#   database1:
#     user: database1
#     password: Passw0rd123
#   database2:
#     user: database2
#     password: Passw0rd123
#   database3:
#     user: database3
#     password: Passw0rd123

# Altere o arquivo /srv/pillar/top.sls para adicionar o seguinte conteúdo:
# base:
#   'minion3':
#     - lab08.mysql

# Pode ser necessário forçar a atualização dos pillars em todos os minions:
# salt '*' saltutil.refresh_pillar

# Execute o highstate para o minion3 e observe o resultado:
# salt 'minion3' state.highstate

# minion3:
# ----------
#           ID: openssh
#     Function: pkg.installed
#         Name: openssh-server
#       Result: True
#      Comment: All specified packages are already installed
#      Started: 21:42:00.742929
#     Duration: 97.973 ms
#      Changes:   
# ----------
#           ID: openssh
#     Function: service.running
#         Name: ssh
#       Result: True
#      Comment: The service ssh is already running
#      Started: 21:42:00.847500
#     Duration: 119.803 ms
#      Changes:   
# ----------
#           ID: mysql_debconf_utils
#     Function: pkg.installed
#         Name: debconf-utils
#       Result: True
#      Comment: All specified packages are already installed
#      Started: 21:42:00.985565
#     Duration: 13.325 ms
#      Changes:   
# ----------
#           ID: mysql_debconf
#     Function: debconf.set
#         Name: mariadb-server
#       Result: True
#      Comment: 
#      Started: 21:42:00.999207
#     Duration: 563.509 ms
#      Changes:   
#               ----------
#               mariadb-server/start_on_boot:
#                   true
# ----------
#           ID: mysql_password_debconf
#     Function: debconf.set
#         Name: mysql-server
#       Result: True
#      Comment: 
#      Started: 21:42:01.594324
#     Duration: 738.854 ms
#      Changes:   
#               ----------
#               mysql-server/root_password:
#                   (password hidden)
#               mysql-server/root_password_again:
#                   (password hidden)
# ----------
#           ID: mysqld-packages
#     Function: pkg.installed
#         Name: mariadb-server
#       Result: True
#      Comment: The following packages were installed/updated: mariadb-server
#      Started: 21:42:02.334015
#     Duration: 75951.263 ms
#      Changes:   
#               ----------
#               galera-3:
#                   ----------
#                   new:
#                       25.3.20-1
#                   old:
#               libaio1:
#                   ----------
#                   new:
#                       0.3.110-5ubuntu0.1
#                   old:
#               libcgi-fast-perl:
#                   ----------
#                   new:
#                       1:2.13-1
#                   old:
#               libcgi-pm-perl:
#                   ----------
#                   new:
#                       4.38-1
#                   old:
#               libconfig-inifiles-perl:
#                   ----------
#                   new:
#                       2.94-1
#                   old:
#               libdbd-mysql-perl:
#                   ----------
#                   new:
#                       4.046-1
#                   old:
#               libdbi-perl:
#                   ----------
#                   new:
#                       1.640-1ubuntu0.2
#                   old:
#               libencode-locale-perl:
#                   ----------
#                   new:
#                       1.05-1
#                   old:
#               libfcgi-perl:
#                   ----------
#                   new:
#                       0.78-2build1
#                   old:
#               libhtml-parser-perl:
#                   ----------
#                   new:
#                       3.72-3build1
#                   old:
#               libhtml-tagset-perl:
#                   ----------
#                   new:
#                       3.20-3
#                   old:
#               libhtml-template-perl:
#                   ----------
#                   new:
#                       2.97-1
#                   old:
#               libhttp-date-perl:
#                   ----------
#                   new:
#                       6.02-1
#                   old:
#               libhttp-message-perl:
#                   ----------
#                   new:
#                       6.14-1
#                   old:
#               libio-html-perl:
#                   ----------
#                   new:
#                       1.001-1
#                   old:
#               libjemalloc1:
#                   ----------
#                   new:
#                       3.6.0-11
#                   old:
#               liblwp-mediatypes-perl:
#                   ----------
#                   new:
#                       6.02-1
#                   old:
#               libmysqlclient20:
#                   ----------
#                   new:
#                       5.7.34-0ubuntu0.18.04.1
#                   old:
#               libterm-readkey-perl:
#                   ----------
#                   new:
#                       2.37-1build1
#                   old:
#               libtimedate-perl:
#                   ----------
#                   new:
#                       2.3000-2
#                   old:
#               liburi-perl:
#                   ----------
#                   new:
#                       1.73-1
#                   old:
#               mariadb-client-10.1:
#                   ----------
#                   new:
#                       1:10.1.48-0ubuntu0.18.04.1
#                   old:
#               mariadb-client-core-10.1:
#                   ----------
#                   new:
#                       1:10.1.48-0ubuntu0.18.04.1
#                   old:
#               mariadb-common:
#                   ----------
#                   new:
#                       1:10.1.48-0ubuntu0.18.04.1
#                   old:
#               mariadb-server:
#                   ----------
#                   new:
#                       1:10.1.48-0ubuntu0.18.04.1
#                   old:
#               mariadb-server-10.1:
#                   ----------
#                   new:
#                       1:10.1.48-0ubuntu0.18.04.1
#                   old:
#               mariadb-server-core-10.1:
#                   ----------
#                   new:
#                       1:10.1.48-0ubuntu0.18.04.1
#                   old:
#               mysql-common:
#                   ----------
#                   new:
#                       5.8+1.0.4
#                   old:
#               socat:
#                   ----------
#                   new:
#                       1.7.3.2-2ubuntu2
#                   old:
# ----------
#           ID: mysql_config
#     Function: file.managed
#         Name: /etc/mysql/my.cnf
#       Result: True
#      Comment: File /etc/mysql/my.cnf updated
#      Started: 21:43:18.297500
#     Duration: 1085.629 ms
#      Changes:   
#               ----------
#               diff:
#                   --- 
#                   +++ 
#                   @@ -1,23 +1,41 @@
#                   -# The MariaDB configuration file
#                   -#
#                   -# The MariaDB/MySQL tools read configuration files in the following order:
#                   -# 1. "/etc/mysql/mariadb.cnf" (this file) to set global defaults,
#                   -# 2. "/etc/mysql/conf.d/*.cnf" to set global options.
#                   -# 3. "/etc/mysql/mariadb.conf.d/*.cnf" to set MariaDB-only options.
#                   -# 4. "~/.my.cnf" to set user-specific options.
#                   -#
#                   -# If the same option is defined multiple times, the last one will apply.
#                   -#
#                   -# One can use all long options that the program supports.
#                   -# Run program with --help to get a list of available options and with
#                   -# --print-defaults to see which it would actually understand and use.
#                   +# DO NOT CHANGE THIS FILE!
#                   +# This config is generated by SALTSTACK
#                   +# and all change will be overrided on next salt call
#                    
#                   -#
#                   -# This group is read both both by the client and the server
#                   -# use it for options that affect everything
#                   -#
#                   -[client-server]
#                   +[client]
#                   +port                                    = 3306
#                   +socket                                  = /var/run/mysqld/mysqld.sock
#                    
#                   -# Import all .cnf files from configuration directory
#                   +[mysqld_safe]
#                   +nice                                    = 0
#                   +socket                                  = /var/run/mysqld/mysqld.sock
#                   +
#                   +[mysqld]
#                   +basedir                                 = /usr
#                   +bind_address                            = 0.0.0.0
#                   +datadir                                 = /var/lib/mysql
#                   +expire_logs_days                        = 10
#                   +key_buffer_size                         = 16M
#                   +lc_messages_dir                         = /usr/share/mysql
#                   +log_error                               = /var/log/mysql/error.log
#                   +max_allowed_packet                      = 16M
#                   +max_binlog_size                         = 100M
#                   +pid_file                                = /var/run/mysqld/mysqld.pid
#                   +port                                    = 3306
#                   +skip_external_locking
#                   +socket                                  = /var/run/mysqld/mysqld.sock
#                   +thread_cache_size                       = 8
#                   +thread_stack                            = 192K
#                   +tmpdir                                  = /tmp
#                   +user                                    = mysql
#                   +
#                   +[mysqldump]
#                   +max_allowed_packet                      = 16M
#                   +quick
#                   +quote_names
#                   +
#                   +[isamchk]
#                   +key_buffer_size                         = 16M
#                   +
#                    !includedir /etc/mysql/conf.d/
#                   -!includedir /etc/mysql/mariadb.conf.d/
#                   +
# ----------
#           ID: mysql_python
#     Function: pkg.installed
#         Name: python3-mysqldb
#       Result: True
#      Comment: The following packages were installed/updated: python3-mysqldb
#      Started: 21:43:19.393865
#     Duration: 18695.368 ms
#      Changes:   
#               ----------
#               python3-mysqldb:
#                   ----------
#                   new:
#                       1.3.10-1build1
#                   old:
# ----------
#           ID: mysql_additional_config
#     Function: file.managed
#         Name: /usr/my.cnf
#       Result: True
#      Comment: File /usr/my.cnf is not present and is not set for creation
#      Started: 21:43:38.165146
#     Duration: 3.812 ms
#      Changes:   
# ----------
#           ID: mysqld-service-running
#     Function: service.running
#         Name: mysql
#       Result: True
#      Comment: Service restarted
#      Started: 21:43:38.269795
#     Duration: 8291.753 ms
#      Changes:   
#               ----------
#               mysql:
#                   True
# ----------
#           ID: mysql_what_is_status_of_mysql
#     Function: cmd.run
#         Name: service mysql status
#       Result: True
#      Comment: State was not run because onfail req did not change
#      Started: 21:43:46.580602
#     Duration: 0.012 ms
#      Changes:   
# 
# Summary for minion3
# -------------
# Succeeded: 11 (changed=6)
# Failed:     0
# -------------
# Total states run:     11
# Total run time:  105.561 s

# Conecte no minion3 e valide o acesso ao banco de dados MySQL:
# mysql -u root -pPassw0rd123 -h localhost

# Welcome to the MariaDB monitor.  Commands end with ; or \g.
# Your MariaDB connection id is 31
# Server version: 10.1.48-MariaDB-0ubuntu0.18.04.1 Ubuntu 18.04
# 
# Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.
# 
# Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
# 
# MariaDB [(none)]> show databases;
# +--------------------+
# | Database           |
# +--------------------+
# | information_schema |
# | mysql              |
# | performance_schema |
# +--------------------+
# 3 rows in set (0.01 sec)

# Crie um state em /srv/salt/lab08/exe03.sls com o seguinte conteúdo:
include:
  - mysql

{%- set my_databases = salt['pillar.get']('my_database', {}) %}
{%- set mysql        = salt['pillar.get']('mysql:server', {}) %}

{%- do salt.log.debug('my_databases = ' ~ my_databases) %}
{%- do salt.log.debug('mysql = ' ~ mysql) %}

{%- if my_databases is defined and my_databases|length > 0 %}
{%- for database in my_databases.items() %}
{%- do salt.log.debug('database = ' ~ database.0) %}
lab08_exe03_create_database_{{ database.0 }}:
  mysql_database.present:
    - name: {{ database.0 }}

{%- if mysql.root_user is defined and mysql.root_password is defined %}
lab08_exe03_create_mysql_user_{{ database.1.user }}:
  mysql_user.present:
    - name: {{ database.1.user }}
    - password: "{{ database.1.password }}"
    - connection_host: "localhost"
    - connection_user: "{{ mysql.root_user }}"
    - connection_pass: "{{ mysql.root_password }}"
    - connection_charset: utf8
    - saltenv:
      - LC_ALL: "en_US.utf8"

lab08_exe03_grant_permissions_for_database_{{ database.0 }}:
  mysql_grants.present:
    - name: {{ database.0 }}
    - grant: all privileges
    - database: {{ database.0 }}.*
    - user: {{ database.1.user }}
    - require:
      - mysql_database: {{ database.0 }}
      - mysql_user: {{ database.1.user }}
{%- endif %}
{%- endfor %}
{%- endif %}

# Execute o state para aplicar a configuração no minion3:
# salt 'minion3' state.apply lab08.exe03

# minion3:
# ----------
#           ID: lab08_exe03_create_database_database1
#     Function: mysql_database.present
#         Name: database1
#       Result: True
#      Comment: Database database1 is already present
#      Started: 23:04:05.513967
#     Duration: 21.404 ms
#      Changes:   
# ----------
#           ID: lab08_exe03_create_mysql_user_database1
#     Function: mysql_user.present
#         Name: database1
#       Result: True
#      Comment: User database1@localhost is already present with the desired password
#      Started: 23:04:05.536525
#     Duration: 36.192 ms
#      Changes:   
# ----------
#           ID: lab08_exe03_grant_permissions_for_database_database1
#     Function: mysql_grants.present
#         Name: database1
#       Result: True
#      Comment: Grant all privileges on database1.* to database1@localhost is already present
#      Started: 23:04:05.574453
#     Duration: 19.725 ms
#      Changes:   
# ----------
#           ID: lab08_exe03_create_database_database2
#     Function: mysql_database.present
#         Name: database2
#       Result: True
#      Comment: Database database2 is already present
#      Started: 23:04:05.594430
#     Duration: 12.927 ms
#      Changes:   
# ----------
#           ID: lab08_exe03_create_mysql_user_database2
#     Function: mysql_user.present
#         Name: database2
#       Result: True
#      Comment: User database2@localhost is already present with the desired password
#      Started: 23:04:05.607656
#     Duration: 14.649 ms
#      Changes:   
# ----------
#           ID: lab08_exe03_grant_permissions_for_database_database2
#     Function: mysql_grants.present
#         Name: database2
#       Result: True
#      Comment: Grant all privileges on database2.* to database2@localhost is already present
#      Started: 23:04:05.622918
#     Duration: 28.451 ms
#      Changes:   
# ----------
#           ID: lab08_exe03_create_database_database3
#     Function: mysql_database.present
#         Name: database3
#       Result: True
#      Comment: Database database3 is already present
#      Started: 23:04:05.651725
#     Duration: 5.901 ms
#      Changes:   
# ----------
#           ID: lab08_exe03_create_mysql_user_database3
#     Function: mysql_user.present
#         Name: database3
#       Result: True
#      Comment: User database3@localhost is already present with the desired password
#      Started: 23:04:05.660172
#     Duration: 10.359 ms
#      Changes:   
# ----------
#           ID: lab08_exe03_grant_permissions_for_database_database3
#     Function: mysql_grants.present
#         Name: database3
#       Result: True
#      Comment: Grant all privileges on database3.* to database3@localhost is already present
#      Started: 23:04:05.671007
#     Duration: 67.231 ms
#      Changes:   
# 
# Summary for minion3
# ------------
# Succeeded: 9
# Failed:    0
# ------------
# Total states run:     9
# Total run time: 216.839 ms
