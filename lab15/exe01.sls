# Instale e configure o salt-minion para Microsoft Windows no minion6 e
# realize testes de conectividade.

# No salt-master instale os repositórios de pacotes para Microsoft Windows:
# salt-run winrepo.update_git_repos

# No minion6 pode ser necessário adicionar as entradas de hosts manulmente
# no arquivo c:\Windows\system32\drivers\etc\hosts, conforme a seguir:
# 192.168.1.10  master  salt
# 192.168.1.11  minion1
# 192.168.1.12  minion2
# 192.168.1.13  minion3
# 192.168.1.14  minion4
# 192.168.1.15  minion5
# 192.168.1.16  minion6

# Após instalação do salt-minion e a definição do hostname como minion6
# será necessário autorizar a chave no servidor Salt Master:
# salt-key -a minion6

# Após isso será necessário solicitar a atualização do minion para ler
# as informações do repositório Windows do servidor Salt Master:
# salt 'minion6' pkg.refresh_db
# Caso seja retornado esta mensagem:
# minion6:
#     Minion did not return. [No response]
#     The minions may not have all finished running and any remaining minions will return upon completion. To look up the return data for this job later, run the following command:
#     
#     salt-run jobs.lookup_jid 20210620214047935874
# Adicione a opção --timeout=300 na linha do comando salt ou aguarde
# um pouco e execute o comando conforme solicitado:
# salt-run jobs.lookup_jid 20210620214047935874
# minion6:
#     ----------
#     failed:
#         0
#     success:
#         310
#     total:
#         310

# Faça um teste de conectividade:
# salt --timeout=30 'minion6' test.ping

# minion6:
#     True
