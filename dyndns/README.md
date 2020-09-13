# Dynamic DNS updater for Namecheap

## Environment Variables Needed

- PASS:   Dynamic DNS Password - ()
- HOST:   Hostname to be updated (default: @)
- DOMAIN: Parent domain - (default: cooltest.site)
- IP:     IP address of host - (default: IP address by ifconfig.me)
- TIMER:  Refresh timer - ( default: 600 seconds)


## Example: setting DNS name of cooltest.site to current external IP address based on polling ifconfig.me
docker run -d --rm --name dyndns -e HOST=@ -e DOMAIN=cooltest.site -e PASS=fdshfiuwehr4234 ucipass/dyndns

## Example: setting DNS name of www.cooltest.site to 69.69.69.69 (specific IP address)
docker run -d --rm --name dyndns -e HOST=www -e DOMAIN=cooltest.site -e PASS=fdshfiuwehr4234 -e IP=69.69.69.69 ucipass/dyndns

