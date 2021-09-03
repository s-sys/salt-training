# Crie um state para a instalação do pacote htop apenas nas máquinas
# virtuais do ambiente.

# Crie o arquivo /srv/salt/lab06/exe01.sls com o seguinte conteúdo:
{% set phy = salt['grains.get']('virtual', '') %}

{% if phy is defined and phy != 'physical' %}
lab06_exe01_instala_htop:
  pkg.installed:
    - name: htop
{% endif %}
