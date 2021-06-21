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
