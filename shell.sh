#!/bin/bash

# Set the miner's IP address
export MINER_IP="192.168.7.136"

# Logon to obtain SessionID
response=$(curl -s -X POST http://$MINER_IP:8080/api -H "Content-Type: application/json" -d '{"command": "logon"}')
session_id=$(echo $response | jq -r '.SESSION[0].SessionID')

# Check if SessionID was obtained
if [ -z "$session_id" ]; then
  echo "Failed to obtain SessionID. Exiting."
  exit 1
fi

echo "Session ID obtained: $session_id"

# Set Fan Speed
desired_value=50  # Replace with your desired fan speed value
curl -s -X POST http://$MINER_IP:8080/api -H "Content-Type: application/json" -d "{\"command\": \"fanset\", \"parameter\": \"$desired_value\", \"sessionid\": \"$session_id\"}"

# Logoff
curl -s -X POST http://$MINER_IP:8080/api -H "Content-Type: application/json" -d "{\"command\": \"logoff\", \"sessionid\": \"$session_id\"}"

echo "Fan speed set to $desired_value% and session closed."