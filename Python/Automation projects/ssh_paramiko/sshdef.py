import paramiko


def ssh_connect(hostname, username, password):
    sshclient = paramiko.SSHClient()
    sshclient.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    try:
        sshclient.connect(hostname, username, password)
    except Exception:
        raise
    return sshclient


ssh_connect(hostname='172.25.88.166', username='alrh', password='Kilokoli123')
