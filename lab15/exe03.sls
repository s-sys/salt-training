# Crie um state para a realização do bootstrap do chocolatey e faça a
# instalação do firefox, Google Chrome, 7zip e Adobe Acrobat através do
# Chocolatey. Garante que este state execute apenas em máquinas com
# Microsoft Windows.

# Crie o arquivo /srv/salt/lab15/exe03.sls com o seguinte conteúdo:
{%- set os = salt['grains.get']('os', '') %}
{%- if os == "Windows" %}
lab15_exe03_bootstrap_chocolatey:
  module.run:
    - name: chocolatey.bootstrap

lab15_exe03_instala_firefox:
  chocolatey.installed:
    - name: firefox
    - install_args: "/l:en-US"
    - require:
      - module: lab15_exe03_bootstrap_chocolatey

lab15_exe03_instala_google_chrome:
  chocolatey.installed:
    - name: googlechrome
    - require:
      - module: lab15_exe03_bootstrap_chocolatey

lab15_exe03_instala_7zip:
  chocolatey.installed:
    - name: 7zip
    - require:
      - module: lab15_exe03_bootstrap_chocolatey

lab15_exe03_instala_adobe_acrobat_reader:
  chocolatey.installed:
    - name: adobereader
    - require:
      - module: lab15_exe03_bootstrap_chocolatey
{%- endif %}

# Aplique este state no minion6, conforme abaixo:
# salt --timeout=300 'minion6' state.apply lab15.exe03

# minion6:
# ----------
#           ID: lab15_exe03_bootstrap_chocolatey
#     Function: module.run
#         Name: chocolatey.bootstrap
#       Result: True
#      Comment: Module function chocolatey.bootstrap executed
#      Started: 19:37:20.245406
#     Duration: 124.97 ms
#      Changes:   
#               ----------
#               ret:
#                   Chocolatey found at C:\ProgramData\chocolatey\bin\chocolatey.exe
# ----------
#           ID: lab15_exe03_instala_firefox
#     Function: chocolatey.installed
#         Name: firefox
#       Result: True
#      Comment: 
#      Started: 19:37:20.385622
#     Duration: 90306.005 ms
#      Changes:   
#               ----------
#               Firefox:
#                   ----------
#                   new:
#                       - 89.0.1
#                   old:
# ----------
#           ID: lab15_exe03_instala_google_chrome
#     Function: chocolatey.installed
#         Name: googlechrome
#       Result: True
#      Comment: 
#      Started: 19:38:50.691627
#     Duration: 149760.227 ms
#      Changes:   
#               ----------
#               GoogleChrome:
#                   ----------
#                   new:
#                       - 91.0.4472.114
#                   old:
# ----------
#           ID: lab15_exe03_instala_7zip
#     Function: chocolatey.installed
#         Name: 7zip
#       Result: True
#      Comment: 
#      Started: 19:41:20.451854
#     Duration: 34120.408 ms
#      Changes:   
#               ----------
#               7zip:
#                   ----------
#                   new:
#                       - 19.0
#                   old:
#               7zip.install:
#                   ----------
#                   new:
#                       - 19.0
#                   old:
# ----------
#           ID: lab15_exe03_instala_adobe_acrobat_reader
#     Function: chocolatey.installed
#         Name: adobereader
#       Result: True
#      Comment: 
#      Started: 19:41:54.572262
#     Duration: 1048658.971 ms
#      Changes:   
#               ----------
#               KB2919355:
#                   ----------
#                   new:
#                       - 1.0.20160915
#                   old:
#               KB2919442:
#                   ----------
#                   new:
#                       - 1.0.20160915
#                   old:
#               adobereader:
#                   ----------
#                   new:
#                       - 2021.005.20048
#                   old:
# 
# Summary for minion6
# ------------
# Succeeded: 5 (changed=5)
# Failed:    0
# ------------
# Total states run:     5
# Total run time: 1322.971 s
