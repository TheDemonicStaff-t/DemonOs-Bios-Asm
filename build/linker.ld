ENTRY(entry)
OUTPUT_FORMAT("binary")
phys = 0x7C00;                  

SECTIONS
{
    . = phys;

    .fsjump             : { *(.fsjump)              }

    .fsheaders          : { *(.fsheaders)           }

    .bsect               : { *(.bsect)              }

    .bios_footer 0x7DFE : { SHORT(0xAA55)           }

    .text               : { *(.text)                }

    .cap 0xBBFF         : { BYTE(0x00)              }
}