# Define an array to store process information
declare -a processes

# Add processes to the array
processes+=("P1 0 10")  # Process name, arrival time, and burst time
processes+=("P2 2 5")
processes+=("P3 4 8")
processes+=("P4 6 12")

# Initialize variables to store completion time, turn around time, and waiting time
completion_time=0
turn_around_time=0
waiting_time=0

# Initialize variable to store idle CPU time
idle_cpu_time=0

# Iterate through the processes
for process in "${processes[@]}"; do
  # Extract process name, arrival time, and burst time
  name=${process:0:2}
  arrival_time=${process:3:1}
  burst_time=${process:5:1}

  # Calculate completion time
  if [ $arrival_time -gt $completion_time ]; then
    idle_cpu_time=$((idle_cpu_time + arrival_time - completion_time))
    completion_time=$arrival_time
  fi
  completion_time=$((completion_time + burst_time))

  # Calculate turn around time
  turn_around_time=$((completion_time - arrival_time))

  # Calculate waiting time
  waiting_time=$((turn_around_time - burst_time))

  # Print process information
  echo "Process: $name, Arrival Time: $arrival_time, Burst Time: $burst_time, Completion Time: $completion_time, Turn Around Time: $turn_around_time, Waiting Time: $waiting_time"
done

# Print Gantt chart
echo "Gantt Chart:"
echo "-----------"
for process in "${processes[@]}"; do
  name=${process:0:2}
  arrival_time=${process:3:1}
  burst_time=${process:5:1}
  echo -n "| "
  for ((i=arrival_time; i<completion_time; i++)); do
    echo -n "-"
  done
  echo -n " $name "
  for ((i=completion_time; i<completion_time+burst_time; i++)); do
    echo -n "-"
  done
  echo "|"
done
echo "-----------"

# Print idle CPU time
echo "Idle CPU Time: $idle_cpu_time"
