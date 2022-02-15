# A partir do servidor salt-master, no diretório /srv/salt/lab03, crie
# o arquivo "exe01.sls" com o seguinte conteúdo abaixo, que fará a
# instalação do pacote htop.

instalar_htop:
  pkg.installed:
    - name: htop

# Para validar a execução do state, a partir do servidor salt-master,
# execute o seguinte comando abaixo:
#
# salt 'minion1' state.apply lab03.exe01
#
# Verifique o resultado do comando.
