# Crie um state que tente instalar o pacote sysstat2 e tente repetir
# a tarefa pelo menos 5 vezes em caso de falha. Execute o state no minion5.

lab11_exe02_instala_sysstat2:
  pkg.installed:
    - name: sysstat2
    - retry:
        attempts: 5
        interval: 3

# Execute o state no minion5 e verifque a saída:
# salt 'minion5' state.apply lab11.exe02

# minion5:
# ----------
#           ID: lab11_exe02_instala_sysstat2
#     Function: pkg.installed
#         Name: sysstat2
#       Result: False
#      Comment: Attempt 1: Returned a result of "False", with the following comment: "An error was encountered while installing package(s): Zypper command failure: Running scope as unit: run-r9c82b114c9dc41968c624c10759068ce.scope
#               Package 'sysstat2' not found."
#               Attempt 2: Returned a result of "False", with the following comment: "An error was encountered while installing package(s): Zypper command failure: Running scope as unit: run-r18da00e5e099486eb86b422c70be6c2f.scope
#               Package 'sysstat2' not found."
#               Attempt 3: Returned a result of "False", with the following comment: "An error was encountered while installing package(s): Zypper command failure: Running scope as unit: run-r415e8b1938b24335b2a0f9f6c7979eb4.scope
#               Package 'sysstat2' not found."
#               Attempt 4: Returned a result of "False", with the following comment: "An error was encountered while installing package(s): Zypper command failure: Running scope as unit: run-rd0441ee0cf34470fbf3f289fc9e50c5c.scope
#               Package 'sysstat2' not found."
#               An error was encountered while installing package(s): Zypper command failure: Running scope as unit: run-r4a7a21da573840668467f29c07418472.scope
#               Package 'sysstat2' not found.
#      Started: 11:36:29.963269
#     Duration: 60979.898 ms
#      Changes:   
# 
# Summary for minion5
# ------------
# Succeeded: 0
# Failed:    1
# ------------
# Total states run:     1
# Total run time:  60.980 s
