g++ Error.cpp -o Error
g++ Brute.cpp -o Brute
g++ Generator.cpp -o Generator

for ((i = 1; ; i++)); do
    echo $i
    ./Generator $i > in
    diff -w <(./Error < in) <(./Brute < in) || break
done
