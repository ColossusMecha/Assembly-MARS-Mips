.data
numbers: .word 5, 8, 3  # Aquí puedes cambiar los números de la lista

.text
.globl main

main:
    # Cargar los números en registros
    lw $t0, numbers   # Cargar el primer número en $t0
    lw $t1, numbers+4 # Cargar el segundo número en $t1
    lw $t2, numbers+8 # Cargar el tercer número en $t2

    # Comparar $t0 con $t1 y actualizar $t0 si es necesario
    bge $t0, $t1, compare_t1_t2
    move $t0, $t1

compare_t1_t2:
    # Comparar $t0 (que contiene el número mayor hasta ahora) con $t2 y actualizar $t0 si es necesario
    bge $t0, $t2, print_result
    move $t0, $t2

print_result:
    # En este punto, $t0 contiene el número mayor
    # Tu código aquí para mostrar el número mayor (por ejemplo, imprimirlo en la consola)

    # Terminar el programa
    li $v0, 10   # Cargar el código de salida del programa en $v0
    syscall      # Hacer una llamada al sistema para salir

