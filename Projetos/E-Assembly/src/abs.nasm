; Arquivo: Abs.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Copia o valor de RAM[1] para RAM[0] deixando o valor sempre positivo.

 leaw $1, %A 
 movw (%A), %D 
 
 leaw $ELSE, %A 
 jl %D
 nop

 leaw $0, %A 
 movw %D (%A)

 leaw $END, %A  ; agora não podemos executar o trecho 
 jmp            ; do else, vamos pular para o fim 
 nop 

 ELSE:
 negw %D 
 leaw $0, %A 
 movw %D, (%A)

 END: