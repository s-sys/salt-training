# Crie um state para instalar um pacote chamado sysstat2 e que em caso
# de falha adicione uma mensagem de erro no arquivo /var/log/meulog.log.
# Execute este state no minion4.

lab09_exe04_instala_sysstat2:
  pkg.installed:
    - name: sysstat2

lab09_exe04_grava_log_erro:
  cmd.run:
    - name: echo "Erro na instalação da aplicação sysstat2." >> /var/log/meulog.log
    - onfail:
      - pkg: sysstat2

# Execute o state no minion4 e verifque a saída:
# salt 'minion4' state.apply lab09.exe04

# minion4:
# ----------
#           ID: lab09_exe04_instala_sysstat2
#     Function: pkg.installed
#         Name: sysstat2
#       Result: False
#      Comment: Error occurred installing package(s). Additional info follows:
#               
#               errors:
#                   - Running scope as unit run-3829.scope.
#                     Loaded plugins: fastestmirror
#                     Loading mirror speeds from cached hostfile
#                      * base: mirrors.usinternet.com
#                      * extras: ftp.ussg.iu.edu
#                      * updates: ftp.ussg.iu.edu
#                     No package sysstat2 available.
#                     Error: Nothing to do
#      Started: 09:13:05.236803
#     Duration: 9977.77 ms
#      Changes:   
# ----------
#           ID: lab09_exe04_grava_log_erro
#     Function: cmd.run
#         Name: echo "Erro na instalação da aplicação sysstat2." >> /var/log/meulog.log
#       Result: True
#      Comment: Command "echo "Erro na instalação da aplicação sysstat2." >> /var/log/meulog.log" run
#      Started: 09:13:15.240836
#     Duration: 20.966 ms
#      Changes:   
#               ----------
#               pid:
#                   3863
#               retcode:
#                   0
#               stderr:
#               stdout:
# 
# Summary for minion4
# ------------
# Succeeded: 1 (changed=1)
# Failed:    1
# ------------
# Total states run:     2
# Total run time:   9.999 s

# Verifique o conteúdo do arquivo /var/log/meulog.log no minion4:
# salt 'minion4' cmd.run 'cat /var/log/meulog.log'

# minion4:
#     Erro na instalação da aplicação sysstat2.
