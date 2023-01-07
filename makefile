DIMG := $(wildcard *.iso)

.PHONY: deps clean all mount umount

mount:
	sudo mkdir /mnt/dimg
	sudo mount -t ext4 $(DIMG) /mnt/dimg

umount:
	sudo umount /mnt/dimg
	sudo rm -rf /mnt/dimg

deps:
	sudo apt update -y
	sudo apt upgrade -y
	sudo apt install nasm -y