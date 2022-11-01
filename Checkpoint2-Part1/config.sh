# Checkpoint1 Resources
Location="Canada East"
RG_Name="Student-RG-735371"
Sub_ID="e22a2bd0-d760-4866-9918-1c98f501eb6a"
Student_vnet="Student-735371-vnet"
Router_vnet="Router-47"
Server_vnet="Server-47"
SubNet="SN1"
RT_Name="RT-47"
Client_SN="Virtual-Desktop-Client"
Virtual_Appliance="192.168.47.36"
Server_SN1="172.17.47.32/27"
Virtual_Desktop="10.38.200.0/24" # student-vnet address space
DevTest_Lab="CSN400-47"

Peer_RT="RoutertoStudent"
Peer_TR="StudenttoRouter"
Peer_RS="RoutertoServer"
Peer_SR="ServertoRouter"

Route_Server="Route-Server"
Route_Client="Route-Desktop"

#Checkpoint2 VM names
VM_WC="WC-47"
VM_WS="WS-47"
VM_LR="LR-47"
VM_LS="LS-47"

#Checkpoint3 Static IP setting
Static_LR="192.168.47.36"
Static_WS="172.17.47.36"
Static_LS="172.17.47.37"
dummy_IP_1="172.17.47.41"
dummy_IP_2="172.17.47.42"
NIC_LR="lr-47"
NIC_LS="ls-47"
NIC_WS="ws-47"
NIC_WC="wc-47"
Azure_Default_DNS="csn40047.com"


declare -a vm_list=("$VM_WS" "$VM_WC" "$VM_LR" "$VM_LS")
declare -a json_list=("ws.json" "wc.json" "lr.json" "ls.json")
declare -a image_list=("$VM_WS" "$VM_WC" "$VM_LR" "$VM_LS")
declare -a windowslist=("$VM_WS" "$VM_WC")
declare -a linux_list=("$VM_LR" "$VM_LS")
declare -a vnet_list=("$Server_vnet" "$Router_vnet" "$Student_vnet")
declare -a v_list=("$Server_vnet" "$Router_vnet")
declare -a nic_list=("$NIC_LR" "$NIC_LS" "$NIC_WS" "$NIC_WC")
declare -a peer_list=("$Peer_RT" "$Peer_TR" "$Peer_RS" "$Peer_SR")
declare -a route_list=("$Route_Server" "$Route_Client")
declare -a subnets_rvnet=("192.168.47.32/27" "192.168.47.64/27" "192.168.47.96/27" "192.168.47.128/27")
declare -a subnets_svnet=("172.17.47.32/27" "172.17.47.64/27" "172.17.47.96/27" "172.17.47.128/27")