# Criação de um state para a remoção do arquivo /tmp/teste.txt.

remove_arquivo:
  file.absent:
    - name: /tmp/teste.txt
