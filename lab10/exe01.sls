# Crie um state que instala um pacote sysstat e se registre como require
# em outro state que instala um pacote chamado htop. Execute este state
# no minion5.

lab10_exe01_instala_htop:
  pkg.installed:
    - name: htop

lab10_exe01_instala_sysstat:
  pkg.installed:
    - name: sysstat
    - require_in:
      - pkg: htop

# Execute o state no minion5 e verifque a saída:
# salt 'minion5' state.apply lab10.exe01

# minion5:
# ----------
#           ID: lab10_exe01_instala_sysstat
#     Function: pkg.installed
#         Name: sysstat
#       Result: True
#      Comment: All specified packages are already installed
#      Started: 10:32:25.970931
#     Duration: 34717.584 ms
#      Changes:   
# ----------
#           ID: lab10_exe01_instala_htop
#     Function: pkg.installed
#         Name: htop
#       Result: True
#      Comment: All specified packages are already installed
#      Started: 10:33:00.689448
#     Duration: 17.109 ms
#      Changes:   
# 
# Summary for minion5
# ------------
# Succeeded: 2
# Failed:    0
# ------------
# Total states run:     2
# Total run time:  34.735 s
