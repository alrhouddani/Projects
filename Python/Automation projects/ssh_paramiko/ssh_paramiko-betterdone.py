#!/usr/bin/env python3
import paramiko
from time import sleep


COMMAND_LIST = ['wget https://raw.githubusercontent.com/azurealrh/azure111/main/Vmjson.json',
                'wget https://www.python.org/ftp/python/3.7.4/Python-3.7.4.tgz',
                'tar -xf Python-3.7.4.tgz',
                'cd Python-3.7.4',
                './configure --enable-optimizations',
                'make install'
                ]  # remove this list after creating methods for each block of commands, look install_packages_via_apt()

IP = '172.25.88.166'


def ssh_connect(hostname, command):
    client = paramiko.SSHClient()
    client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    client.connect(hostname=hostname,
                   username='root',
                   port=22,
                   password='Kilokoli123',)
    stdin, stdout, stderr = client.exec_command(command)
    cmd_output = stdout.read()
    print('log: ', command, cmd_output)
    sleep(2)


def install_packages_via_apt():
    packages = ['make']
    command = 'apt install -y ' + ' '.join(pkg for pkg in packages)
    ssh_connect(IP, command)


if __name__ == '__main__':
    install_packages_via_apt()
