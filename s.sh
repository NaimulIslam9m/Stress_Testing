for ((i = 1; ; i++)); do
    echo $i
    ./Generator $i > in
    diff -w <(./Error < in) <(./Brute < in) || break
done