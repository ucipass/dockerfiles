#!/bin/bash -e
#
# entrypoint for strongswan
#
# - VPN_DEVICE
# - VPN_NETWORK
#

/init.sh
if [ $# -eq 0 ]
then
  echo "IPSec is starting..."
  exec ipsec start --nofork "$@"
else
  echo "Shell is starting...."
  exec /bin/bash
fi
