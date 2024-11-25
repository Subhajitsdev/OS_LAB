read -p "Enter a string: " input_string

# Reverse the string and compare with the original

input_string_l=$(echo "$input_string" | tr '[:upper:]' '[:lower:]' )

if [[ "$input_string_l" == "$(rev <<< "$input_string_l")" ]]; then
    echo "The entered string '$input_string' is a palindrome."
else
    echo "The entered string '$input_string' is not a palindrome."
fi

