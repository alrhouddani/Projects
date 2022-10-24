#!/usr/bin/env python3

import subprocess


def execute(cmd, shell=True, exec_as_root=False):
    cmd = f'sudo su -c "{cmd}"' if exec_as_root is True else cmd
    process = subprocess.Popen(cmd, shell=shell,
                               stdout=subprocess.PIPE,
                               stderr=subprocess.PIPE)

    out, err = process.communicate()
    out = out.decode()
    err = err.decode()
    return [out, err]


if __name__ == '__main__':
    package_list = ['ip a flush dev enp0s3', 'ip a a 192.168.0.100/24 dev enp0s3']
    package_cmd = ' && '.join(cmd for cmd in package_list)
    package_out, package_er = execute(package_cmd, exec_as_root=True)
    print(package_cmd)

