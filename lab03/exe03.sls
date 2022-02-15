# A partir do servidor salt-master, no diretório /srv/salt/lab03, crie
# o arquivo "exe03.sls" com o seguinte conteúdo abaixo, que fará a
# execução do comando /root/script.sh.

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

# Para validar a execução do state, a partir do servidor salt-master,
# execute o seguinte comando abaixo:
#
# salt 'minion1' state.apply lab03.exe03
#
# Verifique o resultado do comando.
