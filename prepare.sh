#!/usr/bin/env bash

rm -rf data/clickhouse/*
rm -rf data/postgres/*
chmod 600 ./certificates/own/postgres.key
chmod 644 ./certificates/own/postgres.crt
chmod 644 ./certificates/own/ca.crt
chown -R 999:999 ./data/postgres 
chown 999:999 ./certificates/own/postgres.key
chmod 666 certificates/own/clickhouse.key
