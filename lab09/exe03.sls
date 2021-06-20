# Crie um state que instale o pacote nginx e outro state para gerenciar o
# conteúdo do seu arquivo de configuração. Garanta que qualquer alteração
# no arquivo de configuração vai gerar um trigger para o reload do serviço.
# Aplique este state no minion2.

lab09_exe03_instala_nginx:
  pkg.installed:
    - name: nginx

lab09_exe03_configura_nginx:
  file.managed:
    - name: /etc/default/nginx
    - contents:
        ULIMIT="-n 4096"
        #STOP_SCHEDULE="QUIT/5/TERM/5/KILL/5"
    - user: root
    - group: root
    - mode: "0644"
    - require:
      - pkg: nginx

lab09_exe03_habilita_servico_nginx:
  service.running:
    - name: nginx.service
    - enable: True
    - watch:
      - file: /etc/default/nginx

# Execute o state no minion2 e verifque a saída:
# salt 'minion2' state.apply lab09.exe03

# minion2:
# ----------
#           ID: lab09_exe03_instala_nginx
#     Function: pkg.installed
#         Name: nginx
#       Result: True
#      Comment: The following packages were installed/updated: nginx
#      Started: 13:06:52.461418
#     Duration: 28808.769 ms
#      Changes:   
#               ----------
#               fontconfig-config:
#                   ----------
#                   new:
#                       2.13.1-2ubuntu3
#                   old:
#               fonts-dejavu-core:
#                   ----------
#                   new:
#                       2.37-1
#                   old:
#               libfontconfig1:
#                   ----------
#                   new:
#                       2.13.1-2ubuntu3
#                   old:
#               libgd3:
#                   ----------
#                   new:
#                       2.2.5-5.2ubuntu2
#                   old:
#               libjbig0:
#                   ----------
#                   new:
#                       2.1-3.1build1
#                   old:
#               libjpeg-turbo8:
#                   ----------
#                   new:
#                       2.0.3-0ubuntu1.20.04.1
#                   old:
#               libjpeg8:
#                   ----------
#                   new:
#                       8c-2ubuntu8
#                   old:
#               libnginx-mod-http-image-filter:
#                   ----------
#                   new:
#                       1.18.0-0ubuntu1.2
#                   old:
#               libnginx-mod-http-xslt-filter:
#                   ----------
#                   new:
#                       1.18.0-0ubuntu1.2
#                   old:
#               libnginx-mod-mail:
#                   ----------
#                   new:
#                       1.18.0-0ubuntu1.2
#                   old:
#               libnginx-mod-stream:
#                   ----------
#                   new:
#                       1.18.0-0ubuntu1.2
#                   old:
#               libtiff5:
#                   ----------
#                   new:
#                       4.1.0+git191117-2ubuntu0.20.04.1
#                   old:
#               libwebp6:
#                   ----------
#                   new:
#                       0.6.1-2ubuntu0.20.04.1
#                   old:
#               libxpm4:
#                   ----------
#                   new:
#                       1:3.5.12-1
#                   old:
#               nginx:
#                   ----------
#                   new:
#                       1.18.0-0ubuntu1.2
#                   old:
#               nginx-common:
#                   ----------
#                   new:
#                       1.18.0-0ubuntu1.2
#                   old:
#               nginx-core:
#                   ----------
#                   new:
#                       1.18.0-0ubuntu1.2
#                   old:
# ----------
#           ID: lab09_exe03_configura_nginx
#     Function: file.managed
#         Name: /etc/default/nginx
#       Result: True
#      Comment: File /etc/default/nginx updated
#      Started: 13:07:21.300365
#     Duration: 60.124 ms
#      Changes:   
#               ----------
#               diff:
#                   --- 
#                   +++ 
#                   @@ -1,10 +1 @@
#                   -# Note: You may want to look at the following page before setting the ULIMIT.
#                   -#  http://wiki.nginx.org/CoreModule#worker_rlimit_nofile
#                   -# Set the ulimit variable if you need defaults to change.
#                   -#  Example: ULIMIT="-n 4096"
#                   -#ULIMIT="-n 4096"
#                   -
#                   -# Define the stop schedule for nginx
#                   -# see the start-stop-daemon --retry documentation for more information
#                   -#
#                   -#STOP_SCHEDULE="QUIT/5/TERM/5/KILL/5"
#                   +ULIMIT="-n 4096"
# ----------
#           ID: lab09_exe03_habilita_servico_nginx
#     Function: service.running
#         Name: nginx.service
#       Result: True
#      Comment: Service restarted
#      Started: 13:07:21.481224
#     Duration: 3976.79 ms
#      Changes:   
#               ----------
#               nginx.service:
#                   True
# 
# Summary for minion2
# ------------
# Succeeded: 3 (changed=3)
# Failed:    0
# ------------
# Total states run:     3
# Total run time:  32.846 s
