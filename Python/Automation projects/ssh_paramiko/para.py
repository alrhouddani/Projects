import paramiko


def paramiko_GKG(hostname, command):
    print('running')
    try:
        port = '22'

        # created client using paramiko
        client = paramiko.SSHClient()

        # here we are loading the system
        # host keys
        client.load_system_host_keys()

        # connecting paramiko using host
        # name and password
        client.connect(hostname, port=22, username='alrh',
                       password='Kilokoli123')

        # below line command will actually
        # execute in your remote machine
        (stdin, stdout, stderr) = client.exec_command(command)

        # redirecting all the output in cmd_output
        # variable
        cmd_output = stdout.read()
        print('log: ', command, cmd_output)

    finally:
        client.close()


commands = "wget https://raw.githubusercontent.com/azurealrh/azure111/main/Vmjson.json"
paramiko_GKG('172.25.88.166', command=commands)
