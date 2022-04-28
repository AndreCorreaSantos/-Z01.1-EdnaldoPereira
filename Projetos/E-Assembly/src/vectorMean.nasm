; ------------------------------------
; Calcule a média dos valores de um vetor
; que possui inicio em RAM[5] e tamanho
; defindo em RAM[4],
;
; 1. Salve a soma em RAM[1]
; 2. Salve a média em RAM[0]
; 
; ------------------------------------
; antes       | depois
;             |
; RAM[0]:     | RAM[0]:  2  : média 
; RAM[1]:     | RAM[1]:  8  : soma
; RAM[2]:     | RAM[2]:  
; RAM[3]:     | RAM[3]:  
; RAM[4]:  4  | RAM[4]:  4 
; RAM[5]:  1  | RAM[5]:  1 - 
; RAM[6]:  2  | RAM[6]:  2 | vetor
; RAM[7]:  1  | RAM[7]:  1 |
; RAM[8]:  4  | RAM[8]:  4 -
; ------------------------------------

;R0 inicialmente guarda um valor igual o de R4, da length
;R1 guarda o valor do indice do qual o valor deve ser extraido
;R2 guarda o valor da soma

leaw $4, %A 
movw (%A), %D 
leaw $0, %A 
movw %D, (%A)
movw $0, %D  
incw %D
incw %D
incw %D
incw %D
leaw $1, %A  
movw %D, (%A)

LOOP:
    leaw $1, (%A)
    movw (%A), %D 
    incw %D                         ;PEGA O INDICE DO QUAL TEM QUE PEGAR O VALOR
    movw %D, (%A)                   
    movw %D, %A                 
    movw (%A), %D                   ;PEGA O VALOR DE TAL INDICE
    leaw $2, %A 
    addw %D, (%A), %D 
    movw %D, (%A)                   ;SOMA COM R2 E SALVA NO PROPRIO R2
    leaw $0, %A 
    movw (%A), %D 
    decw %D 
    movw %D, (%A)
    leaw $LOOP, %A 
    jg %D 
    nop

leaw $2, %A
movw (%A), %D
leaw $1, %A
movw %D, (%A)                       ;COLOQUEI O VALOR DA SOMA, QUE ESTAVA INICIALMENTE EM R2, EM R1

leaw $4, %A 
movw (%A), %D
decw %D 
leaw $ONECASE, %A 
je %D
nop


ELSE:
    leaw $2, %A
    movw (%A), %D
    leaw $4, %A 
    subw %D, (%A), %D 
    leaw $2, %A
    movw %D, (%A)
    leaw $4, %A 
    subw %D, (%A), %D 
    leaw $ELSE, %A 
    jge %D 
    nop 

leaw $2, %A 
movw (%A), %D 
leaw $0, %A 
movw %D, (%A)

leaw $END, %A 
jmp
nop

ONECASE:
    leaw $1, %A
    movw (%A), %D
    leaw $0, %A 
    movw %D, (%A)

END: