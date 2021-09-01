# Realizar a instalação do salt-minion nos minions minion1, minion2, minion3,
# minion4 e minion5. O minion6 será utilizado futuramento para os
# laboratórios em Microsoft Windows.

# Configurar o /etc/hosts de todas as máquinas com o conteúdo abaixo:
# 192.168.1.10  master  salt
# 192.168.1.11  minion1
# 192.168.1.12  minion2
# 192.168.1.13  minion3
# 192.168.1.14  minion4
# 192.168.1.15  minion5
# 192.168.1.16  minion6

# Realizar a instalação dos minions nas máquinas minion*:
# Ubuntu
# apt clean
# apt update
# apt install salt-minion
# CentOS
# yum clean all
# yum install salt-minion
# OpenSUSE
# zypper clean
# zypper in salt-minion

# Garantir que o serviço está habilitado para execução automática após reinicialização:
# systemctl enable salt-minion.service
# systemctl start salt-minion.service

# Autorizar a chave dos minions no servidor master:
# salt-key –L
# salt-key –a minion1
# salt-key –a minion2
# salt-key -a minion3
# salt-key -A

# Verifque todas as chaves autorizadas no servidor master:
# salt-key -L
