import paramiko


ssh = paramiko.SSHClient()

ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())

ssh.connect('172.25.88.166', port=22, username='alrh',
            password='Kilokoli123', timeout=3)

stdin, stdout, stderr = ssh.exec_command('show ip interface brief')
