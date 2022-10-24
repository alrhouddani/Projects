$email = read-host "Enter email"

Start-Process -FilePath "https://portal.nhs.net/Admin#/viewDetails/$email"