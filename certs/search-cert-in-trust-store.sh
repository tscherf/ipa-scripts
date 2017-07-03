openssl crl2pkcs7 -nocrl -certfile /etc/pki/tls/certs/ca-bundle.crt | \
    openssl pkcs7 -noout -print_certs
