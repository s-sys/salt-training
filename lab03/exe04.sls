# Criação de um state para a criação do diretório /opt/arquivos com a permissão
# para o usuário root, grupo root e modo 755.

cria_diretorio:
  file.directory:
    - name: /opt/arquivos
    - mode: "0755"
    - user: root
    - group: root
