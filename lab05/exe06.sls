# Crie um pillar no servidor salt master para definir um pillar chamado
# 'mysecretuser' com o valor de 'root', um segundo pillar chamado
# 'mysecretpwd' com o valor de 'Passw0rd123' e um terceiro pillar
# chamado 'mysecretlist' contendo uma lista com os elementos 'data1' e
# 'data2'. Este pillar deve ser configurado para ser acessível apenas
# pelos minions Ubuntu, independente da versão.

# Crie um arquivo em /srv/pillar/lab05/mysecret.sls, com o seguinte conteúdo:
# mysecretuser: 'root'
# mysecretpwd: 'Passw0rd123'
# mysecretlist:
#   - data1
#   - data2

# Crie o arquivo /srv/pillar/top.sls, com o seguinte conteúdo:
# base:
#   'G@os:Ubuntu':
#     - lab05.mysecret

# Force os minions a atualizarem seus pillars:
# salt '*' saltutil.refresh_pillar

# Valide se o pillar é acessível a partir de um máquina Ubuntu:
# salt 'minion1' pillar.item mysecretuser

# Valide se o pillar é acessível a partir de um máquina não Ubuntu:
# salt 'minion5' pillar.item mysecretuser
