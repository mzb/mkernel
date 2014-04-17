set -e

echo "Compiling..."
nasm -f elf32 kernel.asm -o kernel.asm.o
gcc -m32 -c kernel.c -o kernel.c.o

echo "Linking..."
ld -m elf_i386 -T kernel.ld -o kernel.exe kernel.asm.o kernel.c.o

echo "Running..."
qemu-system-i386 -kernel kernel.exe

