import ipaddress
import os
import sys
import urllib.request

params = {}
params["VPN_GATEWAY"]     = ipaddress.ip_address( os.environ.get('VPN_GATEWAY')     )
params["PRIV_REMOTE_NET"] = ipaddress.ip_network( os.environ.get('PRIV_REMOTE_NET') )
params["PRIV_LOCAL_NET"]  = ipaddress.ip_network( os.environ.get('PRIV_LOCAL_NET')  )
params["PRIV_LOCAL_IP"]   = ipaddress.ip_network( os.environ.get('PRIV_LOCAL_IP') ,False )
params["VPN_SECRET"]      = os.environ.get('VPN_SECRET') 
params["IKE"]             = os.environ.get('IKE')
params["IKE_LIFETIME"]    = os.environ.get('IKE_LIFETIME')
params["ESP"]             = os.environ.get('ESP')
params["ESP_LIFETIME"]    = os.environ.get('ESP_LIFETIME')

exitcode = 0
for key in params:
    if not params[key]: 
        print("Environment variable missing or invalid: {}".format(key))
        exitcode = 1

try:
    params["PUB_LOCAL_IP"] = urllib.request.urlopen('https://ifconfig.me').read().decode('utf8')
except Exception as err:
    print("Unable to determine public IP by going to ifconfig.me")
    exitcode = 1

if exitcode: 
    sys.exit()

if os.environ.get('CONFIG_DIR'): 
    config_dir = os.environ.get('CONFIG_DIR')
else:
    config_dir = "/etc"

ipsec_config = """\
config setup
  charondebug="cfg 2, dmn 2, ike 2, net 2"
  uniqueids=yes
  strictcrlpolicy=no

conn VPN_CONNECTION
  authby=secret
  left=%defaultroute
  leftid={PUB_LOCAL_IP}
  leftsubnet={PRIV_LOCAL_NET}
  right={VPN_GATEWAY}
  rightid=%any
  rightsubnet={PRIV_REMOTE_NET}
  ike={IKE}
  ikelifetime={IKE_LIFETIME}
  esp={ESP}
  lifetime={ESP_LIFETIME}
  keyingtries=0
  keyexchange=ikev1
  dpddelay=30
  dpdtimeout=120
  dpdaction=restart
  auto=start
""".format(
    PUB_LOCAL_IP    = params["PUB_LOCAL_IP"],
    PRIV_LOCAL_NET  = params["PRIV_LOCAL_NET"],
    VPN_GATEWAY     = params["VPN_GATEWAY"],
    PRIV_REMOTE_NET = params["PRIV_REMOTE_NET"],
    IKE             = params["IKE"],
    IKE_LIFETIME    = params["IKE_LIFETIME"],
    ESP             = params["ESP"],
    ESP_LIFETIME    = params["ESP_LIFETIME"],
)

ipsec_secret = """\
 : PSK '{}'
""".format( params["VPN_SECRET"] )

with open( os.path.join( config_dir, "ipsec.conf"), "w") as file:
    file.write(ipsec_config)

with open( os.path.join( config_dir, "ipsec.secrets" ), "w") as file:
    file.write(ipsec_secret)
