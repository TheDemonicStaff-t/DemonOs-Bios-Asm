.PHONY: clean deps gen_img bootloader

gen_img: bootloader
	dd if=/dev/zero of=/workspaces/DemonOs-Bios-Asm/build/tmp.iso bs=1024 count=102400
	mkfs.fat -F 32 -n "DMNOS" -r 16 /workspaces/DemonOs-Bios-Asm/build/tmp.iso

bootloader:
	nasm -f elf64 -o build/boot1.o src/bootloader/bootsect.s
	x86_64-elf-ld -Tbuild/linker.ld -o build/boot1.bin build/boot1.o

deps:
	sudo apt update -y
	sudo apt upgrade -y
	sudo apt install nasm -y
	sudo apt install dosfstools -y
	sudo apt install mtools -y
	sudo apt install build-essential -y
	sudo apt install libgmp3-dev -y
	sudo apt install libmpc-dev -y
	sudo apt install libmpfr-dev -y
	sudo apt install texinfo -y
	sudo apt install libisl-dev -y

clean:
	rm build/boot.bin