#!/bin/bash

# Script: monitor_system.sh
# Purpose: Logs the current CPU and memory usage to a file at a defined interval. 
# Author: Lucky Pawar 
# Date: 2025-11-07


# --- Configuration ---
# 1. Define the log file path
LOG_FILE="D:\KRMU\Sem-1\CSFCP\Assignments\A-2\Solutions\Code\proj_files\system_monitor.log" 

# 2. Define the monitoring interval (in seconds)
INTERVAL_SECONDS=5 # Log data every 5 seconds 

# 3. Define how many times to run the logging process
MAX_RUNS=10 # Run the loop 10 times (50 seconds total monitoring) 

# Variable to track the current run count
CURRENT_RUN=0 

# --- Initialization ---
# Add a header to the log file with the starting timestamp
echo "--- System Monitoring Started on $(date) ---" >> "$LOG_FILE" 
echo "Timestamp | CPU Usage (%) | Memory Used (MB) | Total Memory (MB)" >> "$LOG_FILE" 

# --- Main Logic ---
echo "Monitoring system usage. Press Ctrl+C to stop early."
echo "Output is being written to: $LOG_FILE"

# Start the monitoring loop
while [ "$CURRENT_RUN" -lt "$MAX_RUNS" ]; do
    # 1. Get CPU utilization (idle percentage from 'top -bn1')
    # Using awk to extract the idle percentage and calculate used CPU percentage
    CPU_IDLE=$(top -bn1 | grep "Cpu(s)" | awk '{print $8}' | cut -d ',' -f 1) 
    CPU_USED=$(echo "100 - $CPU_IDLE" | bc) 

    # 2. Get Memory usage (Total and Used from 'free -m')
    # -m ensures output is in Megabytes
    MEM_TOTAL=$(free -m | grep Mem | awk '{print $2}') 
    MEM_USED=$(free -m | grep Mem | awk '{print $3}') 
    
    # 3. Get the current timestamp for the log entry
    CURRENT_TIME=$(date +%H:%M:%S) 
    
    # 4. Append the data to the log file
    echo "$CURRENT_TIME | $CPU_USED | $MEM_USED | $MEM_TOTAL" >> "$LOG_FILE" 
    
    # Increment the run counter
    CURRENT_RUN=$((CURRENT_RUN + 1))

    # Wait for the defined interval before the next log entry
    sleep "$INTERVAL_SECONDS" 
done

echo "--- Monitoring Complete (Reached $MAX_RUNS runs) ---" >> "$LOG_FILE"