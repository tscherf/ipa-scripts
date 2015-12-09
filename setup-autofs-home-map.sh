# setup an indirect map in parent master map 
ipa automountmap-add-indirect default auto.home --mount=/home

# Define the indirect key
ipa automountkey-add default auto.home --key=* --info="rhel7-ipa-1.gsslab.pnq.redhat.com:/home/&"

# Verify the new map using ipa automountlocation-tofile
ipa automountlocation-tofile default

# Setup the client using "ipa-client-automount -U"

