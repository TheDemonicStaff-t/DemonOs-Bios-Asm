bits 16
org 0x7c00
global _start

section .text

_start:

%include "fs_header.s"