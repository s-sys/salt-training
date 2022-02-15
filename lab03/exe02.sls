# A partir do servidor salt-master, no diretório /srv/salt/lab03, crie
# o arquivo "exe02.sls" com o seguinte conteúdo abaixo, que fará a
# remoção do arquivo /tmp/teste.txt.

remove_arquivo:
  file.absent:
    - name: /tmp/teste.txt

# Para validar a execução do state, a partir do servidor salt-master,
# execute o seguinte comando abaixo:
#
# salt 'minion2' state.apply lab03.exe02
#
# Verifique o resultado do comando.
