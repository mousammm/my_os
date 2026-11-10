; This is a hello world program in fasm (x86_64 asm)

; format ELF64 : 64-bit Executable and Linkable Format (ELF) file, the native binary layout used by Linux
; executable   : output should be a runnable program, rather than an unlinked object file (.o)
; 3            : sets the 7th byte of the ELF header (e_ident[EI_OSABI]) to 0x03
        ; 0	 UNIX - System V (Default)
        ; 2	 NetBSD
        ; 3	 Linux / GNU
        ; 6	 Solaris
        ; 9	 FreeBSD
        ; 12 OpenBSD
format ELF64 executable 3

entry _start                    ; entry point
segment readable executable
_start:
    ; sys_write
    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, msg_len
    syscall

    ; sys_exit(0)
    mov rax, 60
    mov rdi, 0
    syscall

segment readable writeable
msg db "Hello world!", 10, 0
msg_len = $ - msg
