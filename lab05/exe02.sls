# Criar uma expressão para a execução do state test.ping apenas nas máquinas
# cujo sistema operacional seja Linux and possua 980MB de memória RAM.

# salt -C 'G@kernel:Linux and G@mem_total:980' test.ping
