; Arquivo: Factorial.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Calcula o fatorial do número em R0 e armazena o valor em R1.

leaw $0, %A 
movw (%A), %D 
decw %D 
leaw $2, %A 
movw %D, (%A)                   ; GUARDEI O VALOR QUE VAI MULTIPLICAR O NUMERO MAIOR EM R2
leaw $3, %A 
movw %D, (%A)

leaw $LOOP, %A 
jg %D 
nop

leaw $0, %A 
movw (%A), %D 
leaw $ZERO, %A
jle %D 
nop

BEFORELOOP:
    leaw $1, %A
    movw (%A), %D 
    leaw $0, %A 
    movw %D, (%A)               ; GUARDA O VALOR DO RESULTADO DA MULTIPLICACAO DOS DOIS NUMEROS ANTERIORES EM R0, PARA QUE SEJA MULTIPLICADO PELO PROXIMO
    leaw $3, %A 
    movw (%A), %D 
    decw %D 
    movw %D, (%A)
    leaw $2, %A 
    movw %D, (%A)

    leaw $END, %A 
    jle %D 
    nop

    movw $0, %D 
    leaw $1, %A 
    movw %D, (%A)               ; ZERA O RAM1, PARA CHEGAR NO RESULTADO CERTO


LOOP:
    leaw $0, %A 
    movw (%A), %D
    leaw $1, %A
    addw %D, (%A), %D
    movw %D, (%A)
    leaw $2, %A 
    movw (%A), %D
    decw %D 
    movw %D, (%A)

    leaw $BEFORELOOP, %A 
    jle %D 
    nop

    leaw $LOOP, %A 
    jg %D 
    nop

ZERO:
    leaw $1, %A 
    movw (%A), %D 
    incw %D 
    movw %D, (%A)

END: