# Set the miner's IP address
$Env:MINER_IP = "192.168.7.136"

# Logon to obtain SessionID
$response = Invoke-RestMethod -Method Post -Uri "http://$Env:MINER_IP:8080/api" -ContentType "application/json" -Body '{"command": "logon"}'
$session_id = $response.SESSION[0].SessionID

# Check if SessionID was obtained
if (-not $session_id) {
    Write-Host "Failed to obtain SessionID. Exiting."
    exit
}

Write-Host "Session ID obtained: $session_id"

# Set Fan Speed
$desired_value = 50  # Replace with your desired fan speed value
$body = @{
    command   = "fanset"
    parameter = "$desired_value"
    sessionid = "$session_id"
} | ConvertTo-Json
Invoke-RestMethod -Method Post -Uri "http://$Env:MINER_IP:8080/api" -ContentType "application/json" -Body $body

# Logoff
$body = @{
    command   = "logoff"
    sessionid = "$session_id"
} | ConvertTo-Json
Invoke-RestMethod -Method Post -Uri "http://$Env:MINER_IP:8080/api" -ContentType "application/json" -Body $body

Write-Host "Fan speed set to $desired_value% and session closed."