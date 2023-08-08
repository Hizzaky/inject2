port: 7890
socks-port: 7891
redir-port: 7892
mixed-port: 7893
tproxy-port: 7895
ipv6: false
mode: rule
log-level: silent
allow-lan: true
external-controller: 0.0.0.0:9090
secret: ""
bind-address: "*"
unified-delay: true
profile:
store-selected: true
dns:
enable: true
ipv6: false
enhanced-mode: redir-host
listen: 0.0.0.0:7874
nameserver:
- 8.8.8.8
- 1.0.0.1
- https://dns.google/dns-query
fallback:
- 1.1.1.1
- 8.8.4.4
- https://cloudflare-dns.com/dns-query
- 112.215.203.254
default-nameserver:
- 8.8.8.8
- 1.1.1.1
- 112.215.203.254
proxies:
- name: silver-globalssh_vless_ws_tls
server: 104.18.1.196
port: 443
type: vless
uuid: 5d23da48-146e-498b-94f4-f6ea61621675
cipher: auto
tls: true
skip-cert-verify: true
servername: vless-rs-us01.globalssh.xyz
network: ws
ws-opts:
path: /vless-ws
headers:
Host: vless-rs-us01.globalssh.xyz
udp: true
proxy-groups:
- name: FASTSSH-SSHKIT-HOWDY
type: select
proxies:
- silver-globalssh_vless_ws_tls
- LOAD-BALANCE
- DIRECT
- name: LOAD-BALANCE
type: load-balance
strategy: consistent-hashing
url: http://hi.bonds.id/ping
interval: 300
proxies:
- silver-globalssh_vless_ws_tls
rules:
- MATCH,FASTSSH-SSHKIT-HOWDY
