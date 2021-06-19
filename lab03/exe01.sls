# Criar um state para a instalação do pacote htop.

instalar_htop:
  pkg.installed:
    - name: htop
