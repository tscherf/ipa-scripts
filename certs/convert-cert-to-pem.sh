#!/bin/sh

echo -e "Please enter certificate input blob."
read blob

sed '1i\
-----BEGIN CERTIFICATE-----
$a\
-----END CERTIFICATE-----
' $blob |fold -w64 > $blob-new && echo "File $blob-new has been written."

