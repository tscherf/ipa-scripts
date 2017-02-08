openssl crl2pkcs7 -nocrl -certfile /etc/pki/tls/certs/ca-bundle.crt | openssl pkcs7 -print_certs -noout | grep 'subject=/O=GSSLAB.FAB.REDHAT.COM/CN=Certificate Authority'
