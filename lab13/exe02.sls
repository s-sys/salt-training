# Crie um orchestrate que crie um arquivo /tmp/valida.txt em todos os minions
# Linux do ambiente. A criação do arquivo deve ocorrer na ordem do minion1,
# minion2, minion3, minion4 e minion5 e dentro do arquivo deve existir a
# saída do comando date do momento de criação do arquivo.

# Crie o state /srv/salt/lab13/exe02_arquivo.sls com o seguinte conteúdo:
# lab13_exe02_cria_arquivo:
#   file.managed:
#     - name: /tmp/valida.txt
#     - contents: {{ salt['cmd.run']('date') }}
#     - user: root
#     - group: root
#     - mode: "0644"

# Crie o arquivo de orchestrate em /srv/salt/lab13/exe02_orch.sls para
# definir as ações de orquestração:
lab13_exe02_cria_arquivo_minion1:
  salt.state:
    - tgt: 'minion1'
    - sls:
      - lab13.exe02_arquivo

lab13_exe02_cria_arquivo_minion2:
  salt.state:
    - tgt: 'minion2'
    - sls:
      - lab13.exe02_arquivo
    - require:
      - salt: lab13_exe02_cria_arquivo_minion1

lab13_exe02_cria_arquivo_minion3:
  salt.state:
    - tgt: 'minion3'
    - sls:
      - lab13.exe02_arquivo
    - require:
      - salt: lab13_exe02_cria_arquivo_minion2

lab13_exe02_cria_arquivo_minion4:
  salt.state:
    - tgt: 'minion4'
    - sls:
      - lab13.exe02_arquivo
    - require:
      - salt: lab13_exe02_cria_arquivo_minion3

lab13_exe02_cria_arquivo_minion5:
  salt.state:
    - tgt: 'minion5'
    - sls:
      - lab13.exe02_arquivo
    - require:
      - salt: lab13_exe02_cria_arquivo_minion4

# Execute a orquestração e verifque a saída:
# salt-run state.orch lab13.exe02_orch

# master_master:
# ----------
#           ID: lab13_exe02_cria_arquivo_minion1
#     Function: salt.state
#       Result: True
#      Comment: States ran successfully. Updating minion1.
#      Started: 19:54:55.253869
#     Duration: 1063.812 ms
#      Changes:   
#               minion1:
#               ----------
#                         ID: lab13_exe02_cria_arquivo
#                   Function: file.managed
#                       Name: /tmp/valida.txt
#                     Result: True
#                    Comment: File /tmp/valida.txt updated
#                    Started: 19:54:56.119756
#                   Duration: 59.568 ms
#                    Changes:   
#                             ----------
#                             diff:
#                                 New file
#                             mode:
#                                 0644
#               
#               Summary for minion1
#               ------------
#               Succeeded: 1 (changed=1)
#               Failed:    0
#               ------------
#               Total states run:     1
#               Total run time:  59.568 ms
# ----------
#           ID: lab13_exe02_cria_arquivo_minion2
#     Function: salt.state
#       Result: True
#      Comment: States ran successfully. Updating minion2.
#      Started: 19:54:56.318843
#     Duration: 908.541 ms
#      Changes:   
#               minion2:
#               ----------
#                         ID: lab13_exe02_cria_arquivo
#                   Function: file.managed
#                       Name: /tmp/valida.txt
#                     Result: True
#                    Comment: File /tmp/valida.txt updated
#                    Started: 19:54:57.052605
#                   Duration: 24.317 ms
#                    Changes:   
#                             ----------
#                             diff:
#                                 New file
#                             mode:
#                                 0644
#               
#               Summary for minion2
#               ------------
#               Succeeded: 1 (changed=1)
#               Failed:    0
#               ------------
#               Total states run:     1
#               Total run time:  24.317 ms
# ----------
#           ID: lab13_exe02_cria_arquivo_minion3
#     Function: salt.state
#       Result: True
#      Comment: States ran successfully. Updating minion3.
#      Started: 19:54:57.228069
#     Duration: 859.601 ms
#      Changes:   
#               minion3:
#               ----------
#                         ID: lab13_exe02_cria_arquivo
#                   Function: file.managed
#                       Name: /tmp/valida.txt
#                     Result: True
#                    Comment: File /tmp/valida.txt updated
#                    Started: 19:54:57.918909
#                   Duration: 27.587 ms
#                    Changes:   
#                             ----------
#                             diff:
#                                 New file
#                             mode:
#                                 0644
#               
#               Summary for minion3
#               ------------
#               Succeeded: 1 (changed=1)
#               Failed:    0
#               ------------
#               Total states run:     1
#               Total run time:  27.587 ms
# ----------
#           ID: lab13_exe02_cria_arquivo_minion4
#     Function: salt.state
#       Result: True
#      Comment: States ran successfully. Updating minion4.
#      Started: 19:54:58.089062
#     Duration: 1229.293 ms
#      Changes:   
#               minion4:
#               ----------
#                         ID: lab13_exe02_cria_arquivo
#                   Function: file.managed
#                       Name: /tmp/valida.txt
#                     Result: True
#                    Comment: File /tmp/valida.txt updated
#                    Started: 15:54:59.119446
#                   Duration: 42.603 ms
#                    Changes:   
#                             ----------
#                             diff:
#                                 New file
#                             mode:
#                                 0644
#               
#               Summary for minion4
#               ------------
#               Succeeded: 1 (changed=1)
#               Failed:    0
#               ------------
#               Total states run:     1
#               Total run time:  42.603 ms
# ----------
#           ID: lab13_exe02_cria_arquivo_minion5
#     Function: salt.state
#       Result: True
#      Comment: States ran successfully. Updating minion5.
#      Started: 19:54:59.319060
#     Duration: 1269.326 ms
#      Changes:   
#               minion5:
#               ----------
#                         ID: lab13_exe02_cria_arquivo
#                   Function: file.managed
#                       Name: /tmp/valida.txt
#                     Result: True
#                    Comment: File /tmp/valida.txt updated
#                    Started: 16:55:00.362882
#                   Duration: 66.485 ms
#                    Changes:   
#                             ----------
#                             diff:
#                                 New file
#                             mode:
#                                 0644
#               
#               Summary for minion5
#               ------------
#               Succeeded: 1 (changed=1)
#               Failed:    0
#               ------------
#               Total states run:     1
#               Total run time:  66.485 ms
# 
# Summary for master_master
# ------------
# Succeeded: 5 (changed=5)
# Failed:    0
# ------------
# Total states run:     5
# Total run time:   5.331 s


# Verifique o conteúdo dos arquivos:
# salt '*' cmd.run 'cat /tmp/valida.txt'

# minion1:
#     Sun Jun 20 19:54:56 UTC 2021
# minion2:
#     Sun Jun 20 19:54:57 UTC 2021
# minion3:
#     Sun Jun 20 19:54:57 UTC 2021
# minion4:
#     Sun Jun 20 15:54:59 EDT 2021
# minion5:
#     Sun Jun 20 16:55:00 -03 2021
