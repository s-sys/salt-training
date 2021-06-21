{%- from 'lab13/exe01_map.jinja' import apache with context %}
lab13_exe01_instala_apache:
  pkg.installed:
    - name: {{ apache.pkg }}

lab13_exe01_habilita_apache:
  service.running:
    - name: {{ apache.srv }}
    - enable: True
