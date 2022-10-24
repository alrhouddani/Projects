

def execute_powershell_command(self, cmd, force):
    if isinstance(cmd, list):
        cmd = '; '.join(cmd_ for cmd_ in cmd)
    command = f'''powershell -command "{cmd}" {'-force' if force else ''}'''
    if self.debug:
        print(f'[DEBUG]: POWERSHELL COMMAND EXECUTED AS: {command}')
    return self.execute(command)


execute_powershell_command(cmd='get-service')
