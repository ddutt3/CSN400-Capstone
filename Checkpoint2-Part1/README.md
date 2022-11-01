- **COURSE INFORMATION: CSN400 Computer Systems Projects**
- **STUDENT’S NAME: Divyansh Dutt** 
- **STUDENT'S NUMBER: 129611208**
- **GITHUB USER_ID: ddutt3-129611208**
- **TEACHER’S NAME: Atoosa Nasiri**
- **ASSIGNMENT REF: Checkpoint2-Part1-Report**

## Table of Contents
-  [Network Topology](#network-topology)
-  [Single Line Code Snippet](#single-line-code-snippet)
-  [Multi Line Bash Script](#multi-line-bash-script)
-  [Sample Json Objects](#sample-json-objects)
-  [Sample Table](#sample-table)
-  [Sample Hperlink](#sample-hyperlink)


az lab vm list  --lab-name CSN400-xx --resource-group Student-RG-xxxxxx

[]

az lab custom-image list  --lab-name CSN400-xx --resource-group Student-RG-xxxxxx --query "[ [].name , [].vm.sourceVmId ]" 

[
  [
    "LR-47ci",
    "LS-47ci",
    "WS-47ci",
    "WC-47ci"
  ],
  [
    "/subscriptions/e22a2bd0-d760-4866-9918-1c98f501eb6a/resourcegroups/student-rg-735371/providers/microsoft.devtestlab/labs/csn400-47/virtualmachines/lr-47",
    "/subscriptions/e22a2bd0-d760-4866-9918-1c98f501eb6a/resourcegroups/student-rg-735371/providers/microsoft.devtestlab/labs/csn400-47/virtualmachines/ls-47",
    "/subscriptions/e22a2bd0-d760-4866-9918-1c98f501eb6a/resourcegroups/student-rg-735371/providers/microsoft.devtestlab/labs/csn400-47/virtualmachines/ws-47",
    "/subscriptions/e22a2bd0-d760-4866-9918-1c98f501eb6a/resourcegroups/student-rg-735371/providers/microsoft.devtestlab/labs/csn400-47/virtualmachines/wc-47"
  ]
]

lr -iptables

[ddutt3@LR-47 ~]$ sudo iptables -nvL
Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
 3075  675K ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0            state RELATED,ESTABLISHED
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0            0.0.0.0/0
    0     0 ACCEPT     all  --  lo     *       0.0.0.0/0            0.0.0.0/0
    1    52 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            state NEW tcp dpt:22
    5   297 REJECT     all  --  *      *       0.0.0.0/0            0.0.0.0/0            reject-with icmp-host-prohibited

Chain FORWARD (policy ACCEPT 2010 packets, 993K bytes)
 pkts bytes target     prot opt in     out     source               destination

Chain OUTPUT (policy ACCEPT 3765 packets, 976K bytes)
 pkts bytes target     prot opt in     out     source               destination



ls -iptables

[ddutt3@LS-47 ~]$ sudo iptables -nvL
Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination

Chain FORWARD (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
