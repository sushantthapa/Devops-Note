
> Note : For Ubuntu Distro 

**Installation Command For HaProxy 2.8** 
```
sudo apt install --no-install-recommends software-properties-common
sudo add-apt-repository ppa:vbernat/haproxy-2.8 -y
sudo apt install haproxy=2.8.\*
haproxy -v
```

**haproxy config****

```
frontend http-in
	bind *:6443 
	option tcplog
	mode tcp
	default_backend backend-servers

backend backend-servers
	mode tcp
	option tcp-check
	balance roundrobin
	server kmaster01 node-ip:6443 check
	server kmaster02 node-ip.102:6443 check
	server kmaster03 node-ip:6443 check


```
