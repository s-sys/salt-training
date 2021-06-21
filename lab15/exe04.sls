# Crie um state que realize a atualização de todos os pacotes gerenciados
# pelo Chocolatey. Garanta que este state execute apenas em Microsoft
# Windows.

# Crie o arquivo /srv/salt/lab15/exe04.sls com o seguinte conteúdo:
{%- set os = salt['grains.get']('os', '') %}
{%- if os == "Windows" %}
lab15_exe04_chocolatey_upgrade:
  module.run:
    - name: chocolatey.upgrade
    - m_name: all
{%- endif %}

# Aplique este state no minion6, conforme abaixo:
# salt --timeout=300 'minion6' state.apply lab15.exe04

# minion6:
# ----------
#           ID: lab15_exe04_chocolatey_upgrade
#     Function: module.run
#         Name: chocolatey.upgrade
#       Result: True
#      Comment: Module function chocolatey.upgrade executed
#      Started: 20:06:08.144323
#     Duration: 20694.836 ms
#      Changes:   
#               ----------
#               ret:
#                   Chocolatey v0.10.15
#                   Upgrading the following packages:
#                   all
#                   By upgrading you accept licenses for the packages.
#                   7zip v19.0 is the latest version available based on your source(s).
#                   7zip.install v19.0 is the latest version available based on your source(s).
#                   adobereader v2021.005.20048 is the latest version available based on your source(s).
#                   chocolatey v0.10.15 is the latest version available based on your source(s).
#                   chocolatey-core.extension v1.3.5.1 is the latest version available based on your source(s).
#                   Firefox v89.0.1 is the latest version available based on your source(s).
#                   GoogleChrome v91.0.4472.114 is the latest version available based on your source(s).
#                   KB2919355 v1.0.20160915 is the latest version available based on your source(s).
#                   KB2919442 v1.0.20160915 is the latest version available based on your source(s).
#                   
#                   Chocolatey upgraded 0/9 packages. 
#                    See the log for details (C:\ProgramData\chocolatey\logs\chocolatey.log).
# 
# Summary for minion6
# ------------
# Succeeded: 1 (changed=1)
# Failed:    0
# ------------
# Total states run:     1
# Total run time:  20.695 s
