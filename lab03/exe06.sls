# Criação de um state que adiciona um usuário teste no sistema.

adiciona_usuario:
  user.present:
    - name: teste
    - fullname: Usuario de Teste
    - home: /home/teste
    - shell: /bin/bash
