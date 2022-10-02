- **COURSE INFORMATION: CSN400 Computer Systems Projects**
- **STUDENT’S NAME: Divyansh Dutt** 
- **STUDENT'S NUMBER: 129611208**
- **GITHUB USER_ID: ddutt3-129611208**
- **TEACHER’S NAME: Atoosa Nasiri**

## Table of Contents
## [DevTest Lab Configurations](#devtest-lab-configurations)
## [Create and configure VMs through Portal](#Create-and-configure-vms-through-portal)
## [Elaboration of configurations and services for connectivity between VMs](#elaboration-of-configurations-and-services-for-connectivity-between-vms)
## [Conclusion](#conclusion)




##
- **DevTest Lab Configurations**
##
To begin with, the project is started by creating the devtest lab name “CSN400-47”. It is created under the base resource group “ student-rg-735371”. For the creation settings, I turned the public environments OFF for better security and isolated environment and Auto Shutdown as default as it is the idle time for my VMs to automatically shutdown at 7PM for now to save further costs.

After creation, I entered the Configuration and policies tab so that we can set out the base environment for the virtual machines as it is important so that we do not waste the resources or getting overcharged. In the Virtual machine Size is selected as B2s which is the most commonly used size due to its favorable features for regular testers or users for the minimal work. Limiting the virtual machines per user to 4, as we do not require more than 4 machines at the same time to work throughout this course. As we required the virtual machines in different Virtual networks according to the configuration, it is necessary that we add all the 3 virtual networks in the lab environment to use further. All the virtual machines are allocated in a single resource group because there are many reasons for this, most importantly we need to connect the virtual machines further which could not be achieved without this. 
##
- **Create and configure VMs through Portal**
##
We use devtest lab for such configurations because it provides various kinds of benefits such as isolation, easy and fast deployment. There are various steps involved to create the virtual machines.

Selecting the virtual machines images under the “Marketplace images”.
As per the network, we are creating 4 virtual machines, so we selected 4 images to deploy this, they are:

- Windows 10 Pro 21H1 for Windows 10 Client
- Red Hat Linux Enterprise 8.0 for Linux Router
- Windows 2019 Datacenter for Windows Server 
- Red Hat Linux Enterprise 8.0 for Linux server

After this we deployed each of the virtual machines very conveniently with just a few details within the devtest lab. Basically we just configured only 5 fields for each of the VM. 
 1) VM name 
 2) User name 
 3) Password for windows machines and ssh key for linux machines
 4) Virtual network
 5) Subnet

All the virtual machines are created in different virtual networks because that is the way our topology will work. Below are the details mentioned for the virtual machines.

	Windows 10 Client: WC-47
	Virtual network/Subnet: Student-735371-vnet/Virtual-Desktop-Client

	Linux Router: LR-47
	Virtual network/Subnet: Router-47/SN1

	Windows Server: WS-47
	Virtual network/Subnet: Server-47/SN1

	Linux Server: LS-47
	Virtual network/Subnet: Server-47/SN1
	
For the linux virtual machines we configured the ssh as the authentication for which I created the storage account using the bash shell and generated the ssh key (public and private) and saved it in the storage account conveniently for the future use. The public key then was copied to both the linux virtual machines during their installation.

##
- **Elaboration of configurations and services for connectivity between VMs**
##
After the virtual machines are created, now we will combine the network by connecting the virtual machines. To access the virtual machines we used the general virtual machines tab instead of the devtest tab, we just used devtest environment to create and easily deploy the VMs. There are many ways to connect through the virtual machine interface such as RDP, SSH, Bastion. Although, in this project we are going to use the Bastion to connect the windows client virtual machine (WC-47) first. The network is designed in such a way that we can only connect to WC-47 using the bastion service, apart from that none of the other virtual machines are accessible from bastion service.

Further, we are connecting the WC-47 by the bastion service using the username and password created at the time of VM deployment. In this there will be no error and the graphic user interface window will be opened as a typical windows 10. This shows that we have  successfully and correctly configured the virtual machine “WC-47”. After this, we should be able to connect to our second virtual machine because we have already configured peering between the WC-47 and LR-47 due to which we should be able to successfully ssh into the LR-47. Although, we need the ssh key into our WC-47 in order to connect it to the LR-47.

To achieve this, we will create a file on the desktop will the same name “linuxrouter” in order to avoid further naming confusion in this file we will copy and paste the private key. This means when we attempt to connect to the LR-47 from the WC-47 command prompt, it will search for the private key on the file that we will mention in the command because the public key of the same has already been saved to the LR-47 during the creation of the machine. The command to connect through the ssh is:

	ssh  -i  ./routerlinux  ddutt3@192.168.47.36
	
After this the virtual machine LR-47 is successfully connected using the ssh, this can be confirmed also by seeing the name hostname.
Similarly, we can also connect the 3rd virtual machine in the network which is linux server ”LS-47” because the ssh public key was also saved into the VM during deployment and the peering is also enabled between LR-47 and LS-47. 
Now there is another way to connect the WC-47 to LS-47 without even using bastion. We can use RDP connection to connect both of them because there are route tables configured already and peering is there.
To achieve  this there are few configurations required such as NIC interface:
Enable IP forwarding in the NIC so that the traffic can be forwarded.
IP tables are also required to be configured to successfully connect through RDP.
##
- **Conclusion**
##
In brief, there are lots of benefits of using the devtest labs because it gives an isolated environment to create and test the network configurations, and also help in fast and easy deployment of resources. In our configuration I was able to learn the importance of devtest labs and how to configure it and use it, what a storage account is and how it works when it comes to storing ssh keys and using them, and how to connect another virtual machine using ssh key within one VMs shell. The importance of peering and route tables which help us to connect 2 devices without the need of SSH using the RDP connection although, for this NIC needs to be configured properly.
