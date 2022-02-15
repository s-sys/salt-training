# Criação de um grain customizado chamado "sala" para conter a informação sobre
# a sala onde o equipamento se encontra. Faça a criação do grain e teste
# sua funcionalidade.

# Criar o arquivo /etc/salt/minion.d/grains.conf com o seguinte conteúdo:
# grains:
#   sala: "Sala 01"

# Verifique se o grains foi definido:
#
# salt-call --local grains.item sala

# Em algumas situações pode ser necessário instruir o minion para atualizar
# as informações dos grains com o comando abaixo:
#
# salt-call --local saltutil.refresh_grains
