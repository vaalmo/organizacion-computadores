# Parcial 1

## Objetivo

Diseñar e implementar dos soluciones diferentes para una Unidad Aritmético-Lógica (ALU) avanzada, utilizando las compuertas lógicas básicas aprendidas en el curso Nand2tetris. Cada solución debe implementar operaciones específicas definidas por señales de control e incorporar un tercer registro de entrada.


### Integrantes:

- Sebastian Salazar Osorio
- Valentina Morales Villada
- Juan José Restrepo


## Tabla de Operaciones:
Esta es la tabla de cómo deben estar los inputs para las diferentes operaciones de la ALU.

![image](https://github.com/user-attachments/assets/506a17f2-ccac-4a08-852e-4e4a48adcfd0)


## Solución 1: 

Llegamos primero a esta solución minimalista de la ALU, utilizando varios MUX16, ya que se debe escoger entre dos inputs y pasar una salida, con la ayuda de un selector. Siendo así, implementamos MUX y posteriormente MUX16 para seleccionar los inputs que quisiéramos utilizar para realizar diferentes operaciones, teniendo en cuenta que las operaciones con z se hacen al final con el output de las operaciones realizadas entre x e y. Además al final, para manejar el input de la z, utilizamos un Mux4Way16 que nos permitiera mediante el selector de 2 bits, escoger la salida con la operación que deseáramos. 

![image](https://github.com/user-attachments/assets/d94da061-e0f7-4e15-b386-3732ef3b5ca5)

Este es el diseño que propusimos como primera solución:

![image](https://github.com/user-attachments/assets/802f0af7-baca-40e0-9414-ea092e334ff4)


Estos son los requisitos del diseño: 

**A. Entradas:**

- [x] x[16], y[16], z[16] : Tres entradas de 16 bits cada una
- [x] zx, nx, zy, ny, f, no: Señales de control de 1 bit cada una
- [x] sel: Señal de selección de 2 bits para operaciones con z

**B. Salidas:**

- [x] out[16] : Salida de 16 bits

**C. Funcionalidad:**

- [x] Si zx=1, entonces x=0
- [x] Si nx=1, entonces x=!x
- [x] Si zy=1, entonces y=0
- [x] Si ny=1, entonces y=!y
- [x] Si f=1, entonces out=x+y
- [x] Si f=0, entonces out=x&y
- [x] Si no=1, entonces out=!out
- [x] Si sel=00, ignorar z
- [x] Si sel=01, out = out + z
- [x] Si sel=10, out = out - z


D. Compuertas lógicas permitidas:

- AND, OR, NOT, XOR, MUX, DMUX (versiones de 16 bits permitidas)


Esta solución cumple con todas las operaciones y requisitos!


### Aspectos Positivos:

- Estructura organizada: El flujo de la ALU empieza con las operaciones sobre x y y primero, y luego se agregan las operaciones con z.
- Uso de Mux4Way16: La selección entre las diferentes operaciones con z (ignorar z, sumar, restar) es eficiente con base en los 2 bits de selección.
- Negativo: El uso del Negativo es una buena forma de manejar el z para la resta, ya que se procesa internamente hasta el complemento a 2.

### Posibles mejoras:

- Duplicación de componentes: Tanto para la suma como para la resta con z, se hacen dos sumas consecutivas (una para la suma y otra para la resta), lo que implica el uso de dos chips Add16. Esto puede afectar la eficiencia, ya que las sumas requieren tiempo de propagación.
- Eficiencia del Mux4Way16: Aunque el Mux4Way16 es eficiente, el proceso de selección de 4 caminos puede tener un pequeño retardo, ya que la señal pasa a través de varias compuertas.




## Solución 2:

Luego propusimos una segunda solución, con la misma estructura base del anterior, pero en busca de la optimización del manejo de z, utilizando un DMux4Way16 para gestionar las cuatro opciones del selector de z. Esto nos permite solamente ejecutar la acción de z que deseamos, y no ejecutarlas todas cada vez que se realiza una acción, pero al costo de tener una compuerta más (Mux4Way16).

![image](https://github.com/user-attachments/assets/72d16280-0c3a-46eb-8f77-848e31e3db41)


Estos son los requisitos del diseño: 

**A. Entradas:**

- [x] x[16], y[16], z[16] : Tres entradas de 16 bits cada una
- [x] zx, nx, zy, ny, f, no: Señales de control de 1 bit cada una
- [x] sel: Señal de selección de 2 bits para operaciones con z

**B. Salidas:**

- [x] out[16] : Salida de 16 bits

**C. Funcionalidad:**

- [x] Si zx=1, entonces x=0
- [x] Si nx=1, entonces x=!x
- [x] Si zy=1, entonces y=0
- [x] Si ny=1, entonces y=!y
- [x] Si f=1, entonces out=x+y
- [x] Si f=0, entonces out=x&y
- [x] Si no=1, entonces out=!out
- [x] Si sel=00, ignorar z
- [x] Si sel=01, out = out + z
- [x] Si sel=10, out = out - z


D. Compuertas lógicas permitidas:

- AND, OR, NOT, XOR, MUX, DMUX (versiones de 16 bits permitidas)

Esta solución cumple con todas las operaciones y requisitos!


### Aspectos Positivos:

- Estructura organizada: El flujo de la ALU empieza con las operaciones sobre x y y primero, y luego se agregan las operaciones con z.
- Uso de DMux4Way16 Mux4Way16: El DMux4Way16 permite seleccionar únicamente la operación de z que queremos hacer, sin necesidad de ejecutarlas todas. A pesar de que se usan dos compuertas para este proceso, estas requieren únicamente de un mismo selector.
- Negativo: El uso del Negativo es una buena forma de manejar el z para la resta, ya que se procesa internamente hasta el complemento a 2.

### Posibles mejoras:

- Duplicación de componentes: Tanto para la suma como para la resta con z, se hacen dos sumas consecutivas (una para la suma y otra para la resta), lo que implica el uso de dos chips Add16. Esto puede afectar la eficiencia, ya que las sumas requieren tiempo de propagación.
/n 
/n
- Uso del Mux4Way16: Se hace uso del Mux4Way16 para poder mostrar la opción escogida en el DMux4Way16, pero esta selección podría buscarse hacerse de una forma mucho más simplificada, sin necesidad de cargar todos los componentes que la Mux4Way16 implica.

