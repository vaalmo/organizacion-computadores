### Integrantes:

- Sebastian Salazar Osorio
- Valentina Morales Villada

# Solución 1: 

Llegamos primero a esta solución minimalista de la ALU, utilizando varios MUX16, ya que se debe escoger entre dos inputs y pasar una salida, con la ayuda de un selector. Siendo así, implementamos MUX y posteriormente MUX16 para seleccionar los inputs que quisiéramos utilizar para realizar diferentes operaciones, teniendo en cuenta que las operaciones con z se hacen al final con el output de las operaciones realizadas entre x e y. Además al final, para manejar el input de la z, utilizamos un Mux4Way16 que nos permitiera mediante el selector de 2 bits, escoger la salida con la operación que deseáramos. 

![image](https://github.com/user-attachments/assets/d94da061-e0f7-4e15-b386-3732ef3b5ca5)

Cabe decir que usamos el chip Negativo.hdl para manejar el negativo de la z de una manera más eficiente.

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


Esta solución cumple con todas las operaciones y requisitos, y además es rápida por el uso de los multiplexadores!



# Solución 2:


Estos son los requisitos del diseño: 

**A. Entradas:**

- [ ] x[16], y[16], z[16] : Tres entradas de 16 bits cada una
- [ ] zx, nx, zy, ny, f, no: Señales de control de 1 bit cada una
- [ ] sel: Señal de selección de 2 bits para operaciones con z

**B. Salidas:**

- [ ] out[16] : Salida de 16 bits

**C. Funcionalidad:**

- [ ] Si zx=1, entonces x=0
- [ ] Si nx=1, entonces x=!x
- [ ] Si zy=1, entonces y=0
- [ ] Si ny=1, entonces y=!y
- [ ] Si f=1, entonces out=x+y
- [ ] Si f=0, entonces out=x&y
- [ ] Si no=1, entonces out=!out
- [ ] Si sel=00, ignorar z
- [ ] Si sel=01, out = out + z
- [ ] Si sel=10, out = out - z


D. Compuertas lógicas permitidas:

   - AND, OR, NOT, XOR, MUX, DMUX (versiones de 16 bits permitidas)
