# Validar a conectividade do master com os minions.

# A partir do servidor master
# salt ‘*’ test.ping
# minion2:
#     True
# minion4:
#     True
# minion1:
#     True
# minion3:
#     True
# minion5:
#     True

# Testando um minion específico
# salt ‘minion1’ test.ping
# minion1:
#     True
