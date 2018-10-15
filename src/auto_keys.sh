#!/bin/bash

hash sshpass 2>/dev/null || { 
	echo -e >&2 "\nPublic keys exchanging terminated! Package below is needed: \n\n        sshpass\n\nPlease install it using commands:\napt install sshpass\t# Debian / Ubuntu\nyum install sshpass -y\t# RedHat / CentOS\nRerun this program when package installed.\n\n"; 
	exit 1; 
}

for(( i=100; i<=105; ++i ));
do
	sshpass -p 123456 ssh-copy-id -i ~/.ssh/id_rsa.pub root@192.168.123.$i -o "StrictHostKeyChecking no"
done