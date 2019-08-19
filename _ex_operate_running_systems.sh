#!/bin/bash 

# Boot, Reboot, Shutdown a system normally 
systemctl reboot; shutdown -r now; shutdown now

# Boot systems into different targets manually

	$ yum -y install bash-completion; bash; systemctl TAB TAB
	$ systemctl isolate rescue.target
	$ systemctl isolate graphical.target
        $ systemctl get-default
	$ systemctl set-default graphical.target

# Interrupt the boot process in order to gain access to a system

	$ # Boot single user mode to reset root password
	$ # During boot, hit e at the grub menu,
	$ # in the config, remove "rhgb quiet" and add "rw init=/bin/sh"
	$ passwd; touch /.autorelabel; exec /sbin/init

# The machine will start to boot, and will relabel the filesystem, and reboot again, on second boot up you should be able to use new password.


# Identify CPU/memory intensive processes, adjust process priority with renice, and kill processes

	$ top
	$ ps auxw|grep 
	$ nice -n 10 ./script.sh
	$ renice +10 PID
	$ kill PID
	$ kill -9 PID

# Locate and interpret system log files and journals

	$ ls -lh /var/log/
	$ journalctl
	$ journalctl -b        # since last boot
	$ journalctl -u crond  # by unit crond
	$ journalctl -p err    # by priority error
	$ journalctl /sbin/crond
	$ journalctl -fu name  # check broken service, fuck you broken service
	$ systemd-analyze blame

# Access a virtual machine's console

	$ virt-manager
	# on the vm: 
	$ vm grubby --update-kernel=ALL --args="console=ttyS0"; reboot;
        $ virsh console vm.local.home

# Start and stop virtual machines
	$ virsh start machinename
	$ virsh reboot machinename
	$ virsh shutdown machinename
	$ virsh list --all
	$ virsh list --autostart

# Start, stop, and check the status of network services

	$ systemctl is-active httpd
	$ systemctl start httpd
	$ systemctl is-active httpd
	$ systemctl is-enabled httpd
	$ systemctl enable httpd
	$ systemctl mask httpd
	$ systemctl unmask httpd

# Securely transfer files between systems

	$ scp file john@another.system.lab:/location/
	$ sftp 
	$ sftp> ?
	$ sftp> ls
	$ sftp> get file
	$ sftp>	put file1

