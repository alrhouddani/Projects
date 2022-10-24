Get-Service | Where-Object { $_.Status -eq "Stopped" }
Get-Service | Where-Object Status -eq "Stopped"

Get-Service | grid-view



           