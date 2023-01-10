bits 16

header_start:
jmp short header_end
nop  ; header entry
BPB_OEM:                db "MSWIN4.1"
BPB_SECTOR_SIZE:        dw 512
BPB_SECT_PER_CLUSTER:   db 1
BPB_RESERVED_SECTORS:   dw 32
BPB_FAT_COUNT:          db 2
BPB_ROOT_ENTRY_COUNT:   dw 0
BPB_SECTOR_COUNT:       dw 0
BPB_MEDIA_TYPE:         db 0xF8
                        dw 0
BPB_TRACK_SECTORS:      dw 32
BPB_HEAD_COUNT:         dw 64
BPB_HIDDEN_SECT_COUNT:  dd 0
BPB_LARGE_SECT_COUNT:   dd 204800
BPB_SECTORS_PER_FAT:    dd 1576
BPB_FLAGS:              dw 0
BPB_FAT_VERSION:        dw 0
BPB_ROOT_CLUSTER:       dd 2
BPB_INFO_STRUCT_SECT:   dw 1
BPB_BACKUP_BOOT_SECT:   dw 6
                        times 3 dd 0
BPB_DRIVE_NUMBER:       db 0x80
                        db 0
BPB_SIGNATURE:          db 0x29
BPB_SERIAL_NUMBER:      dd 0xBEEFCACE
BPB_LABEL_STRING:       db 'DMNOS      '
BPB_SYS_ID:             db 'FAT32   '
header_end: