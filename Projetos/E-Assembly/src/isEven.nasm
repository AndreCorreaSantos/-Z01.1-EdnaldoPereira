; Arquivo: isEven.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2019
;
; Verifica se o valor salvo no endereço RAM[5] é
; par. Se for verdadeiro, salva 1
; em RAM[0] e 0 caso contrário.

LOOP:
    leaw $5, %A 
    movw (%A), %D 
    decw %D 
    decw %D 
    movw %D, (%A)

    decw %D 
    decw %D

    leaw $LOOP, %A
    jge %D
    nop

leaw $5, %A 
movw (%A), %D 

leaw $END, %A 
jg %D 
nop 

ELSE:
    leaw $0, %A 
    movw (%A), %D 
    incw %D
    movw %D, (%A)

END: