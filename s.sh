#!/bin/bash

g++ $1 -o err_code
g++ $2 -o brute_code
g++ gen.cpp -o gen

for ((i = 1; ; i++)); do
    echo $i
    ./gen $i > in
    diff -w <(./err_code < in) <(./brute_code < in) || break
done
