class Process:
    def __init__(self, name, arrival_time, burst_time):
        self.name = name
        self.arrival_time = arrival_time
        self.burst_time = burst_time

def sjf_scheduling(processes):
    # Sort processes by arrival time and burst time
    processes.sort(key=lambda x: (x.arrival_time, x.burst_time))
    
    completion_time = 0
    turn_around_time = 0
    waiting_time = 0
    idle_cpu_time = 0
    completed_processes = []

    while processes:
        # Filter processes that have arrived
        available_processes = [p for p in processes if p.arrival_time <= completion_time]
        
        if available_processes:
            # Select the process with the shortest burst time
            current_process = min(available_processes, key=lambda x: x.burst_time)
            processes.remove(current_process)
            
            # Update completion time
            completion_time += current_process.burst_time
            
            # Calculate turnaround time and waiting time
            turn_around_time = completion_time - current_process.arrival_time
            waiting_time = turn_around_time - current_process.burst_time
            
            completed_processes.append((current_process.name, current_process.arrival_time, current_process.burst_time, completion_time, turn_around_time, waiting_time))
        else:
            # If no process is available, move time forward
            completion_time += 1
            idle_cpu_time += 1

    # Print results
    for name, arrival, burst, comp_time, tat, wt in completed_processes:
        print(f"Process: {name}, Arrival Time: {arrival}, Burst Time: {burst}, Completion Time: {comp_time}, Turn Around Time: {tat}, Waiting Time: {wt}")
    
    # Print Gantt chart
    print("Gantt Chart:")
    print("-----------")
    for name, _, _, _, _, _ in completed_processes:
        print(f"| {name} ", end="")
    print("|")
    print("-----------")

    # Print idle CPU time
    print(f"Idle CPU Time: {idle_cpu_time}")

# Define processes
processes = [
    Process("P1", 0, 8),
    Process("P2", 1, 4),
    Process("P3", 2, 9),
    Process("P4", 3, 5)
]

sjf_scheduling(processes)
