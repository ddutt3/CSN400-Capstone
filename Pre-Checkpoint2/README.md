- **COURSE INFORMATION: CSN400 Computer Systems Projects**
- **STUDENT’S NAME: Divyansh Dutt** 
- **STUDENT'S NUMBER: 129611208**
- **GITHUB USER_ID: ddutt3-129611208**
- **TEACHER’S NAME: Atoosa Nasiri**
##
- **DevTest Lab Configuration**
##
To begin with, the project is started by creating the devtest lab name “CSN400-47”. It is created under the base resource group “ student-rg-735371”. For the creation settings, I turned the public environments OFF for better security and isolated environment and Auto Shutdown as default as it is the idle time for my VMs to automatically shutdown at 7PM for now to save further costs.

After creation, I entered the Configuration and policies tab so that we can set out the base environment for the virtual machines as it is important so that we do not waste the resources or getting overcharged. In the Virtual machine Size is selected as B2s which is the most commonly used size due to its favorable features for regular testers or users for the minimal work. Limiting the virtual machines per user to 4, as we do not require more than 4 machines at the same time to work throughout this course. As we required the virtual machines in different Virtual networks according to the configuration, it is necessary that we add all the 3 virtual networks in the lab environment to use further. All the virtual machines are allocated in a single resource group because there are many reasons for this, most importantly we need to connect the virtual machines further which could not be achieved without this. 
##
- **Step by step guide to create and configure each of you VMs through Portal**
##
We use devtest lab for such configurations because it provides various kinds of benefits such as isolation, easy and fast deployment. There are various steps involved to create the virtual machines.

Selecting the virtual machines images under the “Marketplace images”.
As per the network, we are creating 4 virtual machines, so we selected 4 images to deploy this, they are:

Windows 10 Pro 21H1 for Windows 10 Client
Red Hat Linux Enterprise 8.0 for Linux Router
Windows 2019 Datacenter for Windows Server 
Red Hat Linux Enterprise 8.0 for Linux server

After this we deployed each of the virtual machines very conveniently with just a few details within the devtest lab. Basically we just configured only 5 fields for each of the VM. 
VM name 
User name 
Password for windows machines and ssh key for linux machines
Virtual network
Subnet

All the virtual machines are created in different virtual networks because that is the way our topology will work. Below are the details mentioned for the virtual machines.

Windows 10 Client: WC-47
Virtual network/Subnet:  Student-735371-vnet/Virtual-Desktop-Client

Linux Router: LR-47
	Virtual network/Subnet: Router-47/SN1

Windows Server: WS-47
	Virtual network/Subnet: Server-47/SN1

Linux Server: LS-47
	Virtual network/Subnet: Server-47/SN1
	
For the linux virtual machines we configured the ssh as the authentication for which I created the storage account using the bash shell and generated the ssh key (public and private) and saved it in the storage account conveniently for the future use. The public key then was copied to both the virtual machines during their installation.

