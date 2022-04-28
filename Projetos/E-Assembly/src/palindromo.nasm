; Arquivo: palindromo.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2019
;
; Verifica se uma palavra salva na memória
; é um palíndromo ou não. Se for verdadeiro, salva 1
; em RAM[0] e 0 caso contrário.
; 
; A palavra possui tamanho fixo de 5 caracteres,
; começando no endereço 10 da RAM e terminando no
; endereço 14 da RAM. A palavra é codificado em
; ASCII.

; exemplo:
;  RAM[10] = a
;  RAM[11] = r
;  RAM[12] = a
;  RAM[13] = r
;  RAM[14] = a
; 

leaw $10, %A 
movw (%A), %D 
leaw $14, %A 
subw %D, (%A), %D   ;SE ISSO FOR IGUAL A ZERO, SIGNIFICA QUE EH A MESMA LETRA
 
leaw $ELSE, %A
jne %D
nop 

leaw $11, %A 
movw (%A), %D 
leaw $13, %A 
subw %D, (%A), %D   ;SE ISSO FOR IGUAL A ZERO, SIGNIFICA QUE EH A MESMA LETRA
 
leaw $ELSE, %A
jne %D
nop

leaw $0, %A 
movw $1, %D 
movw %D, (%A)

leaw $END, %A
jmp
nop 


ELSE:
leaw $0, %A 
movw $0, %D 
movw %D, (%A)

END: