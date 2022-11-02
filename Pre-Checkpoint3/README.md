- **COURSE INFORMATION: CSN400 Computer Systems Projects**
- **STUDENT’S NAME: Divyansh Dutt** 
- **STUDENT'S NUMBER: 129611208**
- **GITHUB USER_ID: ddutt3-129611208**
- **TEACHER’S NAME: Atoosa Nasiri**
- **ASSIGNMENT REF: Pre-Checkpoint3**

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

```## iptables for router VM

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
