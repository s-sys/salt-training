# Crie um state no servidor salt master que adicione um usuário e configure
# sua senha com base em informações recebidas via pillar.

# Crie o arquivo /srv/pillar/lab06/myuser.sls com o seguinte conteúdo:
# myuser:
#   username: teste
#   password: Passw0rd123

# Configure o top.sls do pillar para que a informação do pillar myuser
# esteja disponível apenas para o minion minion5, conforme abaixo:
# base:
#   'minion5':
#     - lab06.myuser

# Pode ser necessário garantir que todos os minions atualizaram seus
# pillars antes de prosseguir:
# salt '*' saltutil.refresh_pillar

# Crie o arquivo /srv/salt/lab06/exe03.sls com o seguinte conteúdo:
{% set user_info = salt['pillar.get']('myuser', '') %}

{% if user_info != '' %}
lab06_exe03_create_user:
  user.present:
    - name: {{ user_info.username }}
    - password: {{ user_info.password }}
    - hash_password: True
{% endif %}

# Este state pode ser executado múltiplas vezes ou mesmo para todos os
# minions para demonstrar que apenas o minion5 sofrerá a ação desejada.
# salt '*' state.apply lab06.exe03
