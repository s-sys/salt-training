lab13_exe02_cria_arquivo:
  file.managed:
    - name: /tmp/valida.txt
    - contents: {{ salt['cmd.run']('date') }}
    - user: root
    - group: root
    - mode: "0644"
