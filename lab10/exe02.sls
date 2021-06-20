# Crie um state que instala um pacote sysstat e que execute um state de
# escrita de log em arquivo apenas se todas as condições listadas
# retornarem como False. Crie pelo menos duas validações,
# sendo que uma delas retorne como True. Execute este state no minion4.

lab10_exe02_instala_sysstat:
  pkg.installed:
    - name: htop

lab10_exe02_state_sempre_ok:
  test.succeed_without_changes

lab10_exe02_state_sempre_erro:
  test.fail_without_changes

lab10_exe02_escreve_log:
  cmd.run:
    - name: echo "Todos os itens do lab10.exe02 falharam." >> /var/log/meulog.log
    - onfail_all:
      - pkg: htop
      - id: lab10_exe02_state_sempre_ok
      - id: lab10_exe02_state_sempre_erro

# Execute o state no minion4 e verifque a saída:
# salt 'minion4' state.apply lab10.exe02

# minion4:
# ----------
#           ID: lab10_exe02_instala_sysstat
#     Function: pkg.installed
#         Name: htop
#       Result: False
#      Comment: Error occurred installing package(s). Additional info follows:
#               
#               errors:
#                   - Running scope as unit run-4177.scope.
#                     Loaded plugins: fastestmirror
#                     Loading mirror speeds from cached hostfile
#                      * base: mirrors.usinternet.com
#                      * extras: ftp.ussg.iu.edu
#                      * updates: mirrors.tummy.com
#                     No package htop available.
#                     Error: Nothing to do
#      Started: 10:22:26.114639
#     Duration: 5926.96 ms
#      Changes:   
# ----------
#           ID: lab10_exe02_state_sempre_ok
#     Function: test.succeed_without_changes
#       Result: True
#      Comment: Success!
#      Started: 10:22:32.044571
#     Duration: 10.001 ms
#      Changes:   
# ----------
#           ID: lab10_exe02_state_sempre_erro
#     Function: test.fail_without_changes
#       Result: False
#      Comment: Failure!
#      Started: 10:22:32.055186
#     Duration: 7.803 ms
#      Changes:   
# ----------
#           ID: lab10_exe02_escreve_log
#     Function: cmd.run
#         Name: echo "Todos os itens do lab10.exe02 falharam." >> /var/log/meulog.log
#       Result: True
#      Comment: State was not run because onfail req did not change
#      Started: 10:22:32.070080
#     Duration: 0.005 ms
#      Changes:   
# 
# Summary for minion4
# ------------
# Succeeded: 2
# Failed:    2
# ------------
# Total states run:     4
# Total run time:   5.945 s
