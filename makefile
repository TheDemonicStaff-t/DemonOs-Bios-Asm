.PHONY: deps clean all mount umount bootloader kernel dimg

dimg: bootloader
	dd if=/dev/zero of=/workspaces/DemonOs-Bios-Asm/DemonOs.iso bs=1024 count=102400
	mkfs.ext2 DemonOs.iso
	dd if=/workspaces/DemonOs-Bios-Asm/build/boot.bin of=/workspaces/DemonOs-Bios-Asm/DemonOs.iso conv=notrunc

bootloader:
	nasm -f bin src/bootloader/boot.s -o build/boot.bin

mount:
	sudo mkdir /mnt/dimg
	sudo mount -t ext2 DemonOs.iso /mnt/dimg

umount:
	sudo umount /mnt/dimg
	sudo rm -rf /mnt/dimg

deps:
	sudo apt update -y
	sudo apt upgrade -y
	sudo apt install nasm -y

clean:
	rm build/boot.bin