ls .ssh
ssh-copy-id --identity_file .ssh/id_rsa.pub ubuntu-dev02
sudo visudo 
administrator ALL=(ALL) NOPASSWD: ALL
#ansible -m ping all

ansible -m raw -a '/usr/bin/uptime' all
ansible  -m shell -a 'python3 -version' all
ansible  -m shell -a 'python3 -V' vm #group of hosts
ansible  all -a 'uptime' 
ansible  all -b -a  'sudo whoami' #-b for be sudo

#use a module
ansible all -m command -a 'reboot'
ansible all -b -m apt -a 'name=apache2 state=present'
ansible vm -b -m apt -a 'name=apache2 state=absent'

#yum
ansible all -b -m yum -a 'name=httpd state=latest'
ansible all -b -m service -a 'name=sshd enabled=true'
ansible all -b -m service -a 'name=sshd enabled=true'
ansible vm -b  -a 'whoami'
ansible all -b -m command -a 'echo "Hello" > /root/hello.txt'
ansible all -b -m shell -a 'echo "Hello" > /root/hello.txt'

#create file
#Add hoc mode
ansible all -b -m shell -a 'echo "Hello_again" >> /root/hello.txt'
ansible vm -b -m file -a 'path=/root/hello.txt state=absent'

#copy files 
ansible vm -b -m copy -a 'src=/etc/hosts dest=/etc/hosts'

#play book

ansible-playbook playbook.yaml
#as root
ansible-playbook -b playbook.yaml
#or add   become: true
ansible-playbook -b -v playbook.yaml

#playbook handlers
