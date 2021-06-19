# Construir exemplos de state e chamada por linha de comando.

# salt-call pkg.install htop
# salt-call pkg.install sysstat

# salt-call sys.argspec file.mkdir
# salt-call file.mkdir dir_path=/root/test user=root group=root mode=755

# salt-call sys.argspec pkg.info_installed
# salt-call pkg.info_installed htop
