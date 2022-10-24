#!/usr/bin/env python3
from distutils.command.install_lib import install_lib
from importlib.resources import Package
import paramiko
from time import sleep

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
    command = ['make']
    command = 'apt install -y ' + ' '.join(pkg for pkg in command)
    ssh_connect(IP, command)


def wget_packages():
    files = [
        'https://raw.githubusercontent.com/azurealrh/azure111/main/Vmjson.json',
        'https://www.python.org/ftp/python/3.7.4/Python-3.7.4.tgz']
    for file in files:
        command = f'cd /tmp && wget {file}'
        ssh_connect(IP, command)


def untar_python():
    ssh_connect(IP, 'cd /tmp && tar -xf Python-3.7.4.tgz')


def install_python():
    commands = [
        'cd /tmp/Python-3.7.4',
        './configure --enable-optimizations',
        'make install']
    command = ' && '.join(cmd for cmd in commands)
    ssh_connect(IP, command)


if __name__ == '__main__':
    install_packages_via_apt()
    wget_packages()
    untar_python()
    install_python()
