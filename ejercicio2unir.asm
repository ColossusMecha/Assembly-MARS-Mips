.data
numbers: .word 5, 8, 3  # Aquí puedes cambiar los números de la lista

.text


main:
    # Cargar los números en registros
    lw $t0, numbers   # Cargar el primer número en $t0
    lw $t1, numbers+4 # Cargar el segundo número en $t1
    lw $t2, numbers+8 # Cargar el tercer número en $t2

    # Inicializar $t3 con el primer número
    move $t3, $t0

    # Comparar $t3 con $t1 y actualizar $t3 si es necesario
    blt $t1, $t3, compare_t1_t2
    move $t3, $t1

compare_t1_t2:
    # Comparar $t3 (que contiene el número menor hasta ahora) con $t2 y actualizar $t3 si es necesario
    blt $t2, $t3, print_result
    move $t3, $t2

print_result:
    # En este punto, $t3 contiene el número menor
    # Tu código aquí para mostrar el número menor (por ejemplo, imprimirlo en la consola)

    # Terminar el programa
    li $v0, 10   # Cargar el código de salida del programa en $v0
    syscall      # Hacer una llamada al sistema para salir

