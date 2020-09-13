#!/bin/sh



if ! [ -n "$PASS" ]; then
  echo "Missing environment variables:"
  echo "PASS:   Dynamic DNS Password (mandatory)"
  echo "HOST:   Hostname - (optional, default: <empty>)"
  echo "DOMAIN: Domain - (default: cooltest.site)"
  echo "IP:     IP Adress - (default: Your current public IP returned by ifconfig.me)"
  exit 1
fi


if ! [ -n "$DOMAIN" ]; then
  DOMAIN=cooltest.site
  echo "No DOMAIN environment variable provided! Using hostname:$DOMAIN"
fi

if ! [ -n "$HOST" ] || [ "$HOST" = "@" ]; then
  HOST=@
  FULLHOSTNAME=$DOMAIN
  echo "No HOST environment variable provided! Using hostname:$FULLHOSTNAME"
else
  FULLHOSTNAME="$HOST.$DOMAIN"
fi

# Check if IP address provided and run update only once
if [ -n "$IP" ]; then
  REPLY=`curl -s https://dynamicdns.park-your-domain.com/update?host=$HOST\&domain=$DOMAIN\&password=$PASS\&ip=$IP | grep errors`
  if ! [ -n "$REPLY" ]; then
    echo "DNS update successful: $HOST.$DOMAIN - $IP "
    exit 0
  else
    echo "DNS update failed: $HOST.$DOMAIN - $IP"
    echo "$REPLY"
    exit 1
  fi
fi

# Continous loop if IP address in NOT provided
if ! [ -n "$TIMER" ]; then
  TIMER=600
  echo "Refresh timer is set to $TIMER seconds."
fi

while :
do
  IP=`curl -s ifconfig.me`
  DNSIP=`getent hosts $FULLHOSTNAME | awk '{printf $1}'`

  if [ "$DNSIP" = "$IP" ]; then
    echo "No change detected: $FULLHOSTNAME - Your IP:$IP DNS IP:$DNSIP"
    sleep $TIMER
    continue
  fi

  REPLY=`curl -s https://dynamicdns.park-your-domain.com/update?host=$HOST\&domain=$DOMAIN\&password=$PASS\&ip=$IP | grep errors`
  if ! [ -n "$REPLY" ]; then
    echo "DNS update successful: $FULLHOSTNAME - $IP"
  else
    echo "DNS update failed: $FULLHOSTNAME - $IP DNSIP:$DNSIP"
    echo "$REPLY"
  fi
  sleep $TIMER
done
