; Arquivo: Abs.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Multiplica o valor de RAM[1] com RAM[0] salvando em RAM[3]

LOOP:
 leaw $1, %A
 movw (%A), %D
 leaw $3, %A
 addw %D, (%A), %D 
 movw %D, (%A)

 leaw $0, %A 
 movw (%A), %D
 decw %D 
 movw %D, (%A)

 jg %D
 nop ;POR QUE ISSO FAZ VOLTAR LA PRA CIMA? nao precisa de leaw $LOOP, %A sendo que pro mod precisa