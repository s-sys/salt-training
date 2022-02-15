# A partir do servidor salt-master, no diretório /srv/salt/lab03, crie
# o arquivo "exe06.sls" com o seguinte conteúdo abaixo, que fará a
# criação do usuário teste no sistema.

adiciona_usuario:
  user.present:
    - name: teste
    - fullname: Usuario de Teste
    - home: /home/teste
    - shell: /bin/bash

# Para validar a execução do state, a partir do servidor salt-master,
# execute o seguinte comando abaixo:
#
# salt 'minion3' state.apply lab03.exe06
#
# Verifique o resultado do comando.
