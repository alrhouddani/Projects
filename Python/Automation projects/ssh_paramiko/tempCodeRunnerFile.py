from setuptools import Command


def install_python():
    commands = [
        'tar -xf Python-3.7.4.tgz', 'cd Python-3.7.4',
        'https://www.python.org/ftp/python/3.7.4/Python-3.7.4.tgz',
        './configure --enable-optimizations',
        'make install']
    command = 'cd /tmp && ' + ' && '.join(cmd for cmd in commands)


print(install_python())