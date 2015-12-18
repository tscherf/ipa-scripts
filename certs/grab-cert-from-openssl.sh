echo -n | openssl s_client -connect $1:443 | \
  sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > pem.cert
