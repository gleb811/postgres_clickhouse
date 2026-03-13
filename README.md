# postgres_clickhouse
For usage:

cd postgres_clickhouse  
cd certificates/own/  

Edit "conf.tpl" and run:  
./gen_certs.sh  
  
cd ../..  
dnf install podman  
dnf install podman-compose  
./prepare.sh  

Switch off SELinux if present  
getenforce  
sudo setenforce 0  
getenforce

If need permanently  
sudo nano /etc/selinux/config  
sudo nano /etc/sysconfig/selinux  
SELINUX=disabled  
Then reboot

systemctl enable podman.socket or systemctl --user enable --now podman.socket
systemctl start podman.socket

podman compose up -d
