; ------------------------------------------------------------
; Arquivo: Mod.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017
;
; Calcula o resto da divisão (modulus) entre RAM[0] por RAM[1]
; e armazena o resultado na RAM[2].
;
; 4  % 3 = 1
; 10 % 7 = 3
; ------------------------------------------------------------

LOOP:
    leaw $0, %A
    movw (%A), %D
    leaw $1, %A 
    subw %D, (%A), %D ; PEGA O RESULTADO DA SUBSTRACAO DE RAM 0 POR RAM 1
    leaw $0, %A
    movw %D, (%A) ; GUARDA O VALOR DA SUBTRACAO EM RAM 0
    leaw $2, %A 
    movw %D, (%A) ; GUARDA O VALOR DA SUBTRACAO EM RAM 2
    leaw $1, %A 
    subw %D, (%A), %D ; SUBTRACAO DO RESULTADO DE RAM0 - RAM 1, PARA VER SE EH NEGATIVO. SE FOR, %D EH O RESTO DA DIVISAO, SE NAO, DA PRA DIVIDIR MAIS
    leaw $LOOP, %A
    jge %D
    nop