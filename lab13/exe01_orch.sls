lab13_exe01_instala_mysql:
  salt.state:
    - tgt: 'minion5'
    - sls:
      - lab13.exe01_mysql

lab13_exe01_instala_apache:
  salt.state:
    - tgt: 'minion4'
    - sls:
      - lab13.exe01_apache
    - require:
      - salt: lab13_exe01_instala_mysql
