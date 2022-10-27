#Managing Kernel Modules
#What are some of the things the kernel is responsible for?
#Diagram 15]
#The kernel manages:
#Memory
#Processes
#Devices
#Resource allocation
#File system access
#[?] So pretty much everything has to run through it?
#[Diagram 16]
#Kernel execution
#User space
#Kernel space
#[?] Are there different kinds of kernels available?
#Monolithic kernels
#All system modules run in kernel space
#Fast interaction between kernel and module
#Large size (RAM)
#Microkernel
#Most system modules run in user space
#Smaller size Worse performance
#Linux is monolithic
#[?] How can we see information about our kernel
uname -a
#[?] Do we ever have to modify the kernel?
#System updates
#Load kernel modules
##.ko files
ls /lib/modules
ls /usr/lib/modules
# How do we view and install modules? Lists modules
lsmod
lsmod | less
lsmod | grep bluetooth
# get info about a module
modinfo sysfillrect | grep description
#Provides information on a module
cd /lib/modules/ <version >/kernel/drivers/bluetooth
#Installs a module
insmod
#Removes a module
rmmod
# Once a module is installed, how do we activate it?
modprobe
#Adds/Removes modules from the kernel
/etc/modprobe.conf
/etc/modprobe.d/
depmod
Identifies module dependencies
Example
1. cd /etc/modprobe.d
2. sudo vim btusb.conf
alias blue btusb
3. sudo modprobe -a blue
4. lsmod | grep btusb
#Is there anything else we may need to configure for our kernel?
Kernel options
Modifies the behavior of the kernel
sysctl -a
Lists parameters
