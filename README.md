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
podman compose up -d
