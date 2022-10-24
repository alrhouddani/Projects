netstat -a
Get-NetTCPConnection | Where-object { $_.state -eq "Listen"} | select-object LocalAddress, LocalPort, RemoteAddress, State, AppliedSetting, OwningProcess | format-table


