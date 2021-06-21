# Utilize o mecanimos de salt-ssh para realizar a execução de comandos remotos
# nos "minions" do ambiente.

# Instale o pacote salt-ssh no servidor salt master:
# apt install salt-ssh

# Crie o arquivo /etc/salt/master.d/roster.conf com o seguinte conteúdo:
# roster_defaults:
#   user: ubuntu
#   passwd: linux
#   sudo: True
#   tty: True

# Crie o arquivo /etc/salt/roster com o seguinte conteúdo:
# minion1:
#   host: minion1
# minion2:
#   host: minion2
# minion3:
#   host: minion3
# minion4:
#   host: minion4
#   user: root
#   passwd: linux
# minion5:
#   host: minion5
#   user: root
#   passwd: linux

# Execute o comando abaixo para validar a execução do salt-ssh:
# salt-ssh -i 'minion1' cmd.run 'ifconfig'

# minion1:
#     enp1s0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
#             inet 192.168.1.11  netmask 255.255.255.0  broadcast 192.168.1.255
#             inet6 fe80::5054:ff:feff:2  prefixlen 64  scopeid 0x20<link>
#             ether 52:54:00:ff:00:02  txqueuelen 1000  (Ethernet)
#             RX packets 19580  bytes 12626019 (12.6 MB)
#             RX errors 0  dropped 15508  overruns 0  frame 0
#             TX packets 3647  bytes 427210 (427.2 KB)
#             TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
#     
#     lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
#             inet 127.0.0.1  netmask 255.0.0.0
#             inet6 ::1  prefixlen 128  scopeid 0x10<host>
#             loop  txqueuelen 1000  (Local Loopback)
#             RX packets 226  bytes 19842 (19.8 KB)
#             RX errors 0  dropped 0  overruns 0  frame 0
#             TX packets 226  bytes 19842 (19.8 KB)
#             TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
