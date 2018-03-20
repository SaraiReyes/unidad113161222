
.model small
.stack 100
.data;4x + 3/2 x^2 - x^3
    msj1 db '4x + 3/2 x^2 - x^3 --> ','$';mensaje de resultado 
    msj2 db 13,10,'integral de cero a dos de --> (4 + 3x - 3x^2)','$';valores
    msj3 db 13,10,'4x --> ','$'
    msj4 db 13,10,'3/2 x^2 --> ','$'
    msj5 db 13,10,'x^3 --> ','$'
    msj6 db 13,10,'Resultado final --> ','$'
    msj7 db ' u^2 ',13,10,'$'
    linea db 13,10,'$';salto de linea y retorno de carro
    var1 db 0
    var2 db 0
    var3 db 0
.code
.startup

call limpia
    mov ah,09h
 ;****************** operaci?n
 ;-----------multiplicacion 4x
mov ah,09h
lea dx,msj1 ;desplegar mult
int 21h
mov ah,09h
lea dx,msj2 ;desplegar mult
int 21h
mov ah,09h
lea dx,msj3 ;desplegar mult
int 21h

mov al,4 
mov bl,2
mul bl ;mult al=al*bl
mov dl,al ;mover al a dl para imprimir
add dl,30h ;sumar 30 para obtener caracter
mov var1,dl
mov ah,02h ;imprimir caracter
int 21h


;--------------------- ((x*x)*3)/2
mov ah,09h
lea dx,msj4 ;desplegar mult
int 21h

mov al,2 ;
mov bl,2 ;
mul bl ;mult al=al*bl
mov dl,al ;mover al a dl para imprimir
mov bl,3 ;
mul bl
mov dl,al ;mover al a dl para imprimir

xor ax,ax ;limpiamos el registro ax. 
mov bl,2 ;2
mov al,dl ;8
div bl ; divide AX/BX el resultado lo almacena en AX, el residuo queda en DX
mov bl,al;
mov dl,bl
add dl,30h
mov var2,dl
mov ah,02h
int 21h

;------------------------------------ x^3
mov ah,09h
lea dx,msj5 ;desplegar mult
int 21h

mov al,2 ;x
mov bl,2 ;x
mul bl ;mult al=al*bl x*x
mov dl,al ;mover al a dl para imprimir
mov bl,2 ;x
mul bl;x^3
mov dl,al ;mover al a dl para imprimir

mov dl,al ;mover al a dl para imprimir
add dl,30h ;sumar 30 para obtener caracter
mov var3,dl
mov ah,02h ;imprimir caracter
int 21h

;-----------------------------------SUMA total
mov ah,09h
lea dx,msj6 ;desplegar mult
int 21h

mov bl,var1
add bl,var2 ; realizo la suma de var2(bl) y var1 y el resultado queda en bl
sub bl,var3 ; realizo la suma de var2(bl) y var1 y el resultado queda en bl
mov ah,09h
mov dl,bl ;pongo en dl el numero a imprimir var2(bl)
;add dl,30h ; agrego 30h para obtener el caracter    
mov ah,02h ;imprime un caracter
int 21h

mov ah,09h
lea dx,msj7 ;desplegar mult
int 21h
.exit

; ****************PROCEDIMIENTOS
limpia proc near
mov ah,00h
mov al,03h
int 10h
ret
limpia endp
end