; Arquivo: LCDQuadrado.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2018
;
; Desenhe uma linha no LCD

leaw $16384, %A 
movw %A, %D
leaw $0, %A     ; definindo o número
movw %D, (%A)   ; inicial na RAM[0]

leaw $19, %A
movw %A, %D
leaw $1, %A     ; definindo o número do
movw %D, (%A)   ; contador na RAM [1]

LOOP:           ; loop para desenhar no LCD
leaw $0, %A
movw (%A), %D
addw $1, %D, (%A)
movw %D, %A
movw $-1, (%A)

leaw $1, %A     ; decrementa do contador
movw (%A), %D
decw %D
movw %D, (%A)
 
leaw $LOOP, %A  ; verifica se contador é 
jge %D          ; maior do que zero
nop

leaw $END, %A   ; verifica se contador 
je %D           ; é igual a zero
nop

END: