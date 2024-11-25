echo "Enter a number: "
read number

# Check if the number is even or odd
if [ $(( number % 2 )) -eq 0 ]; then
    echo "$number is an even number."
else
    echo "$number is an odd number."
fi
