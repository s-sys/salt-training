# Crie um state que instale o pacote sysstat apenas se existir o arquivo
# /root/verificar.txt no sistema. Crie um pillar chamado 
# coloca_arquivo_controle com valor de true e associe apenas ao minion5.
# Ajuste o state da atividade lab11.exe01 para criar o arquivo
# /root/verificar.txt caso o pillar exista e estiver com o valor de True
# e adicione dentro do arquivo /root/verificar.txt a saída do comando
# dmidecode. Garanta que o pacote responsável pelo comando dmidecode
# esteja instalado no minion como pré-requisito.

# Crie o arquivo /srv/pillar/lab11/controle.sls com o seguinte conteúdo:
coloca_arquivo_controle: True

# Altere o arquivo /srv/pillar/top.sls adicionando o seguinte trecho:
# base:
#   'minion5':
#     - lab11.controle

# Pode ser necessário garantir que o pillar foi atualizado em todos
# os minions:
# salt '*' saltutil.refresh_pillar

# Adicione o state abaixo em /srv/salt/lab11/exe03.sls:
{%- set controle = salt['pillar.get']('coloca_arquivo_controle', False) %}
{%- if controle is sameas True %}
lab11_exe03_instala_dmidecode:
  pkg.installed:
    - name: dmidecode

lab11_exe03_escreve_arquivo_controle:
  file.managed:
    - name: /root/verificar.txt
    - source: salt://lab11/files/verificar.txt
    - template: jinja
    - user: root
    - group: root
    - mode: "0644"
    - require:
      - pkg: dmidecode
{%- endif %}

lab11_exe01_instala_sysstat:
  pkg.installed:
    - name: sysstat
    - onlyif:
      - test -f /root/verificar.txt

# Adicione o arquivo /srv/salt/lab11/files/verificar.txt com o seguinte
# conteúdo:
# {% set dmidecode = salt['cmd.run']('dmidecode') -%}
# {{ dmidecode }}

# Execute o state no minion5 e verifque a saída:
# salt 'minion5' state.apply lab11.exe03

# minion5:
# ----------
#           ID: lab11_exe03_instala_dmidecode
#     Function: pkg.installed
#         Name: dmidecode
#       Result: True
#      Comment: All specified packages are already installed
#      Started: 12:03:20.081839
#     Duration: 35525.292 ms
#      Changes:   
# ----------
#           ID: lab11_exe03_escreve_arquivo_controle
#     Function: file.managed
#         Name: /root/verificar.txt
#       Result: True
#      Comment: File /root/verificar.txt updated
#      Started: 12:03:55.614419
#     Duration: 112.109 ms
#      Changes:   
#               ----------
#               diff:
#                   New file
#               mode:
#                   0644
# ----------
#           ID: lab11_exe01_instala_sysstat
#     Function: pkg.installed
#         Name: sysstat
#       Result: True
#      Comment: All specified packages are already installed
#      Started: 12:03:55.726779
#     Duration: 1787.226 ms
#      Changes:   
# 
# Summary for minion5
# ------------
# Succeeded: 3 (changed=1)
# Failed:    0
# ------------
# Total states run:     3
# Total run time:  37.425 s
