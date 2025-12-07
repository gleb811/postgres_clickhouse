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
basicConstraints = critical, CA:TRUE
keyUsage = keyCertSign, cRLSign
subjectAltName = @alt_names
subjectKeyIdentifier = hash
[alt_names]
DNS.1 =	gvfedotov-dbs-fqdn-certs

