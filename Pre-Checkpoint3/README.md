- **COURSE INFORMATION: CSN400 Computer Systems Projects**
- **STUDENT’S NAME: Divyansh Dutt** 
- **STUDENT'S NUMBER: 129611208**
- **GITHUB USER_ID: ddutt3-129611208**
- **TEACHER’S NAME: Atoosa Nasiri**
- **ASSIGNMENT REF: Pre-Checkpoint3**

## Table of Contents
- [iptables for router VM](#iptables-for-router-VM)
- [CP3_lr_firewalls_xx.sh script](#CP3_lr_firewalls_xx.sh-script)
- [screenshot of iptables from Linux Router VM](screenshot-of-iptables-from-Linux-Router-VM)
- [iptables for Linux Server VM](#iptables-for-Linux-Server-VM)
- [CP3_ls_firewalls_xx.sh script](#CP3_ls_firewalls_xx.sh-script)
- [screenshot of iptables from Linux Server VM](#screenshot-of-iptables-from-Linux-Server-VM)

## iptables for router VM

```
[ddutt3@LR-47 ~]$ sudo iptables -nvL
Chain INPUT (policy ACCEPT 3 packets, 120 bytes)
 pkts bytes target     prot opt in     out     source               destination
 8962 1708K ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            state RELATED,ESTABLISHED
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0            0.0.0.0/0
    0     0 ACCEPT     all  --  lo     *       0.0.0.0/0            0.0.0.0/0
    0     0 ACCEPT     tcp  --  *      *       10.38.200.0/24       0.0.0.0/0            state NEW tcp dpt:22
   97 15548 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0            172.17.47.36         tcp dpt:53
    0     0 ACCEPT     tcp  --  *      *       172.17.47.36         0.0.0.0/0            tcp spt:53
    0     0 ACCEPT     udp  --  *      *       0.0.0.0/0            172.17.47.36         udp dpt:53
    0     0 ACCEPT     udp  --  *      *       172.17.47.36         0.0.0.0/0            udp spt:53
  341 54455 ACCEPT     tcp  --  *      *       10.38.200.0/24       172.17.47.36         tcp dpt:3389
  488  177K ACCEPT     tcp  --  *      *       172.17.47.36         10.38.200.0/24       tcp spt:3389
    0     0 ACCEPT     tcp  --  *      *       10.38.200.0/24       172.17.47.37         tcp dpt:3306
    0     0 ACCEPT     tcp  --  *      *       172.17.47.37         10.38.200.0/24       tcp spt:3306
    0     0 ACCEPT     tcp  --  *      *       10.38.200.0/24       172.17.47.37         tcp dpt:80
    0     0 ACCEPT     tcp  --  *      *       172.17.47.37         10.38.200.0/24       tcp spt:80
    0     0 ACCEPT     tcp  --  *      *       10.38.200.0/24       172.17.47.36         tcp dpt:80
    0     0 ACCEPT     tcp  --  *      *       172.17.47.36         10.38.200.0/24       tcp spt:80
    0     0 ACCEPT     tcp  --  *      *       10.38.200.0/24       172.17.47.36         tcp dpt:21
    0     0 ACCEPT     tcp  --  *      *       172.17.47.36         10.38.200.0/24       tcp spt:21
    0     0 ACCEPT     tcp  --  *      *       10.38.200.0/24       172.17.47.36         tcp dpts:40001:40010
    0     0 ACCEPT     tcp  --  *      *       172.17.47.36         10.38.200.0/24       tcp spts:40001:40010
    0     0 ACCEPT     tcp  --  *      *       10.38.200.0/24       172.17.47.37         tcp dpt:22
    0     0 ACCEPT     tcp  --  *      *       172.17.47.37         10.38.200.0/24       tcp spt:22
    3  3780 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0

Chain OUTPUT (policy ACCEPT 19591 packets, 4509K bytes)
 pkts bytes target     prot opt in     out     source               destination

```

 ## CP3_lr_firewalls_xx.sh script

``` 
# Close everything and flush chains
echo "-------------------------------------------"
echo "Flush All Iptables Chains/Firewall rules"
iptables -F
 
echo "Delete all Iptables Chains"
iptables -X

# Firewall Settings to allow specific traffic on Router INPUT chain
echo "-------------------------------------------"
echo "allow any INPUT tcp traffic if RELATED or ESTABLISHED"
iptables -A INPUT -p tcp -m state --state RELATED,ESTABLISHED -j ACCEPT

echo "-------------------------------------------"
echo "allow icmp traffic into the VM"
iptables -A INPUT -p icmp -j ACCEPT

echo "-------------------------------------------"
echo "allow any traffic from loopback interface into the VM"
iptables -A INPUT -i lo -j ACCEPT

echo "-------------------------------------------"
echo "ssh"
echo "allow destination SSH traffic on port 22 from Source IP subnet student_vnet into the VM"
iptables -A INPUT -p tcp -s 10.38.200.4/24 -m state --state NEW --dport 22 -j ACCEPT 

echo "-------------------------------------------"
echo "reject all other INPUT traffic to this machine"
iptables -A INPUT -j DROP

# Firewall Settings to allow specific traffic on Router FORWARD chain
echo "-------------------------------------------"
echo "DNS"
echo "allow any tcp and udp traffic pass through Linux router for DNS protocol"
# iptables -I FORWARD -p tcp --dport 53 -m limit --limit 10/s -j LOG --log-prefix "DNS-"
iptables -A FORWARD -p tcp -d 172.17.47.36 --dport 53 -j ACCEPT
iptables -A FORWARD -p tcp -s 172.17.47.36 --sport 53 -j ACCEPT
iptables -A FORWARD -p udp -d 172.17.47.36 --dport 53 -j ACCEPT
iptables -A FORWARD -p udp -s 172.17.47.36 --sport 53 -j ACCEPT

echo "-------------------------------------------"
echo "RDP"
echo "allow any tcp and  udp traffic pass through source WC-47 subnet to destination WS-47 for destination rdp protocol"
iptables -A FORWARD -p tcp -s 10.38.200.4/24 -d 172.17.47.36 --dport 3389 -j ACCEPT
echo "allow any tcp and udp traffic pass through Source WS-47 to Destination WC-47 subnet for source rdp protocol"
iptables -A FORWARD -p tcp -d 10.38.200.4/24 -s 172.17.47.36 --sport 3389 -j ACCEPT

echo "-------------------------------------------"
echo "MySQL"
echo "allow any tcp traffic pass through Source WC-47 subnet to Destination LS-47 for destination MySQL protocol"
iptables -A FORWARD -p tcp -s 10.38.200.4/24 -d 172.17.47.37 --dport 3306 -j ACCEPT
echo "allow any tcp traffic pass through Source WS-47 to destination WC-47 subnet for source MySQL protocol"
iptables -A FORWARD -p tcp -d 10.38.200.4/24 -s 172.17.47.37 --sport 3306 -j ACCEPT

echo "-------------------------------------------"
echo "Apache"
echo "allow any tcp traffic pass through Source WC-47 subnet to Destination WS-47 for destination Apache protocol"
iptables -A FORWARD -p tcp -s 10.38.200.4/24 -d 172.17.47.37 --dport 80 -j ACCEPT
echo "allow any tcp traffic pass through Source WS-47 to destination WC-47 subnet for source Apache protocol"
iptables -A FORWARD -p tcp -d 10.38.200.4/24 -s 172.17.47.37 --sport 80 -j ACCEPT

echo "-------------------------------------------"
echo "IIS"
echo "allow any tcp traffic pass through Source WC-47 subnet to Destination LR-47 for destination HTTP protocol to access IIS"
iptables -A FORWARD -p tcp -s 10.38.200.4/24 -d 172.17.47.36 --dport 80 -j ACCEPT
echo "allow any tcp traffic pass through Source LS-47 to destination WC-47 subnet for source HTTP protocol to access IIS"
iptables -A FORWARD -p tcp -d 10.38.200.4/24 -s 172.17.47.36 --sport 80 -j ACCEPT

echo "-------------------------------------------"
echo "FTP Administration Port"
echo "allow any tcp traffic pass through Source WC-47 subnet to Destination LR-47 for destination FTP protocol"
iptables -A FORWARD -p tcp -s 10.38.200.4/24 -d 172.17.47.36 --dport 21 -j ACCEPT
echo "allow any tcp traffic pass through Source LS-47 to destination WC-47 subnet for source FTP protocol"
iptables -A FORWARD -p tcp -d 10.38.200.4/24 -s 172.17.47.36 --sport 21 -j ACCEPT

echo "-------------------------------------------"
echo "FTP DATA Port"
echo "allow any tcp traffic pass through Source WC-47 subnet to Destination LR-47 for destination FTP protocol"
iptables -A FORWARD -p tcp -s 10.38.200.4/24 -d 172.17.47.36 --dport 40001:40010 -j ACCEPT
echo "allow any tcp traffic pass through Source LS -47 to destination WC-47 subnet for source FTP protocol"
iptables -A FORWARD -p tcp -d 10.38.200.4/24 -s 172.17.47.36 --sport 40001:40010 -j ACCEPT

echo "-------------------------------------------"
echo "SSH"
echo "allow any tcp traffic pass through Source WC-47 subnet to Destination LR-47 for destination SSH protocol"
iptables -A FORWARD -p tcp -s 10.38.200.4/24 -d 172.17.47.37 --dport 22 -j ACCEPT
echo "allow any tcp traffic pass through Source LS-47 to destination WC-47 subnet for source SSH protocol"
iptables -A FORWARD -p tcp -d 10.38.200.4/24 -s 172.17.47.37 --sport 22 -j ACCEPT

echo "-------------------------------------------"
echo "reject all FORWARD traffic from this machine"
iptables -A FORWARD -j DROP

echo "-------------------------------------------"
echo "list current iptables status"
iptables -nvL

```
## screenshot of iptables from Linux Router VM 
![lr_iptables](https://user-images.githubusercontent.com/113653738/199390699-de03f819-6670-40de-96ab-5f83e16ae5c3.jpg)


## iptables for Linux Server VM 
```
[ddutt3@LS-47 ~]$ sudo iptables -nvL
Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
  801  164K ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            state RELATED,ESTABLISHED
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0            0.0.0.0/0
    0     0 ACCEPT     all  --  lo     *       0.0.0.0/0            0.0.0.0/0
    2   120 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            tcp dpt:22
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            tcp dpt:80
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            tcp dpt:3306
    4   288 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
    0     0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
  726  261K ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            state RELATED,ESTABLISHED
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            tcp dpt:22
  108  6480 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            tcp dpt:80
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0            0.0.0.0/0
  738 60936 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0

```
## CP3_ls_firewalls_xx.sh script 

```
#Firewall Settings to allow specific traffic on Server
#ESTABLISHED meaning that the packet is associated with a connection which has seen packets in both directions.
#RELATED meaning that the packet is starting a new connection

# Close everything and flush chains
echo "-------------------------------------------"
echo "Flush All Iptables Chains/Firewall rules"
iptables -F
 
echo "Delete all Iptables Chains"
echo "-------------------------------------------"
iptables -X

# Firewall Settings to allow specific traffic on Router INPUT chain
echo "-------------------------------------------"
echo "allow any INPUT tcp traffic if RELATED or ESTABLISHED"
iptables -A INPUT -p tcp -m state --state RELATED,ESTABLISHED -j ACCEPT

echo "-------------------------------------------"
echo "allow icmp traffic into the VM"
echo "icmp"
iptables -A INPUT -p icmp -j ACCEPT

echo "-------------------------------------------"
echo "allow any traffic from loopback interface into the VM"
echo "loopback"
iptables -A INPUT -i lo -j ACCEPT

echo "-------------------------------------------"
echo "allow any destination to access SSH traffic on port 22 into the VM"
echo "ssh"
iptables -A INPUT -p tcp --dport 22 -j ACCEPT

echo "-------------------------------------------"
echo "allow to any destination to access HTTP traffic on port 80 into the VM"
echo "http"
iptables -A INPUT -p tcp --dport 80 -j ACCEPT

echo "-------------------------------------------"
echo "allow to any destination to access MariaDB traffic on port 3306 into the VM"
echo "MySQL"
iptables -A INPUT -p tcp --dport 3306 -j ACCEPT

echo "-------------------------------------------"
echo "reject all other INPUT traffic to this machine"
iptables -A INPUT -j DROP

echo "-------------------------------------------"
echo "allow any OUTPUT tcp traffic if RELATED or ESTABLISHED"
iptables -A OUTPUT -p tcp -m state --state RELATED,ESTABLISHED -j ACCEPT

echo "-------------------------------------------"
echo "allow to to access HTTP traffic on port 22 into the VM"
iptables -A OUTPUT -p tcp --dport 22 -j ACCEPT

echo "-------------------------------------------"
echo "allow to to access HTTP traffic on port 80 into the VM"
iptables -A OUTPUT -p tcp --dport 80 -j ACCEPT

echo "-------------------------------------------"
echo "allow icmp traffic from the VM"
iptables -A OUTPUT -p icmp -j ACCEPT

echo "-------------------------------------------"
echo "reject all other OUTPUT traffic from this machine"
iptables -A OUTPUT -j DROP

echo "-------------------------------------------"
echo "reject all FORWARD traffic from this machine"
iptables -A FORWARD -j DROP

echo "-------------------------------------------"
echo "list current iptables status"
iptables -nvL

```

## screenshot of iptables from Linux Server VM
![ls_iptables](https://user-images.githubusercontent.com/113653738/199390701-7d376411-b4eb-4cc7-99fd-cfcf5438dd86.jpg)

