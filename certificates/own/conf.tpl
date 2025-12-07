[req]
default_bits  = 2048
distinguished_name = req_distinguished_name
req_extensions = req_ext
x509_extensions = v3_req
prompt = no
[req_distinguished_name]
countryName = RU
stateOrProvinceName = Moscow
localityName = RU
organizationName = Basis Workplace
commonName = NAME
[req_ext]
subjectAltName = @alt_names
subjectKeyIdentifier = hash
[v3_req]
subjectAltName = @alt_names
subjectKeyIdentifier = hash
[alt_names]
DNS.1 = tvdil-pgc011lk.corp.dev.vtb
DNS.2 = nginx
DNS.3 = postgres
DNS.4 = redis
DNS.5 = clickhouse
