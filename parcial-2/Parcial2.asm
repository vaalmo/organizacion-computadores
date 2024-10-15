// Inicialización

@SCREEN
D=A
@addr
M=D    // addr = 16384 (dirección base de la pantalla)

// Dibujar el cuadrado inicial
@0     // Contador para las 16 filas del cuadrado
D=A
@contador
M=D

@1
D=A
@contador_movimientos
M=D


// Bucle principal
(LOOP)
    // Leer el teclado
    @KBD
    D=M
    @tecla
    M=D    // Guardar el valor de la tecla

    // Verificar el valor del contador (si es mayor a 16)
    @contador_movimientos
    D=M
    @16
    D=D-A   // Resta 16 al valor del contador
    @MAYOR_QUE_16   // Si es mayor a 16, saltar
    D;JGT

    // Comprobar si la tecla es "V"
    @tecla
    D=M
    @86  // Código ASCII de la "V"
    D=D-A
    @DIBUJAR_V_SUPERIOR
    D;JEQ   // Si es "V", dibujar la letra V

    // Comprobar si la tecla es "S"
    @tecla
    D=M
    @83  // Código ASCII de la "S"
    D=D-A
    @DIBUJAR_S_SUPERIOR
    D;JEQ

    @LOOP
    0;JMP   // Volver al inicio del bucle si no es la tecla V


(MAYOR_QUE_16)
    // Comprobar si la tecla es "V"
    @tecla
    D=M
    @86  // Código ASCII de la "V"
    D=D-A
    @INVERTIR_V_SUPERIOR
    D;JEQ   // Si es "V", dibujar la letra V inferior

    // Comprobar si la tecla es "S"
    @tecla
    D=M
    @83  // Código ASCII de la "S"
    D=D-A
    @INVERTIR_S_SUPERIOR
    D;JEQ   // Si es "S", dibujar la letra S inferior

    @LOOP
    0;JMP   // Volver al inicio del bucle


(DIBUJAR_V_SUPERIOR)

	@addr
	AD=D+M
	// row 1
	@12291 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 2
	D=A // D holds previous addr
	@32
	AD=D+A
	@12291 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 3
	D=A // D holds previous addr
	@32
	AD=D+A
	@12291 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 4
	D=A // D holds previous addr
	@32
	AD=D+A
	@14343 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 5
	D=A // D holds previous addr
	@32
	AD=D+A
	@15375 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 6
	D=A // D holds previous addr
	@32
	AD=D+A
	@15375 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 7
	D=A // D holds previous addr
	@32
	AD=D+A
	@7182 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 8
	D=A // D holds previous addr
	@32
	AD=D+A
	@7182 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 9
	D=A // D holds previous addr
	@32
	AD=D+A
	@7710 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 10
	D=A // D holds previous addr
	@32
	AD=D+A
	@3612 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 11
	D=A // D holds previous addr
	@32
	AD=D+A
	@3900 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 12
	D=A // D holds previous addr
	@32
	AD=D+A
	@3900 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 13
	D=A // D holds previous addr
	@32
	AD=D+A
	@1848 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 14
	D=A // D holds previous addr
	@32
	AD=D+A
	@2040 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 15
	D=A // D holds previous addr
	@32
	AD=D+A
	@1008 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 16
	D=A // D holds previous addr
	@32
	AD=D+A
	@480 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val

    // Llama a la función MOVER para mover hacia abajo el espacio en memoria
    @512
    D=A
    @MOVER_ABAJO_V
    0;JMP  // Saltar a MOVER para ajustar la posición

	// return
	@R13
	A=M
	D;JMP

    @LOOP
    0;JMP


(MOVER_ABAJO_V)
    // D contiene el desplazamiento a aplicar
    @desplazamiento
    M=D    // Guardar el desplazamiento

    // Borrar el cuadrado actual
    @16
    D=A
    @contador
    M=D

    (MOVER_FILAS_ABAJO_V)
        
        // Mover a la siguiente línea
        @32
        D=A
        @addr
        M=M+D

        // Decrementar el contador y continuar si no es cero
        @contador
        M=M-1
        D=M
        @MOVER_FILAS_ABAJO_V
        D;JGT

    // Restablecer addr y aplicar el movimiento
    @512
    D=A
    @addr
    M=M-D
    @desplazamiento
    D=M    // Recuperar el desplazamiento
    @addr
    M=M+D  // Aplicar el desplazamiento

    // Esperar a que se suelte la tecla
    (ESPERAR_SOLTAR_ABAJO_V)
        @KBD
        D=M
        @ESPERAR_SOLTAR_ABAJO_V
        D;JNE


	@R13          // Guarda el valor original de D en un registro temporal
	M=D           // R13 = D (posición actual)

	// Verificar el valor del contador (si es mayor a 16)
    @contador_movimientos
    D=M
    @16
    D=D-A   // Resta 16 al valor del contador

    @INVERTIR_V_INFERIOR  // Si es mayor a 16, saltar
    D;JGT

	@R13          // Restaura el valor original de D desde R13
	D=M           // D = posición original (restaurado desde R13)

    @DIBUJAR_V_INFERIOR
    0;JMP  // Saltar a MOVER para ajustar la posición

(DIBUJAR_V_INFERIOR)
    
    @addr
	AD=D+M

	// row 2
	@12288 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 3
	D=A // D holds previous addr
	@32
	AD=D+A
	@12344 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 4
	D=A // D holds previous addr
	@32
	AD=D+A
	@12396 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 5
	D=A // D holds previous addr
	@32
	AD=D+A
	@12390 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 6
	D=A // D holds previous addr
	@32
	AD=D+A
	@12387 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 7
	D=A // D holds previous addr
	@32
	AD=D+A
	@12385 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 8
	D=A // D holds previous addr
	@32
	AD=D+A
	@12385 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 9
	D=A // D holds previous addr
	@32
	AD=D+A
	@12387 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 10
	D=A // D holds previous addr
	@32
	AD=D+A
	@14446 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 11
	D=A // D holds previous addr
	@32
	AD=D+A
	@6240 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 12
	D=A // D holds previous addr
	@32
	AD=D+A
	@7264 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 13
	D=A // D holds previous addr
	@32
	AD=D+A
	@3680 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 14
	D=A // D holds previous addr
	@32
	AD=D+A
	@2016 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 15
	D=A // D holds previous addr
	@32
	AD=D+A
	@960 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val

    // Llamar a la función para mover a la derecha
    @1
    D=A
    @MOVER_DERECHA
    0;JMP  // Saltar a MOVER para ajustar la posición

	// return
	@R13
	A=M
	D;JMP


(DIBUJAR_S_SUPERIOR)

	@addr
	AD=D+M
	// row 1
	@8190 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 2
	D=A // D holds previous addr
	@32
	AD=D+A
	@16383 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 3
	D=A // D holds previous addr
	@32
	AD=D+A
	@12295 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 4
	D=A // D holds previous addr
	@32
	AD=D+A
	@7 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 5
	D=A // D holds previous addr
	@32
	AD=D+A
	@7 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 6
	D=A // D holds previous addr
	@32
	AD=D+A
	@7 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 7
	D=A // D holds previous addr
	@32
	AD=D+A
	@15 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 8
	D=A // D holds previous addr
	@32
	AD=D+A
	@4094 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 9
	D=A // D holds previous addr
	@32
	AD=D+A
	@8184 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 10
	D=A // D holds previous addr
	@32
	AD=D+A
	@15360 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 11
	D=A // D holds previous addr
	@32
	AD=D+A
	@14336 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 12
	D=A // D holds previous addr
	@32
	AD=D+A
	@14336 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 13
	D=A // D holds previous addr
	@32
	AD=D+A
	@14336 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 14
	D=A // D holds previous addr
	@32
	AD=D+A
	@14339 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 15
	D=A // D holds previous addr
	@32
	AD=D+A
	@16383 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 16
	D=A // D holds previous addr
	@32
	AD=D+A
	@8190 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	
    // Llama a la función MOVER para mover hacia abajo el espacio en memoria
    @512
    D=A
    @MOVER_ABAJO_S
    0;JMP  // Saltar a MOVER para ajustar la posición

	// return
	@R13
	A=M
	D;JMP


(MOVER_ABAJO_S)
    // D contiene el desplazamiento a aplicar
    @desplazamiento
    M=D    // Guardar el desplazamiento

    // Borrar el cuadrado actual
    @16
    D=A
    @contador
    M=D

    (MOVER_FILAS_ABAJO_S)
        
        // Mover a la siguiente línea
        @32
        D=A
        @addr
        M=M+D

        // Decrementar el contador y continuar si no es cero
        @contador
        M=M-1
        D=M
        @MOVER_FILAS_ABAJO_S
        D;JGT

    // Restablecer addr y aplicar el movimiento
    @512
    D=A
    @addr
    M=M-D
    @desplazamiento
    D=M    // Recuperar el desplazamiento
    @addr
    M=M+D  // Aplicar el desplazamiento

    // Esperar a que se suelte la tecla
    (ESPERAR_SOLTAR_ABAJO_S)
        @KBD
        D=M
        @ESPERAR_SOLTAR_ABAJO_S
        D;JNE

	@R13          // Guarda el valor original de D en un registro temporal
	M=D           // R13 = D (posición actual)

	// Verificar el valor del contador (si es mayor a 16)
    @contador_movimientos
    D=M
    @16
    D=D-A   // Resta 16 al valor del contador

    @INVERTIR_S_INFERIOR  // Si es mayor a 16, saltar
    D;JGT

	@R13          // Restaura el valor original de D desde R13
	D=M           // D = posición original (restaurado desde R13)

    @DIBUJAR_S_INFERIOR
    0;JMP  // Saltar a MOVER para ajustar la posición


(DIBUJAR_S_INFERIOR)
    
    @addr
	AD=D+M
	// row 1
	@1016 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 2
	D=A // D holds previous addr
	@32
	AD=D+A
	@2044 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 3
	D=A // D holds previous addr
	@32
	AD=D+A
	@3086 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 4
	D=A // D holds previous addr
	@32
	AD=D+A
	@3462 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 5
	D=A // D holds previous addr
	@32
	AD=D+A
	@3142 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 6
	D=A // D holds previous addr
	@32
	AD=D+A
	@3974 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 7
	D=A // D holds previous addr
	@32
	AD=D+A
	@1798 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 8
	D=A // D holds previous addr
	@32
	AD=D+A
	@14 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 9
	D=A // D holds previous addr
	@32
	AD=D+A
	@1020 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 10
	D=A // D holds previous addr
	@32
	AD=D+A
	@2040 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 11
	D=A // D holds previous addr
	@32
	AD=D+A
	@1792 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 12
	D=A // D holds previous addr
	@32
	AD=D+A
	@1550 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 13
	D=A // D holds previous addr
	@32
	AD=D+A
	@1555 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 14
	D=A // D holds previous addr
	@32
	AD=D+A
	@1799 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 15
	D=A // D holds previous addr
	@32
	AD=D+A
	@2046 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 16
	D=A // D holds previous addr
	@32
	AD=D+A
	@1020 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val

    // Llamar a la función para mover a la derecha
    @1
    D=A
    @MOVER_DERECHA
    0;JMP  // Saltar a MOVER para ajustar la posición

	// return
	@R13
	A=M
	D;JMP


(MOVER_DERECHA)
    // D contiene el desplazamiento a aplicar
    @desplazamiento
    M=D    // Guardar el desplazamiento

    // Borrar el cuadrado actual
    @16
    D=A
    @contador
    M=D

    (MOVER_FILAS_DERECHA)
        
        // Mover a la siguiente línea
        @32
        D=A
        @addr
        M=M+D

        // Decrementar el contador y continuar si no es cero
        @contador
        M=M-1
        D=M
        @MOVER_FILAS_DERECHA
        D;JGT

    // Restablecer addr y aplicar el movimiento
    @512
    D=A
    @addr
    M=M-D
    @desplazamiento
    D=M    // Recuperar el desplazamiento
    @addr
    M=M+D  // Aplicar el desplazamiento

    // Incrementar el contador de movimientos
    @contador_movimientos
    M=M+1  // Incrementar el contador

    // Esperar a que se suelte la tecla
    (ESPERAR_SOLTAR_DERECHA)
        @KBD
        D=M
        @ESPERAR_SOLTAR_DERECHA
        D;JNE

    @512
    D=-A
    @MOVER_ARRIBA
    0;JMP  // Saltar a MOVER para ajustar la posición


(MOVER_ARRIBA) 
    // D contiene el desplazamiento a aplicar
    @desplazamiento
    M=D    // Guardar el desplazamiento

    // Borrar el cuadrado actual
    @16
    D=A
    @contador
    M=D

    (MOVER_FILAS_ARRIBA)
        
        // Mover a la siguiente línea
        @32
        D=A
        @addr
        M=M+D

        // Decrementar el contador y continuar si no es cero
        @contador
        M=M-1
        D=M
        @MOVER_FILAS_ARRIBA
        D;JGT

    // Restablecer addr y aplicar el movimiento
    @512
    D=A
    @addr
    M=M-D
    @desplazamiento
    D=M    // Recuperar el desplazamiento
    @addr
    M=M+D  // Aplicar el desplazamiento

    // Esperar a que se suelte la tecla
    (ESPERAR_SOLTAR_ARRIBA)
        @KBD
        D=M
        @ESPERAR_SOLTAR_ARRIBA
        D;JNE

    @LOOP
    0;JMP  // Saltar a MOVER para ajustar la posición

(INVERTIR_V_SUPERIOR)

	@addr
	AD=D+M

	// row 1
	@16380 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 2
	D=A // D holds previous addr
	@32
	AD=D+A
	@16380 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 3
	D=A // D holds previous addr
	@32
	AD=D+A
	@8184 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 4
	D=A // D holds previous addr
	@32
	AD=D+A
	@24583 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 5
	D=A // D holds previous addr
	@32
	AD=D+A
	@28687 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 6
	D=A // D holds previous addr
	@32
	AD=D+A
	@28687 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 7
	D=A // D holds previous addr
	@32
	AD=D+A
	@14365 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 8
	D=A // D holds previous addr
	@32
	AD=D+A
	@14365 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 9
	D=A // D holds previous addr
	@32
	AD=D+A
	@7225 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 10
	D=A // D holds previous addr
	@32
	AD=D+A
	@3129 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 11
	D=A // D holds previous addr
	@32
	AD=D+A
	@3697 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 12
	D=A // D holds previous addr
	@32
	AD=D+A
	@1633 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 13
	D=A // D holds previous addr
	@32
	AD=D+A
	@2017 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 14
	D=A // D holds previous addr
	@32
	AD=D+A
	@961 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 15
	D=A // D holds previous addr
	@32
	AD=D+A
	@961 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 16
	D=A // D holds previous addr
	@32
	AD=D+A
	@385 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val

    // Llama a la función MOVER para mover hacia abajo el espacio en memoria
    @512
    D=A
    @MOVER_ABAJO_V
    0;JMP  // Saltar a MOVER para ajustar la posición

	// return
	@R13
	A=M
	D;JMP


(INVERTIR_V_INFERIOR)

	@R13          // Restaura el valor original de D desde R13
	D=M           // D = posición original (restaurado desde R13)

	@addr
	AD=D+M

	// row 1
	M=-1
	// row 2
	D=A // D holds previous addr
	@32
	AD=D+A
	@24577 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 3
	D=A // D holds previous addr
	@32
	AD=D+A
	@24689 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 4
	D=A // D holds previous addr
	@32
	AD=D+A
	@24793 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 5
	D=A // D holds previous addr
	@32
	AD=D+A
	@24781 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 6
	D=A // D holds previous addr
	@32
	AD=D+A
	@24775 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 7
	D=A // D holds previous addr
	@32
	AD=D+A
	@24771 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 8
	D=A // D holds previous addr
	@32
	AD=D+A
	@24771 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 9
	D=A // D holds previous addr
	@32
	AD=D+A
	@24775 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 10
	D=A // D holds previous addr
	@32
	AD=D+A
	@28893 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 11
	D=A // D holds previous addr
	@32
	AD=D+A
	@12481 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 12
	D=A // D holds previous addr
	@32
	AD=D+A
	@14529 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 13
	D=A // D holds previous addr
	@32
	AD=D+A
	@7361 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 14
	D=A // D holds previous addr
	@32
	AD=D+A
	@4033 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 15
	D=A // D holds previous addr
	@32
	AD=D+A
	@1921 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 16
	D=A // D holds previous addr
	@32
	AD=D+A
	M=-1

    // Llamar a la función para mover a la derecha
    @1
    D=A
    @MOVER_DERECHA
    0;JMP  // Saltar a MOVER para ajustar la posición

	// return
	@R13
	A=M
	D;JMP


(INVERTIR_S_SUPERIOR)

	@addr
	AD=D+M

	// row 1
	M=-1
	// row 2
	D=A // D holds previous addr
	@32
	AD=D+A
	@32765 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 3
	D=A // D holds previous addr
	@32
	AD=D+A
	@16383 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 4
	D=A // D holds previous addr
	@32
	AD=D+A
	@7 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 5
	D=A // D holds previous addr
	@32
	AD=D+A
	@7 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 6
	D=A // D holds previous addr
	@32
	AD=D+A
	@7 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 7
	D=A // D holds previous addr
	@32
	AD=D+A
	@7 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 8
	D=A // D holds previous addr
	@32
	AD=D+A
	@16383 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 9
	D=A // D holds previous addr
	@32
	AD=D+A
	@32765 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 10
	D=A // D holds previous addr
	@32
	AD=D+A
	@24577 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 11
	D=A // D holds previous addr
	@32
	AD=D+A
	@24577 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 12
	D=A // D holds previous addr
	@32
	AD=D+A
	@24577 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 13
	D=A // D holds previous addr
	@32
	AD=D+A
	@24577 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 14
	D=A // D holds previous addr
	@32
	AD=D+A
	@32767 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 15
	D=A // D holds previous addr
	@32
	AD=D+A
	@16383 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 16
	D=A // D holds previous addr
	@32
	AD=D+A
	M=-1

    // Llama a la función MOVER para mover hacia abajo el espacio en memoria
    @512
    D=A
    @MOVER_ABAJO_S
    0;JMP  // Saltar a MOVER para ajustar la posición
	// return
	@R13
	A=M
	D;JMP



(INVERTIR_S_INFERIOR)
		
	@R13          // Restaura el valor original de D desde R13
	D=M           // D = posición original (restaurado desde R13)

	@addr
	AD=D+M

	// row 1
	M=-1
	// row 2
	D=A // D holds previous addr
	@32
	AD=D+A
	@8177 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 3
	D=A // D holds previous addr
	@32
	AD=D+A
	@16377 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 4
	D=A // D holds previous addr
	@32
	AD=D+A
	@12317 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 5
	D=A // D holds previous addr
	@32
	AD=D+A
	@8205 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 6
	D=A // D holds previous addr
	@32
	AD=D+A
	@12301 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 7
	D=A // D holds previous addr
	@32
	AD=D+A
	@1021 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 8
	D=A // D holds previous addr
	@32
	AD=D+A
	@4081 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 9
	D=A // D holds previous addr
	@32
	AD=D+A
	@7681 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 10
	D=A // D holds previous addr
	@32
	AD=D+A
	@15361 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 11
	D=A // D holds previous addr
	@32
	AD=D+A
	@14585 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 12
	D=A // D holds previous addr
	@32
	AD=D+A
	@12445 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 13
	D=A // D holds previous addr
	@32
	AD=D+A
	@12301 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 14
	D=A // D holds previous addr
	@32
	AD=D+A
	@16381 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 15
	D=A // D holds previous addr
	@32
	AD=D+A
	@8185 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 16
	D=A // D holds previous addr
	@32
	AD=D+A
	M=-1

    // Llamar a la función para mover a la derecha
    @1
    D=A
    @MOVER_DERECHA
    0;JMP  // Saltar a MOVER para ajustar la posición

	// return
	@R13
	A=M
	D;JMP
