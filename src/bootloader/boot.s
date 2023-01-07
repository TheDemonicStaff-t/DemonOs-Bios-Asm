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



times 510 - ($-$$) db 0
dw 0xAA55

times 512 - ($-($$+0x200)) db 0

ext_superblock_start:
TOTAL_INODES:               dd 0x00006400 ; 
TOTAL_BLOCKS:               dd 0x00006400
SUPER_USER_RES_BLOCKS:      dd 0x00000500
UNUSED_BLOCK_COUNT:         dd 0x000060D0
UNUSED_INODE_COUNT:         dd 0x000063F5
SUPERBLOCK_BLOCK_NUMBER:    dd 0x00000000
ENCODED_BLOCK_SIZE:         dd 0x00000002 ; (1024 << x) = blocksize
ENCODED_FARGMENT_SIZE:      dd 0x00000002 ; (1024 << x) = fragsize
BLOCKS_PER_BLOCK_GROUP:     dd 0x00008000
FRAGMENTS_PER_BLOCK_GROUP:  dd 0x00008000
INODES_PER_BLOCK_GROUP:     dd 0x00006400
LAST_MOUNT_TIME:            dd 0x00000000 ; POSIX
LAST_WRITTEN_TIME:          dd 0x63B8EE47 ; POSIX
UNVERIFIED_MOUNT_COUNT:     dw 0x0000
UNVERIFIED_MOUNT_LIMIT:     dw 0xFFFF
                            dw 0xEF53     ; EXT2 Verification Number
FILE_SYSTEM_STATE:          dw 0x0001
FILE_SYSTEM_ERROR_HANDLE:   dw 0x0001     ; do nothing
VERSION_LOWER:              dw 0x0000
LAST_VERIFICATION_TIME:     dd 0x63B8EE47
VERIFICATION_INTERVAL:      dd 0x00000000
CREATING_OS_ID:             dd 0x00000000 ; linux
VERSION_UPPER:              dd 0x00000001
RESERVED_BLOCK_UID:         dw 0x0000     ; user id
RESERVED_BLOCK_GID:         dw 0x0000     ; group id
; -------extended superblock fields--------
FIRST_AVAILIABLE_INODE:     dd 0x0000000B
SIZE_OF_INODE:              dw 0x0080
SUPER_BLOCK_GROUP:          dw 0x0000
EXTRA_FEATURES:             dd 0x00000038 ; dirs use hash index, fs auto_resize, inode extended attr
REQUIRED_FEATURES:          dd 0x00000002 ; dirs have a type field
READ_ONLY_FEATURES:         dd 0x00000003 ; sparse superblocks, 64 bit
FILE_SYSTEM_ID:             db 0x39, 0x5e, 0x76, 0x76, 0x7D, 0x4A, 0x4F, 0x34, 0x9E, 0xF8, 0x7C, 0xB2, 0xB1, 0x7F, 0xA3, 0x88
VOLUME_NAME:                times 16 db 0
LATEST_MOUNT_PATH:          times 64 db 0
COMPRESSION_ALGORITHM:      dd 0x00000000
PRE_ALLOC_BLOCK_COUNT_FILE: db 0x00
PRE_ALLOC_BLOCK_COUNT_DIR:  db 0x00
                            dw 0x0006
JOURNAL_ID:                 times 16 db 0
JOURNAL_INODE:              dd 0x00000000
JOURNAL_DEVICE:             dd 0x00000000
ORPHAN_INODE_LIST_START:    dd 0x00000000
ext_superblock_end: