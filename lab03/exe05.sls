# A partir do servidor salt-master, no diretório /srv/salt/lab03, crie
# o arquivo "exe05.sls" com o seguinte conteúdo abaixo, que irá garantir
# que o serviço de ssh esteja sempre em execução mesmo após o reboot.

executa_ssh:
  service.running:
    - name: ssh.service
    - enable: True

# Para validar a execução do state, a partir do servidor salt-master,
# execute o seguinte comando abaixo:
#
# salt 'minion1' state.apply lab03.exe05
#
# Verifique o resultado do comando.
