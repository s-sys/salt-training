#  Criação de um state para a execução do comando /root/script.sh.

cria_script:
  file.managed:
    - name: /root/script.sh
    - contents: |
        #!/bin/bash
        echo "Hello world!"
    - user: root
    - group: root
    - mode: "0755"

executa_script:
  cmd.run:
    - name: /root/script.sh
    - require:
      - file: /root/script.sh
