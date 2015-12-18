#!/bin/sh

#print certificate chain from multi cert pem file

if [ "$#" -lt 1 ]; then
    echo "usage: $0 pem_file"
    exit 13
fi

cert=""
cat $1 | while read line; do
    cert=$cert$line$'\n'

    if [ "$line" != "${line/END CERTIFICATE/}" ]; then
        echo "$cert" | openssl x509 -subject -issuer -dates -purpose -noout
        echo "-------"
        cert=""
    fi
done
