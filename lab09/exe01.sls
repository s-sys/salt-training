# Crie um state que instale um pacote chamado sysstat e force para que este
# state seja executado antes de todos os demais states.

lab09_exe01_instala_sysstat:
  pkg.installed:
    - name: sysstat
    - order: first

# Altere o arquivo /srv/salt/top.sls para incluir o seguinte trecho:
# base:
#   'minion5':
#     - lab09.exe01

# Execute o highstate no minion5 e verifque a saída:
# salt 'minion5' state.highstate

# minion5:
# ----------
#           ID: lab09_exe01_instala_sysstat
#     Function: pkg.installed
#         Name: sysstat
#       Result: True
#      Comment: The following packages were installed/updated: sysstat
#      Started: 09:42:26.758507
#     Duration: 75247.035 ms
#      Changes:   
#               ----------
#               metamail:
#                   ----------
#                   new:
#                       2.7.19-lp152.3.6
#                   old:
#               procmail:
#                   ----------
#                   new:
#                       3.22-lp152.4.5
#                   old:
#               sharutils:
#                   ----------
#                   new:
#                       4.15.2-lp152.4.7
#                   old:
#               sharutils-lang:
#                   ----------
#                   new:
#                       4.15.2-lp152.4.7
#                   old:
#               sysstat:
#                   ----------
#                   new:
#                       12.0.2-lp152.9.7.1
#                   old:
# ----------
#           ID: openssh
#     Function: pkg.installed
#       Result: True
#      Comment: All specified packages are already installed
#      Started: 09:43:42.133796
#     Duration: 50.004 ms
#      Changes:   
# ----------
#           ID: openssh
#     Function: service.running
#         Name: sshd
#       Result: True
#      Comment: The service sshd is already running
#      Started: 09:43:57.501668
#     Duration: 96.825 ms
#      Changes:   
# 
# Summary for minion5
# ------------
# Succeeded: 3 (changed=1)
# Failed:    0
# ------------
# Total states run:     3
# Total run time:  75.394 s

# Para consultar a numeração atribuída, execute o lowstate do minion5:
# salt 'minion5' state.show_lowstate

# minion5:
#     |_
#       ----------
#       __env__:
#           base
#       __id__:
#           lab09_exe01_instala_sysstat
#       __sls__:
#           lab09.exe01
#       fun:
#           installed
#       name:
#           sysstat
#       order:
#           0
#       state:
#           pkg
#     |_
#       ----------
#       __env__:
#           base
#       __id__:
#           openssh
#       __sls__:
#           openssh
#       fun:
#           installed
#       name:
#           openssh
#       order:
#           10000
#       state:
#           pkg
#     |_
#       ----------
#       __env__:
#           base
#       __id__:
#           openssh
#       __sls__:
#           openssh
#       enable:
#           True
#       fun:
#           running
#       name:
#           sshd
#       order:
#           10001
#       require:
#           |_
#             ----------
#             pkg:
#                 openssh
#       state:
#           service
