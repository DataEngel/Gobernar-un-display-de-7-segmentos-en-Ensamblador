__CONFIG _CP_OFF & _WDT_OFF & _PWRTE_ON & _XT_OSC		;DIRECTIVA
PROCESSOR 16F84A	;EL MICROCONTROLADOR A USAR ES EL PIC16F84A
#INCLUDE <P16F84A.INC>	;SE INCLUYE EL ARCHIVO DE DEFINICIONES
ORG 0x00			;EL PROGRAMA INICIA EN LA POSICION 0

;CONFIGURACION DE PUERTOS
bsf STATUS, RP0		;ACCESO AL BANCO 1 DE LA MEMORIA DE DATOS
clrf PORTB			;EL PUERTO B SE CONFIGURA COMO SALIDA
movlw b'00011111'	;LAS 5 LINEAS DEL PUERTO A SE CONFIGURAN COMO ENTRADAA
movwf PORTA			;CONFIGURA EL PUERTO A COMO ENTRADA
bcf STATUS, RP0		;ACCESO AL BANCO 0 DE LA MEMORIA DE DATOS

;PROGRAMA PRINCIPAL

Principal
movf PORTA, W		;LEE ENTRADA
andlw b'00001111'	;MASCARA PARA QUEDARSE CON LOS VALORES DE LAS ENTRADAS DEL PUERTO A
call Tabla			;CONVIERTE DATOS HEXADECIMALES A SEGMENTOS
movwf PORTB
goto Principal		;REGRESA A LA RUTINA PRINCIPAL

Tabla
addwf PCL, F
retlw 3Fh	;CODIGO PARA EL 0	
retlw 06h	;CODIGO PARA EL 1
retlw 5Bh	;CODIGO PARA EL 2
retlw 4Fh	;CODIGO PARA EL 3
retlw 66h	;CODIGO PARA EL 4
retlw 6Dh	;CODIGO PARA EL 5
retlw 7Dh	;CODIGO PARA EL 6
retlw 07h	;CODIGO PARA EL 7
retlw 7Fh	;CODIGO PARA EL 8
retlw 67h	;CODIGO PARA EL 9
retlw 77h	;CODIGO PARA LA A
retlw 7Ch	;CODIGO PARA LA B
retlw 39h	;CODIGO PARA LA C
retlw 5Eh	;CODIGO PARA LA D
retlw 79h	;CODIGO PARA LA E
retlw 71h	;CODIGO PARA LA F
END			;FIN DEL PROGRAMA


