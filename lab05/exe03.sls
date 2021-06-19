# Criar uma expressão para a execução do state test.ping apenas nas máquinas
# cujo sistema operacional seja Linux, possua pelo menos 2 cores e seja uma
#  máquina virtual em plataforma KVM.

# salt -C 'G@kernel:Linux and not G@num_cpus:1 and G@virtual:kvm' test.ping
