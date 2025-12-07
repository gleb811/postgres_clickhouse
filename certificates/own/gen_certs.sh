#!/usr/bin/env bash


# Generate CA private key and certificate
openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout ca.key -out ca.crt -config ca.conf.tpl

# Definition when dbs_stage_services is defined
declare -A services_dict=(
#    ["backend"]="Backend"
#    ["broker"]="Broker"
#    ["auth_provider"]="Auth Provider"
#    ["otel_collector"]="OTEL Collector"
#    ["tunnel"]="Tunnel"
#    ["poller"]="Poller"
#    ["vm_manager"]="Vm Manager"
    ["clickhouse"]="Clickhouse"
    ["postgres"]="Postgres"
#    ["redis"]="Redis"
)

for key in "${!services_dict[@]}"; do
    sed -e "s/NAME/${services_dict[$key]}/g" conf.tpl > "conf_$key.tpl"
    openssl genrsa -out "$key.key" 2048
    openssl req -new -sha256 -key "$key.key" -out "$key.csr" -config "conf_$key.tpl"
    openssl x509 -req -in "$key.csr" -CA ca.crt \
                                     -CAkey ca.key \
                                     -CAcreateserial \
                                     -out "$key.crt" \
                                     -days 500 \
                                     -sha256 \
                                     -extfile "conf_$key.tpl" \
                                     -extensions v3_req
done
rm conf_* *.csr
