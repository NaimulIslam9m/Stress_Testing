@echo off
g++ -std=c++17 -o Generator.exe Generator.cpp
g++ -std=c++17 -o Error.exe Error.cpp
g++ -std=c++17 -o Brute.exe Brute.cpp

for /l %%x in (1, 1, 10000000) do (
    Generator > input.in
    Error < input.in > error.out
    Brute < input.in > brute.out
    fc error.out brute.out > diagnostics || exit /b
    echo %%x
)
echo all tests passed
pause