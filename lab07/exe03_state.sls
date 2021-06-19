lab07_exe03_state_arquivo_importante:
  file.managed:
    - name: /etc/important.txt
    - contents: "Este é um arquivo com conteúdo importante."
    - user: root
    - group: root
    - mode: "0644"
