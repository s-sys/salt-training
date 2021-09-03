# Crie um state no servidor salt master para a instalação do pacote 
# htop e adicione este state no top.sls para a execução apenas no 
# minion1.

lab05_exe04_instala_htop:
  pkg.installed:
    - name: htop

# Altere o arquivo /srv/salt/top.sls adicionando a seguinte entrada:
# base:
#   'minion1':
#     - lab05.exe04

# Execute o comando abaixo para verificar se o state se encontra no
# highstate do minion1:
# salt 'minion1' state.show_top

# Aplique o highstate no minion1 e verifique o resultado:
# salt 'minion1' state.highstate

# Execute o comando abaixo para verificar se o state se encontra no
# highstate do minion2:
# salt 'minion2' state.show_top
