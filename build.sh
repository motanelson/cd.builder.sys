printf "\033c\033[43;30m"
nasm mysys.s -o mysys.bin
python3 linux.py
qemu-system-x86_64 -cdrom cd1.iso