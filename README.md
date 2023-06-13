
[![Heroku](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

[![Railway](https://railway.app/button.svg)](https://railway.app/new/template/zN4vrb)

---

## 0. Attention

- Deployment can be done on any server with the help of DockerFile. 
- Heroku Deployment requires registration of a heroku account, a email is required when registering a heroku account (otherwise the verification code cannot be brushed out). 
- If app gets ban on Heroku, try forking and then deploying OR deploy using Heroku-CLI. When deploying using Heroku-cli, remember to set stack to container.

The environment variables required are:
```txt
Domain   : The domain of your server without the schema(https, http etc). Ex: test.com, not https://test.com
Password : Password you want to set for the Shadowsocks VPN service.
PORT	 : Server port, if not already defined by server provider(like Heroku,Railway provides).
```

## 1. Verification

After the server is deployed, open app to display the webpage normally. After the address is filled with the path (for example: <https://{Domain}/static>), the 404 page is displayed, which means the deployment is successful.

## 2. Client Configuration

### QR code address: 
``` 
https://{Domain}/qr 
```

(Change {Domain} to your own app server url.)

Use the client (Shadowsocks recommended) to scan the QR code.

**or**

### Use 'ss' address: 
```
https://{Domain}/ss
```
(Change {Domain} to your own app server url.)

Copy the details after opening and import it to the client.

**or**

### Manual configuration (Config file):

```json
{
	"server" : "{Domain}",
	"server_port" : 443,
	"local_port" : 1080,
	"password":"{password}",
	"timeout":300,
	"method":"chacha20-ietf-poly1305",
	"mode": "tcp_only",
	"fast_open":false,
	"reuse_port":true,
	"no_delay":true,
	"plugin": "v2raу-plugin",
	"plugin_opts":"path=/v2;host={Domain};tls",
	"remarks" : "Private VPN"
}
```
Change {Domain} with your server url and {password} with your password.


