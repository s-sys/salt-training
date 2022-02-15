# A partir do servidor salt-master, no diretório /srv/salt/lab03, crie
# o arquivo "exe04.sls" com o seguinte conteúdo abaixo, que fará a
# criação do diretório /opt/arquivos com a permissão para o usuário
# root, grupo root e modo 755.

cria_diretorio:
  file.directory:
    - name: /opt/arquivos
    - mode: "0755"
    - user: root
    - group: root

# Para validar a execução do state, a partir do servidor salt-master,
# execute o seguinte comando abaixo:
#
# salt 'minion3' state.apply lab03.exe04
#
# Verifique o resultado do comando.
