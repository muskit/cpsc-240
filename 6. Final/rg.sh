# Name: REDACTED
# Section: CPSC 240-07
# E-mail: REDACTED

#!/bin/bash

rm *.o
rm *.out

echo "Compiling files..."

nasm -g -f elf64 -F dwarf -o electric.o electric.asm

g++ -g -c -m64 -std=c++17 -fno-pie -no-pie -o driver.o driver.cpp

g++ -g -m64 -std=c++17 -fno-pie -no-pie -o application.out *.o

if test -f "application.out"; then
    echo "Compilation successful. Debugging program."
    gdb application.out
else
    echo "Can't find compiled program. Build failed?"
fi