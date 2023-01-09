.PHONY: clean deps gen_img

gen_img:
	dd if=/dev/zero of=/workspaces/DemonOs-Bios-Asm/build/tmp.iso bs=1024 count=102400
	mkfs.fat -F 32 -n "DMNOS" -r 16 /workspaces/DemonOs-Bios-Asm/build/tmp.iso

deps:
	sudo apt update -y
	sudo apt upgrade -y
	sudo apt install nasm -y
	sudo apt install dosfstools -y
	sudo apt install mtools -y

clean:
	rm build/boot.bin