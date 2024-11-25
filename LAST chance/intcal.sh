# Function to calculate Simple Interest
calculate_si() {
    echo "Enter Principal Amount (P): "
    read principal
    echo "Enter Rate of Interest (R) in %: "
    read rate
    echo "Enter Time (T) in years: "
    read time

    # Calculate Simple Interest
    si=$(echo "scale=2; $principal * $rate * $time / 100" | bc)
    echo "Simple Interest (SI) = $si"
}

# Function to calculate Compound Interest
calculate_ci() {
    echo "Enter Principal Amount (P): "
    read principal
    echo "Enter Rate of Interest (R) in %: "
    read rate
    echo "Enter Time (T) in years: "
    read time
    echo "Enter Number of Times Interest Applied per Time Period (n): "
    read n

    # Calculate Compound Interest
    ci=$(echo "scale=2; $principal * (1 + $rate / (100 * $n)) ^ ($n * $time) - $principal" | bc)
    echo "Compound Interest (CI) = $ci"
}

# Main menu
while true; do
    echo "Interest Calculator Menu"
    echo "1. Calculate Simple Interest (SI)"
    echo "2. Calculate Compound Interest (CI)"
    echo "3. Exit"
    read -p "Enter your choice: " choice

    case $choice in
        1)
            calculate_si
            ;;
        2)
            calculate_ci
            ;;
        3)
            echo "Exiting the calculator."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac
    echo ""
done
