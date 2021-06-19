# Utilize a formula openssh-formula para instalar o servidor SSH e configurar
# o parâmetro  X11Forwarding como ‘yes’ em todos os minion Linux.

# No servidor salt master faça um clone da formula openssh-formula do github:
# mkdir -p /opt/salt-formulas
# cd /opt/salt-formulas
# git clone https://github.com/saltstack-formulas/openssh-formula

# Altere o arquivo /etc/salt/master.d/fileroots.conf com o seguinte conteúdo:
# file_roots:
#   base:
#     - /srv/salt
#     - /opt/salt-formulas/vim-formula
#     - /opt/salt-formulas/openssh-formula

# Após a criação do arquivo o salt master deve ser reiniciado:
# systemctl restart salt-master.service

# Altere o arquivo /srv/salt/top.sls para adicionar uma entrada para a
# execução da fórmula openssh em todos os minions Linux da seguinte forma:
# base:
#   'G@kernel:Linux':
#     - openssh

# Crie o arquivo /srv/pillar/lab08/openssh.sls com o seguinte conteúdo:
# sshd_config:
#   X11Forwarding: 'yes'

# Altere o arquivo /srv/pillar/top.sls para adicionar o seguinte conteúdo:
# base:
#   'G@kernel:Linux':
#     - lab08.openssh

# Pode ser necessário forçar a atualização dos pillar em todos os minions:
# salt '*' saltutil.refresh_pillar

# Execute o highstate para todos os minions Linux e observe o resultado:
# salt -G 'kernel:Linux' state.highstate

# minion3:
# ----------
#           ID: openssh
#     Function: pkg.installed
#         Name: openssh-server
#       Result: True
#      Comment: All specified packages are already installed
#      Started: 21:09:08.785250
#     Duration: 283.457 ms
#      Changes:   
# ----------
#           ID: openssh
#     Function: service.running
#         Name: ssh
#       Result: True
#      Comment: The service ssh is already running
#      Started: 21:09:09.074570
#     Duration: 255.985 ms
#      Changes:   
# 
# Summary for minion3
# ------------
# Succeeded: 2
# Failed:    0
# ------------
# Total states run:     2
# Total run time: 539.442 ms
# minion1:
# ----------
#           ID: lab05_exe04_instala_htop
#     Function: pkg.installed
#         Name: htop
#       Result: True
#      Comment: All specified packages are already installed
#      Started: 21:09:09.778930
#     Duration: 172.409 ms
#      Changes:   
# ----------
#           ID: openssh
#     Function: pkg.installed
#         Name: openssh-server
#       Result: True
#      Comment: All specified packages are already installed
#      Started: 21:09:09.952187
#     Duration: 35.056 ms
#      Changes:   
# ----------
#           ID: openssh
#     Function: service.running
#         Name: ssh
#       Result: True
#      Comment: The service ssh is already running
#      Started: 21:09:10.096571
#     Duration: 271.609 ms
#      Changes:   
# 
# Summary for minion1
# ------------
# Succeeded: 3
# Failed:    0
# ------------
# Total states run:     3
# Total run time: 479.074 ms
# minion2:
# ----------
#           ID: openssh
#     Function: pkg.installed
#         Name: openssh-server
#       Result: True
#      Comment: All specified packages are already installed
#      Started: 21:09:10.987171
#     Duration: 176.907 ms
#      Changes:   
# ----------
#           ID: openssh
#     Function: service.running
#         Name: ssh
#       Result: True
#      Comment: The service ssh is already running
#      Started: 21:09:11.195884
#     Duration: 248.681 ms
#      Changes:   
# 
# Summary for minion2
# ------------
# Succeeded: 2
# Failed:    0
# ------------
# Total states run:     2
# Total run time: 425.588 ms
# minion4:
# ----------
#           ID: lab05_exe05_instala_sysstat
#     Function: pkg.installed
#         Name: sysstat
#       Result: True
#      Comment: All specified packages are already installed
#      Started: 17:09:15.107124
#     Duration: 2243.323 ms
#      Changes:   
# ----------
#           ID: vim
#     Function: pkg.installed
#       Result: True
#      Comment: All specified packages are already installed
#      Started: 17:09:17.351425
#     Duration: 64.093 ms
#      Changes:   
# ----------
#           ID: /etc/vimrc
#     Function: file.managed
#       Result: True
#      Comment: File /etc/vimrc is in the correct state
#      Started: 17:09:17.420752
#     Duration: 267.516 ms
#      Changes:   
# ----------
#           ID: openssh
#     Function: pkg.installed
#         Name: openssh-server
#       Result: True
#      Comment: All specified packages are already installed
#      Started: 17:09:17.688909
#     Duration: 68.703 ms
#      Changes:   
# ----------
#           ID: openssh
#     Function: service.running
#         Name: sshd
#       Result: True
#      Comment: The service sshd is already running
#      Started: 17:09:17.760821
#     Duration: 137.037 ms
#      Changes:   
# 
# Summary for minion4
# ------------
# Succeeded: 5
# Failed:    0
# ------------
# Total states run:     5
# Total run time:   2.781 s
# minion5:
# ----------
#           ID: openssh
#     Function: pkg.installed
#       Result: True
#      Comment: All specified packages are already installed
#      Started: 18:09:26.470236
#     Duration: 50198.364 ms
#      Changes:   
# ----------
#           ID: openssh
#     Function: service.running
#         Name: sshd
#       Result: True
#      Comment: The service sshd is already running
#      Started: 18:10:16.678308
#     Duration: 134.456 ms
#      Changes:   
# 
# Summary for minion5
# ------------
# Succeeded: 2
# Failed:    0
# ------------
# Total states run:     2
# Total run time:  50.333 s
