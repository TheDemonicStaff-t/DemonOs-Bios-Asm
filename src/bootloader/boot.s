org 0x7c00
bits 16

start:
    cli
    xor ax, ax
    mov ss, ax
    mov ds, ax
    mov sp, 0x7c00
    mov bp, sp
    sti

    jmp $



times 512 - ($-$$) db 0
db 0xAA55

pci_data: