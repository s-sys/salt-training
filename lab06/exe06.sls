# Crie um state que obtenha o valor do grains softwares e do pillar chamado
# softwares e realize a seguinte lógica:
# Caso o pillar softwares possua algum elemento, faz a instalação dos pacotes
# retornados na lista.
# Caso o pillar softwares não exista ou não possua elementos definidos,
# então verifique o grain softwares e proceda com a instalação dos pacotes
# listados no grains.
# Caso tanto o pillar softwares como o grain softwares estiverem vazios ou 
# não definidos, crie um arquivo em /tmp/softwares.txt com o texto
# "Nenhuma tabela de softwares definida."

# Crie um arquivo no salt master em /srv/salt/lab06/exe06.sls com
# o seguinte conteúdo:
{% set p_softwares = salt['pillar.get']('softwares', []) %}
{% set g_softwares = salt['grains.get']('softwares', []) %}

{% if p_softwares|length > 0 %}
{% for software in p_softwares %}
instala_software_pillar_{{ software }}:
  pkg.installed:
    - name: {{ software }}
{% endfor %}

{% elif g_softwares|length > 0 %}
{% for software in g_softwares %}
instala_software_grain_{{ software }}:
  pkg.installed:
    - name: {{ software }}
{% endfor %}

{% else %}
file.managed:
  - name: /tmp/softwares.txt
  - contents: "Nenhuma tabela de softwares definida."
  - user: root
  - group: root
  - mode: "0644"
{% endif %}

# Execute este state em alguns minions do seu ambiente, faça ajustes
# nos pillars e grains e verifique o resultado.
# salt 'minion4' state.apply lab06.exe06
