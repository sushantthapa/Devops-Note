> Floating IP using Keepalived


Machine Requirements
>2 Ubuntu VMs required 

Lets assume we have two VMs with Ubuntu servers which are running with IPs 10.20.30.141 and 10.20.30.142 respectively, now we need to login machine and enter following commands.

```
apt install keepalived -y 

apt install libipset13

sudo systemctl enable --now keepalived 
```

By Default, Keepalived will not create a config file, so we need to create a file for it with name keepalived.conf inside the path /etc/keepalived on both machines and add below configuration on both VMs machine config.

> At machine I

```

vrrp_instance VI_1 {
    state MASTER
    interface ens18
    virtual_router_id 102
    priority 150
    advert_int 1

    unicast_src_ip 10.20.30.141
    unicast_peer{
	10.20.30.142
	}	

    authentication {
        auth_type PASS
        auth_pass 1111
    }
    virtual_ipaddress {
        10.20.30.140/24 
    }
}
```


> At Machine II

```

vrrp_instance VI_1 {
    state SLAVE
    interface ens18
    virtual_router_id 102
    priority 100
    advert_int 1
    unicast_src_ip 10.20.30.142
    unicast_peer{
    10.20.30.141
}	
    authentication {
        auth_type PASS
        auth_pass 1111
    }
    virtual_ipaddress {
        10.20.30.140/24
    }
}

```

> Note : Virtual_ipaddress is the desired ip you want as a Floating IP.

> Also, you must set the prioirty greater at the master machine.


Now, run this command on both machines 
```
sudo systemctl start keepalived
sudo systemctl enable --now keepalived 
```

**Verify by trying to ping the new Floating IP you have created 10.20.30.140 from both machine.**

==This two vms will work as a master and slave. If master vm (10.20.30.141) goes down,the slave vm (10.20.30.142) will act as 10.20.30.140 and all   the traffic to 10.20.30.140 will route from it, once the master vm will be up, traffic will reverse.==  