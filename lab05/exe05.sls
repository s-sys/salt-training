# Crie um state no servidor salt master para a instalação do pacote
# sysstat e adicione este state no top.sls para a execução em todos
# os minions que sejam Linux com a distribuição CentOS 7.

lab05_exe05_instala_sysstat:
  pkg.installed:
    - name: sysstat

# Altere o arquivo /srv/salt/top.sls adicionando a seguinte entrada:
# base:
#   'G@os:CentOS and G@osmajorrelease:7':
#     - lab05.exe05

# Execute o comando abaixo para verificar se o state se encontra no
# highstate do minion3:
# salt 'minion3' state.show_top

# Execute o comando abaixo para verificar se o state se encontra no
# highstate do minion4:
# salt 'minion4' state.show_top

# Aplique o highstate no minion1 e verifique o resultado:
# salt 'minion4' state.highstate
