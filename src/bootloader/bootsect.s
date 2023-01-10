bits 16
global entry

section .fsjump
entry:
jmp short _start
nop

%include "/workspaces/DemonOs-Bios-Asm/src/bootloader/fs_header.s"

section .bsect

_start:
    ; set up drive number
    mov byte[BPB_DRIVE_NUMBER], dl
    
    ; Set up segment registers and stack
    cli
    xor ax, ax
    mov ds, ax
    mov ss, ax
    mov sp, 0x7c00
    mov bp, sp
    sti
    mov ax, 2
    mov bx, 0x7E00
    mov dl, 31
    call lba_mem_load
    hlt

; MEMORY FUNCTIONS
lba_mem_load:
; input:  ax=LBA
;         es:bx=load address
;         dl=sector count
; output:
;         [ex:bx]=data from device
    push ax
    push cx
    push dx
    push bx
    call lba_to_chs
    mov ah, 2
    mov al, dl
    mov dl, [BPB_DRIVE_NUMBER]
    int 0x13
    pop bx
    pop dx
    pop cx
    pop ax
    ret

lba_to_chs: 
; input:  ax=LBA
; output: ch=cylinder[7-0]
;         cl=cylinder[7-6]:sectors[5-0]
;         dl=head
    push ax
    push dx
    div word[BPB_TRACK_SECTORS]
    inc dx
    mov cx, dx                  ; sector
    xor dx, dx
    div word[BPB_HEAD_COUNT] 
    mov dh, dl                  ; head
    mov ch, al
    shl ah, 6
    or cl, ah                   ; cylinder
    pop ax
    mov dl, al
    pop ax
    ret
; FILE SYSTEM FUNCTIONS

%include "/workspaces/DemonOs-Bios-Asm/src/bootloader/bootloader.s"