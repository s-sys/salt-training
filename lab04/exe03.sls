# Crie um grain chamado "funcoes" que contenha uma lista de pacotes.
# Em atividades futuras vamos utilizar este grains para instalar os pacotes.

# Altere o arquivo /etc/salt/minion.d/grains.conf e inclua o conteúdo:
grains:
  funcoes:
    - htop
    - sysstat

# Verifique se o grains foi definido:
#
# salt-call --local grains.item funcoes
