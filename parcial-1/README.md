### Integrantes:

- Sebastian Salazar Osorio
- Valentina Morales Villada

# Solución 1: 

Llegamos primero a esta solución minimalista de la ALU, utilizando varios MUX16, ya que se debe escoger entre dos inputs y pasar una salida, con la ayuda de un selector. Siendo así, implementamos MUX y posteriormente MUX16 para seleccionar los inputs que quisiéramos utilizar para realizar diferentes operaciones, teniendo en cuenta que las operaciones con z se hacen al final con el output de las operaciones realizadas entre x e y.

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





# Solución 2:

usando 4 mux4bit XDDDDDDDD 







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