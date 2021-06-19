# Criação de um state para garantir que o serviço de ssh esteja sempre em
# execução mesmo após o reboot.

executa_ssh:
  service.running:
    - name: ssh.service
    - enable: True
