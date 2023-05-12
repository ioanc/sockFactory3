## Configure specific kernel for next reboot

```shell

root@test-kernel:~# awk -F\' '$1=="menuentry " || $1=="submenu " {print i++ " : " $2}; /\smenuentry / {print "\t" i-1">"j++ " : " $2};' /boot/grub/grub.cfg
0 : Ubuntu
1 : Advanced options for Ubuntu
        1>0 : Ubuntu, with Linux 5.15.0-1036-azure
        1>1 : Ubuntu, with Linux 5.15.0-1036-azure (recovery mode)
        1>2 : Ubuntu, with Linux 5.15.0-1035-azure
        1>3 : Ubuntu, with Linux 5.15.0-1035-azure (recovery mode)
2 : UEFI Firmware Settings
root@test-kernel:~#
root@test-kernel:~# grub-reboot '1>0'

```
