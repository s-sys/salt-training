# Crie um state que instale o pacote sysstat apenas se existir o arquivo
# /root/verificar.txt no sistema. Execute o state no minion5.

lab11_exe01_instala_sysstat:
  pkg.installed:
    - name: sysstat
    - onlyif:
      - test -f /root/verificar.txt

# Execute o state no minion5 e verifque a saída:
# salt 'minion5' state.apply lab11.exe01

# minion5:
# ----------
#           ID: lab11_exe01_instala_sysstat
#     Function: pkg.installed
#         Name: sysstat
#       Result: True
#      Comment: onlyif condition is false
#      Started: 11:33:25.145689
#     Duration: 1804.474 ms
#      Changes:   
# 
# Summary for minion5
# ------------
# Succeeded: 1
# Failed:    0
# ------------
# Total states run:     1
# Total run time:   1.804 s
