class Process:
    def __init__(self, name, arrival_time, burst_time):
        self.name = name
        self.arrival_time = arrival_time
        self.burst_time = burst_time

def fcfs_scheduling(processes):
    completion_time = 0
    turn_around_time = 0
    waiting_time = 0
    idle_cpu_time = 0

    for process in processes:
        if process.arrival_time > completion_time:
            idle_cpu_time += process.arrival_time - completion_time
            completion_time = process.arrival_time
        completion_time += process.burst_time

        turn_around_time = completion_time - process.arrival_time
        waiting_time = turn_around_time - process.burst_time

        print(f"Process: {process.name}, Arrival Time: {process.arrival_time}, Burst Time: {process.burst_time}, Completion Time: {completion_time}, Turn Around Time: {turn_around_time}, Waiting Time: {waiting_time}")
    # Print Gantt chart
    print("Gantt Chart:")
    print("-----------")
    for process in processes:
        print(f"| {'-' *(process.arrival_time - completion_time)} {process.name}  |")
    print("-----------")

    # Print idle CPU time
    print(f"Idle CPU Time: {idle_cpu_time}")

# Define processes
processes = [
    Process("P1", 0, 2),
    Process("P2", 1, 2),
    Process("P3", 5, 3),
    Process("P4", 6, 4)
]

fcfs_scheduling(processes)
