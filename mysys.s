; hello.asm
[BITS 16]          ; Configuração para 16 bits (modo real)
[ORG 0x7C00]       ; Define o endereço de carregamento

start:
    jmp cons
msg db "Hello, World!", 0 ; Mensagem a ser impressa (terminada em 0)

times 510-($-$$) db 0 ; Preenche até 510 bytes
dw 0xAA55             ; Assinatura do setor de boot (0xAA55)
cons:
    push ds
    mov ax,0xb800
    mov ds,ax
    mov cx,4000
    mov ax,0x6020
    mov bx,0
loop1:
    ds
    mov [bx],ax
    inc bx
    inc bx
    dec cx
    cmp cx,0
    jnz loop1

    pop ds
    mov bp, msg     ; Ponteiro para a mensagem
    mov bl,0x60
    mov bh,0
    mov dh,0
    mov dl,0
    mov cx,1000
    mov ah,0x13
    mov al,0x1
    int 0x10
    
.hang:
    cli             ; Desabilita interrupções
    hlt             ; Entra em estado de espera

