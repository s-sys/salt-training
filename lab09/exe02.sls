# Crie um state que instale um pacote chamado sysstat e outro state para
# instalar o pacote htop e garanta que o pacote sysstat seja instalado
# antes pacote htop.

lab09_exe02_instala_sysstat:
  pkg.installed:
    - name: sysstat

lab09_exe02_instala_htop:
  pkg.installed:
    - name: htop
    - require:
      - pkg: sysstat

# Execute o state no minion5 e verifque a saída:
# salt 'minion5' state.apply lab09.exe02

# minion5:
# ----------
#           ID: lab09_exe02_instala_sysstat
#     Function: pkg.installed
#         Name: sysstat
#       Result: True
#      Comment: All specified packages are already installed
#      Started: 09:53:02.271198
#     Duration: 37785.08 ms
#      Changes:   
# ----------
#           ID: lab09_exe02_instala_htop
#     Function: pkg.installed
#         Name: htop
#       Result: True
#      Comment: All specified packages are already installed
#      Started: 09:53:40.057534
#     Duration: 21.333 ms
#      Changes:   
# 
# Summary for minion5
# ------------
# Succeeded: 2
# Failed:    0
# ------------
# Total states run:     2
# Total run time:  37.806 s
