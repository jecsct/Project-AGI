#!/bin/bash

# Port number to target
PORT=8000

# Check if a process is listening on the specified port
if lsof -i :$PORT > /dev/null 2>&1; then
    # Get the PID of the process and kill it
    PID=$(lsof -ti :$PORT)
    kill -9 $PID
    echo "Process with PID $PID killed."
else
    echo "No process found listening on port $PORT."
fi