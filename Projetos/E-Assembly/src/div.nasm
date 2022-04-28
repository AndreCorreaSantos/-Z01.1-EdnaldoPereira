; Arquivo: Div.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Divide R0 por R1 e armazena o resultado em R2.
; (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
; divisao para numeros inteiros positivos

LOOP:
    leaw $0, %A
    movw (%A), %D
    leaw $1, %A 
    subw %D, (%A), %D ; PEGA O RESULTADO DA SUBSTRACAO DE RAM 0 POR RAM 1
    leaw $0, %A
    movw %D, (%A) ; GUARDA O VALOR DA SUBTRACAO EM RAM 0
    leaw $2, %A 
    movw (%A), %D
    incw %D 
    movw %D, (%A)
    leaw $0, %A 
    movw (%A), %D
    leaw $1, %A 
    subw %D, (%A), %D ; SUBTRACAO DO RESULTADO DE RAM0 - RAM 1, PARA VER SE EH NEGATIVO. SE FOR, %D EH O RESTO DA DIVISAO, SE NAO, DA PRA DIVIDIR MAIS
    leaw $LOOP, %A
    jge %D
    nop