.data
n:      .word 10      # Cambia este valor para especificar cuántos términos de Fibonacci deseas generar
fib_msg: .asciiz "Serie de Fibonacci:\n"
result: .space 4      # Variable para almacenar el resultado

.text


main:
    # Cargar n (el número de términos de Fibonacci a generar)
    lw $t0, n
    
    # Imprimir mensaje de inicio
    li $v0, 4
    la $a0, fib_msg
    syscall

    # Manejar el caso especial de n = 1
    li $t1, 1
    beqz $t0, imprimir_resultado
    
    # Inicializar la serie de Fibonacci
    li $t2, 0  # Primer término
    li $t3, 1  # Segundo término

    # Imprimir los primeros dos términos
    sw $t2, result
    li $v0, 1
    move $a0, $t2
    syscall
    sw $t3, result
    li $v0, 1
    move $a0, $t3
    syscall

    # Generar y mostrar los términos restantes de Fibonacci
    addi $t0, $t0, -2  # Restar 2 debido a los dos primeros términos
generar_siguiente:
    add $t4, $t2, $t3  # Calcular el siguiente término
    sw $t4, result     # Almacenar el resultado en la memoria
    li $v0, 1
    move $a0, $t4
    syscall

    # Actualizar los términos anteriores
    move $t2, $t3
    move $t3, $t4

    addi $t0, $t0, -1  # Decrementar el contador de términos
    bnez $t0, generar_siguiente

imprimir_resultado:
    # Terminar el programa
    li $v0, 10
    syscall
