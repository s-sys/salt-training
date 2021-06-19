# Identificação do grains referente as informações da máquina como versão do
# sistema operacional, número de cores, memória e disco.

# salt-call --local grains.items
# local:
#     ----------
#     biosreleasedate:
#         04/01/2014
#     biosversion:
#         1.13.0-1ubuntu1.1
#     cpu_model:
#         Intel Xeon Processor (Skylake)
#     cpuarch:
#         x86_64
#     cwd:
#         /srv/salt/lab03
#     disks:
#         - vda
#     dns:
#         ----------
#         domain:
#         ip4_nameservers:
#             - 8.8.8.8
#             - 8.8.4.4
#         ip6_nameservers:
#         nameservers:
#             - 8.8.8.8
#             - 8.8.4.4
#         options:
#         search:
#             - ssys.com.br
#             - ssys.io
#         sortlist:
#     domain:
#     fqdn:
#         minion1
#     fqdn_ip4:
#         - 192.168.1.11
#     fqdn_ip6:
#     fqdns:
#         - minion1
#     gid:
#         0
#     gpus:
#         |_
#           ----------
#           model:
#               QXL paravirtual graphic card
#           vendor:
#               unknown
#     groupname:
#         root
#     host:
#         minion1
#     hwaddr_interfaces:
#         ----------
#         enp1s0:
#             52:54:00:ff:00:02
#         lo:
#             00:00:00:00:00:00
#     id:
#         minion1
#     init:
#         systemd
#     ip4_gw:
#         192.168.1.1
#     ip4_interfaces:
#         ----------
#         enp1s0:
#             - 192.168.1.11
#         lo:
#             - 127.0.0.1
#     ip6_gw:
#         False
#     ip6_interfaces:
#         ----------
#         enp1s0:
#             - fe80::5054:ff:feff:2
#         lo:
#             - ::1
#     ip_gw:
#         True
#     ip_interfaces:
#         ----------
#         enp1s0:
#             - 192.168.1.11
#             - fe80::5054:ff:feff:2
#         lo:
#             - 127.0.0.1
#             - ::1
#     ipv4:
#         - 127.0.0.1
#         - 192.168.1.11
#     ipv6:
#         - ::1
#         - fe80::5054:ff:feff:2
#     kernel:
#         Linux
#     kernelparams:
#         |_
#           - BOOT_IMAGE
#           - /vmlinuz-5.4.0-74-generic
#         |_
#           - root
#           - /dev/mapper/ubuntu--vg-ubuntu--lv
#         |_
#           - ro
#           - None
#         |_
#           - console
#           - tty0
#         |_
#           - console
#           - ttyS0
#         |_
#           - maybe-ubiquity
#           - None
#     kernelrelease:
#         5.4.0-74-generic
#     kernelversion:
#         #83-Ubuntu SMP Sat May 8 02:35:39 UTC 2021
#     locale_info:
#         ----------
#         defaultencoding:
#             UTF-8
#         defaultlanguage:
#             en_US
#         detectedencoding:
#             utf-8
#         timezone:
#             UTC
#     localhost:
#         minion1
#     lsb_distrib_codename:
#         focal
#     lsb_distrib_description:
#         Ubuntu 20.04.2 LTS
#     lsb_distrib_id:
#         Ubuntu
#     lsb_distrib_release:
#         20.04
#     lvm:
#         ----------
#         ubuntu-vg:
#             - ubuntu-lv
#     machine_id:
#         772f342ecd6911eb9bba000d3aa6330e
#     manufacturer:
#         QEMU
#     master:
#         salt
#     mdadm:
#     mem_total:
#         980
#     nodename:
#         minion1
#     num_cpus:
#         2
#     num_gpus:
#         1
#     os:
#         Ubuntu
#     os_family:
#         Debian
#     osarch:
#         amd64
#     oscodename:
#         focal
#     osfinger:
#         Ubuntu-20.04
#     osfullname:
#         Ubuntu
#     osmajorrelease:
#         20
#     osrelease:
#         20.04
#     osrelease_info:
#         - 20
#         - 4
#     path:
#         /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
#     pid:
#         4487
#     productname:
#         Standard PC (Q35 + ICH9, 2009)
#     ps:
#         ps -efHww
#     pythonexecutable:
#         /usr/bin/python3
#     pythonpath:
#         - /usr/bin
#         - /usr/lib/python38.zip
#         - /usr/lib/python3.8
#         - /usr/lib/python3.8/lib-dynload
#         - /usr/local/lib/python3.8/dist-packages
#         - /usr/lib/python3/dist-packages
#     pythonversion:
#         - 3
#         - 8
#         - 5
#         - final
#         - 0
#     saltpath:
#         /usr/lib/python3/dist-packages/salt
#     saltversion:
#         3003
#     saltversioninfo:
#         - 3003
#     serialnumber:
#     server_id:
#         156412900
#     shell:
#         /bin/bash
#     ssds:
#     swap_total:
#         1960
#     systemd:
#         ----------
#         features:
#             +PAM +AUDIT +SELINUX +IMA +APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -IDN +PCRE2 default-hierarchy=hybrid
#         version:
#             245
#     systempath:
#         - /usr/local/sbin
#         - /usr/local/bin
#         - /usr/sbin
#         - /usr/bin
#         - /sbin
#         - /bin
#         - /usr/games
#         - /usr/local/games
#         - /snap/bin
#     uid:
#         0
#     username:
#         root
#     uuid:
#         772f342e-cd69-11eb-9bba-000d3aa6330e
#     virtual:
#         kvm
#     zfs_feature_flags:
#         False
#     zfs_support:
#         False
#     zmqversion:
#         4.3.2
