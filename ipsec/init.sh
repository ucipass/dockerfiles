#!/bin/bash -e
#
# gen config files for strongswan
#
# - VPN_GATEWAY
# - VPN_SECRET
# - PRIV_REMOTE_NET
# - PRIV_REMOTE_NET2 (Optional)
# - IKE
# - IKE_LIFETIME
# - ESP
# - ESP_LIFETIME

if [ -e /etc/ipsec.init ]
then
    echo "Already Initialized!"
    exit 0
fi

echo "Initializing..."
touch /etc/ipsec.init

if [ ! -f /sys/class/net/loopvpn ]
then
  echo "Creating loopvpn loopback interface..."
  ip link add name loopvpn  type dummy
  ip link set loopvpn up
  ip address add ${PRIV_LOCAL_IP} dev loopvpn
fi

cat > /etc/ipsec.secrets <<_EOF_
${VPN_GATEWAY} : PSK ${VPN_SECRET}
_EOF_

cat > /etc/ipsec.conf <<_EOF_
config setup
  charondebug="cfg 2, dmn 2, ike 2, net 2"
  uniqueids=yes
  strictcrlpolicy=no

conn VPN_CONNECTION
  authby=secret
  left=%defaultroute
  #leftid=169.254.100.1
  leftsubnet=${PRIV_LOCAL_NET}
  right=${VPN_GATEWAY}
  rightsubnet=${PRIV_REMOTE_NET}
  ike=${IKE}
  ikelifetime=${IKE_LIFETIME}
  esp=${ESP}
  lifetime=${ESP_LIFETIME}
  keyingtries=0
  keyexchange=ikev1
  dpddelay=30
  dpdtimeout=120
  dpdaction=restart
  auto=start

_EOF_

if [ ! -z ${PRIV_REMOTE_NET2} ]; then
  cat >> /etc/ipsec.conf <<_EOF_
conn VPN_CONNECTION-1
  also=VPN_CONNECTION
  rightsubnet=${PRIV_REMOTE_NET2}
_EOF_
fi
