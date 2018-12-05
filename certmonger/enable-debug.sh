[[ ! -f /etc/sysconfig/certmonger ]] && touch /etc/sysconfig/certmonger

echo 'OPTS="-d 15"' >> /etc/sysconfig/certmonger
systemctl restart certmonger

