
Check Haproxy Configuration 
```
`sudo haproxy -c -f /etc/haproxy/haproxy.cfg`
```

tune haproxy with ssl 2048  with this command 
# SSL Configuration 
```
tune.ssl.default-dh-param 2048
```

OR You can create a .pem with ssl 2048 
```
openssl dhparam -out /etc/haproxy/certs/dhparam.pem 2048


cat /etc/haproxy/certs/cityremit.crt /etc/haproxy/certs/cityremit.key /etc/haproxy/certs/dhparam.pem > /etc/haproxy/certs/cityremit_combined.pem


chown haproxy:haproxy /etc/haproxy/certs/cityremit_combined.pem
chmod 600 /etc/haproxy/certs/cityremit_combined.pem

```


In Haproxy configuration

```
 bind *:7443 ssl crt /etc/haproxy/certs/combined.pem
   #bind *:7443
   mode http
   option forwardfor except 127.0.0.1
   http-request add-header X-Forwarded-Proto https if { ssl_fc }
   server k8s-node-36 172.16.128.36:31502
```