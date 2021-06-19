# Utilize a formula vim-formula para instalar e configuração o vim em uma
# máquina Linux. Faça a instalação utilizando highstate configurado apenas
# para o minion4.

# No servidor salt master faça um clone da formula vim-formula do github:
# mkdir -p /opt/salt-formulas
# cd /opt/salt-formulas
# git clone https://github.com/saltstack-formulas/vim-formula

# Crie o arquivo /etc/salt/master.d/fileroots.conf com o seguinte conteúdo:
# file_roots:
#   base:
#     - /srv/salt
#     - /opt/salt-formulas/vim-formula

# Após a criação do arquivo o salt master deve ser reiniciado:
# systemctl restart salt-master.service

# Altere o arquivo /srv/salt/top.sls para adicionar uma entrada para a
# execução da fórmula vim apenas para o minion4 da seguinte forma:
# base:
#   'minion4':
#     - vim

# Execute o highstate para o minion4 e verifique a instalação do pacote
# vim na saída da execução.
# salt 'minion4' state.highstate

# minion4:
# ----------
#           ID: lab05_exe05_instala_sysstat
#     Function: pkg.installed
#         Name: sysstat
#       Result: True
#      Comment: All specified packages are already installed
#      Started: 16:52:50.661080
#     Duration: 1780.78 ms
#      Changes:   
# ----------
#           ID: vim
#     Function: pkg.installed
#       Result: True
#      Comment: The following packages were installed/updated: vim-enhanced
#      Started: 16:52:52.442295
#     Duration: 29910.395 ms
#      Changes:   
#               ----------
#               gpm-libs:
#                   ----------
#                   new:
#                       1.20.7-6.el7
#                   old:
#               perl:
#                   ----------
#                   new:
#                       4:5.16.3-299.el7_9
#                   old:
#               perl-Carp:
#                   ----------
#                   new:
#                       1.26-244.el7
#                   old:
#               perl-Encode:
#                   ----------
#                   new:
#                       2.51-7.el7
#                   old:
#               perl-Exporter:
#                   ----------
#                   new:
#                       5.68-3.el7
#                   old:
#               perl-File-Path:
#                   ----------
#                   new:
#                       2.09-2.el7
#                   old:
#               perl-File-Temp:
#                   ----------
#                   new:
#                       0.23.01-3.el7
#                   old:
#               perl-Filter:
#                   ----------
#                   new:
#                       1.49-3.el7
#                   old:
#               perl-Getopt-Long:
#                   ----------
#                   new:
#                       2.40-3.el7
#                   old:
#               perl-HTTP-Tiny:
#                   ----------
#                   new:
#                       0.033-3.el7
#                   old:
#               perl-PathTools:
#                   ----------
#                   new:
#                       3.40-5.el7
#                   old:
#               perl-Pod-Escapes:
#                   ----------
#                   new:
#                       1:1.04-299.el7_9
#                   old:
#               perl-Pod-Perldoc:
#                   ----------
#                   new:
#                       3.20-4.el7
#                   old:
#               perl-Pod-Simple:
#                   ----------
#                   new:
#                       1:3.28-4.el7
#                   old:
#               perl-Pod-Usage:
#                   ----------
#                   new:
#                       1.63-3.el7
#                   old:
#               perl-Scalar-List-Utils:
#                   ----------
#                   new:
#                       1.27-248.el7
#                   old:
#               perl-Socket:
#                   ----------
#                   new:
#                       2.010-5.el7
#                   old:
#               perl-Storable:
#                   ----------
#                   new:
#                       2.45-3.el7
#                   old:
#               perl-Text-ParseWords:
#                   ----------
#                   new:
#                       3.29-4.el7
#                   old:
#               perl-Time-HiRes:
#                   ----------
#                   new:
#                       4:1.9725-3.el7
#                   old:
#               perl-Time-Local:
#                   ----------
#                   new:
#                       1.2300-2.el7
#                   old:
#               perl-constant:
#                   ----------
#                   new:
#                       1.27-2.el7
#                   old:
#               perl-libs:
#                   ----------
#                   new:
#                       4:5.16.3-299.el7_9
#                   old:
#               perl-macros:
#                   ----------
#                   new:
#                       4:5.16.3-299.el7_9
#                   old:
#               perl-parent:
#                   ----------
#                   new:
#                       1:0.225-244.el7
#                   old:
#               perl-podlators:
#                   ----------
#                   new:
#                       2.5.1-3.el7
#                   old:
#               perl-threads:
#                   ----------
#                   new:
#                       1.87-4.el7
#                   old:
#               perl-threads-shared:
#                   ----------
#                   new:
#                       1.43-6.el7
#                   old:
#               vim-common:
#                   ----------
#                   new:
#                       2:7.4.629-8.el7_9
#                   old:
#               vim-enhanced:
#                   ----------
#                   new:
#                       2:7.4.629-8.el7_9
#                   old:
#               vim-filesystem:
#                   ----------
#                   new:
#                       2:7.4.629-8.el7_9
#                   old:
# ----------
#           ID: /etc/vimrc
#     Function: file.managed
#       Result: True
#      Comment: File /etc/vimrc updated
#      Started: 16:53:22.358860
#     Duration: 396.981 ms
#      Changes:   
#               ----------
#               diff:
#                   --- 
#                   +++ 
#                   @@ -1,64 +1 @@
#                   -if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
#                   -   set fileencodings=ucs-bom,utf-8,latin1
#                   -endif
#                    
#                   -set nocompatible	" Use Vim defaults (much better!)
#                   -set bs=indent,eol,start		" allow backspacing over everything in insert mode
#                   -"set ai			" always set autoindenting on
#                   -"set backup		" keep a backup file
#                   -set viminfo='20,\"50	" read/write a .viminfo file, don't store more
#                   -			" than 50 lines of registers
#                   -set history=50		" keep 50 lines of command line history
#                   -set ruler		" show the cursor position all the time
#                   -
#                   -" Only do this part when compiled with support for autocommands
#                   -if has("autocmd")
#                   -  augroup redhat
#                   -  autocmd!
#                   -  " In text files, always limit the width of text to 78 characters
#                   -  " autocmd BufRead *.txt set tw=78
#                   -  " When editing a file, always jump to the last cursor position
#                   -  autocmd BufReadPost *
#                   -  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
#                   -  \   exe "normal! g'\"" |
#                   -  \ endif
#                   -  " don't write swapfile on most commonly used directories for NFS mounts or USB sticks
#                   -  autocmd BufNewFile,BufReadPre /media/*,/run/media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp
#                   -  " start with spec file template
#                   -  autocmd BufNewFile *.spec 0r /usr/share/vim/vimfiles/template.spec
#                   -  augroup END
#                   -endif
#                   -
#                   -if has("cscope") && filereadable("/usr/bin/cscope")
#                   -   set csprg=/usr/bin/cscope
#                   -   set csto=0
#                   -   set cst
#                   -   set nocsverb
#                   -   " add any database in current directory
#                   -   if filereadable("cscope.out")
#                   -      cs add $PWD/cscope.out
#                   -   " else add database pointed to by environment
#                   -   elseif $CSCOPE_DB != ""
#                   -      cs add $CSCOPE_DB
#                   -   endif
#                   -   set csverb
#                   -endif
#                   -
#                   -" Switch syntax highlighting on, when the terminal has colors
#                   -" Also switch on highlighting the last used search pattern.
#                   -if &t_Co > 2 || has("gui_running")
#                   -  syntax on
#                   -  set hlsearch
#                   -endif
#                   -
#                   -filetype plugin on
#                   -
#                   -if &term=="xterm"
#                   -     set t_Co=8
#                   -     set t_Sb=?[4%dm
#                   -     set t_Sf=?[3%dm
#                   -endif
#                   -
#                   -" Don't wake up system with blinking cursor:
#                   -" http://www.linuxpowertop.org/known.php
#                   -let &guicursor = &guicursor . ",a:blinkon0"
# 
# Summary for minion4
# ------------
# Succeeded: 3 (changed=2)
# Failed:    0
# ------------
# Total states run:     3
# Total run time:  32.088 s
