__CONFIG _CP_OFF & _WDT_OFF & _PWRTE_ON & _XT_OSC
PROCESSOR 16F84A
#INCLUDE <P16F84A.INC>
ORG 0X00

bsf		STATUS, RP0
movlw	b'00011111'
movwf	TRISA
clrf	TRISB
bcf		STATUS, RP0

;PROGRAMA PRINCIPAL

inicio
movf	PORTA,W
andlw	b'00001111'
call	tabla 
movwf	PORTB
goto	inicio 

tabla 
addwf	PCL, F 

retlw	b'00111111' ; 0  
retlw	b'00000110' ; 1	
retlw	b'01011011' ; 2	
retlw	b'01001111'	; 3
retlw	b'01100110'	; 4	
retlw	b'01101101'	; 5
retlw	b'01111101'	; 6
retlw	b'00000111' ; 7
retlw	b'01111111' ; 8 
retlw	b'01101111' ; 9
retlw	b'01110111' ; A
retlw	b'01111100' ; B
retlw	b'00111001' ; C
retlw	b'01011110' ; D
retlw	b'01111001' ; E
retlw	b'01110001' ; F
END