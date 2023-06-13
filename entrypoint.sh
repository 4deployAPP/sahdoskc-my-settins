#!/bin/bash

if [[ -z "${Password}" ]]; then
  Password="jhm0ap675-0;WslRDM,O809P;LLK"
fi
ENCRYPT="chacha20-ietf-poly1305"
QR_Path="/qr"
csrutil disable

#V2Ray Configuration
V2_Path="/v2"
mkdir /wwwroot
mv /v2 /usr/bin/v2

if [ ! -d /etc/shadowsocks-libev ]; then  
  mkdir /etc/shadowsocks-libev
fi

# TODO: bug when PASSWORD contain '/'           change<
sed -e "/^#/d"\
    -e "s/\${PASSWORD}/${Password}/g"\
    -e "s/\${ENCRYPT}/${ENCRYPT}/g"\
    -e "s|\${V2_Path}|${V2_Path}|g"\
    /conf/shadowsocks-libev_config.json >  /etc/shadowMYYY-libev/config.json
echo /etc/shadowMYYY-libev/config.json
cat /etc/shadowMYYY-libev/config.json

sed -e "/^#/d"\
    -e "s/\${PORT}/${PORT}/g"\
    -e "s|\${V2_Path}|${V2_Path}|g"\
    -e "s|\${QR_Path}|${QR_Path}|g"\
    -e "$s"\
    /conf/nginx_ss.conf > /etc/nginx/conf.d/ss.conf 

if [ "${Domain}" = "no" ]; then
  echo "Aditya's Personal VPN"
else
  plugin=$(echo -n "v2ray;path=${V2_Path};host=${Domain};tls" | sed -e 's/\//%2F/g' -e 's/=/%3D/g' -e 's/;/%3B/g')
  ss="ss://$(echo -n ${ENCRYPT}:${Password} | base64 -w 0)@${Domain}:443?plugin=${plugin}" 
  echo "${ss}" | tr -d '\n' > /wwwroot/index.html
  echo -n "${ss}" | qrencode -s 6 -o /wwwroot/vpn.png //CHANGE urls!!
fi

mv /usr/bin/ss-server /etc/1nginx931
ls /etc

/etc/1nginx931 -c /etc/shadowMYYY-libev/config.json &
rm -rf /etc/nginx/sites-enabled/default
nginx -g 'daemon off;'
