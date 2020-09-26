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

python3 ipsec.py

if [ -L /sys/class/net/loopvpn ]
then
  echo "Deleting loopvpn loopback interface..."
  ip link delete name loopvpn
else
  echo "Creating loopvpn loopback interface IP: ${PRIV_LOCAL_IP}"
  ip link add name loopvpn  type dummy
  ip link set loopvpn up
  ip address add ${PRIV_LOCAL_IP} dev loopvpn  
fi

echo "IPSec is starting..."
exec ipsec start --nofork "$@"
