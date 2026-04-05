
# :cyclone: 1. Bash

- [:cyclone: 1. Bash](#cyclone-1-bash)
    - [Pasos para crear un script](#pasos-para-crear-un-script)
      - [**Buenas prácticas y recomendaciones para Bash**](#buenas-prácticas-y-recomendaciones-para-bash)
    - [Aplicaciones](#aplicaciones)
- [:cyclone: 2. Variables](#cyclone-2-variables)
    - [Reglas básicas](#reglas-básicas)
    - [Comillas](#comillas)
    - [Tipos de datos (ejemplos en Python)](#tipos-de-datos-ejemplos-en-python)
- [:cyclone:  3. Operaciones Básicas](#cyclone--3-operaciones-básicas)
- [:cyclone:  4. Estructuras de Control](#cyclone--4-estructuras-de-control)
    - [🔹  Secuencial](#--secuencial)
    - [🔹 Condicional (if-else)](#-condicional-if-else)
    - [🔹  Condicional (if-elif-else)](#--condicional-if-elif-else)
    - [🔹 Estructura case](#-estructura-case)
    - [🔹  Bucle for](#--bucle-for)
    - [🔹  Bucle while](#--bucle-while)
- [:cyclone:  5. Comparaciones en Bash](#cyclone--5-comparaciones-en-bash)
    - [🔹 `[ ... ]` → Prueba clásica (test)](#-----prueba-clásica-test)
    - [🔹 `[[ ... ]]` → Prueba extendida de Bash](#-----prueba-extendida-de-bash)
    - [🔹 `(( ... ))` → Expresiones aritméticas](#-----expresiones-aritméticas)
    - [🔹 `[[]]` vs `(( ))` vs `[ ]` — Cuadro resumen](#--vs---vs----cuadro-resumen)
- [:cyclone:  6. Lectura de ficheros en Bash](#cyclone--6-lectura-de-ficheros-en-bash)
    - [🔹 Método 1: `while read` (recomendado)](#-método-1-while-read-recomendado)
    - [🔹 Método 2: `for` con sustitución de comandos](#-método-2-for-con-sustitución-de-comandos)
    - [🔹 ¿Y `foreach`?](#-y-foreach)
    - [✍️ **Consejo final:**](#️-consejo-final)
- [:cyclone:  7. Condicionales con comandos](#cyclone--7-condicionales-con-comandos)
    - [🔹 Uso de `grep` dentro de un condicional](#-uso-de-grep-dentro-de-un-condicional)
    - [🔹 Uso de `find` dentro de un condicional](#-uso-de-find-dentro-de-un-condicional)
- [:cyclone:  8. Funciones](#cyclone--8-funciones)
    - [Definición](#definición)
    - [Parámetros especiales](#parámetros-especiales)
    - [Ejemplo](#ejemplo)
- [:cyclone:  9. Depuración y Pruebas](#cyclone--9-depuración-y-pruebas)
  - [Bibliografía](#bibliografía)

&nbsp;


El **scripting** consiste en la creación y ejecución de secuencias de comandos que automatizan tareas, estos  suelen estar escritos en lenguajes de alto nivel como Python, Ruby, Perl, JavaScript o Shell, y permiten agilizar procesos repetitivos. Son fáciles de aprender y usar, se escriben dinámicamente sin necesidad de un archivo de punto de entrada y se pueden ejecutar directamente en una terminal. 

En GNU/Linux, los scripts suelen tener extensiones como .bash o .sh (no obligatorias), y es importante incluir la primera línea (shebang) #!/bin/bash para que funcionen correctamente. 
  ```bash
  #!/bin/bash
  #!/bin/ksh
  #!/bin/csh
  ```
### Pasos para crear un script
1. Abrir editor de texto.  
2. Escribir el código (incluir `#!/bin/bash`).  
3. Guardar el archivo.  
4. Dar permisos de ejecución (`chmod +x script.sh`).  
5. Ejecutarlo.  

#### **Buenas prácticas y recomendaciones para Bash**

- Usar comentarios claros con `#`.  
- Definir variables al inicio del script y hacerlas adaptables (rutas relativas, variables de entorno).  
- Respetar identado y espacios; Bash no obliga a tabulaciones pero sí hay que cuidar los espacios.  
- Cerrar siempre bucles y condiciones.  
- Plantear la lógica en pseudocódigo antes de implementarla.  
- Seguir un criterio nemotécnico para nombres de variables y funciones.  
- Añadir README si el proyecto o script es complejo.  
- Soporta operadores matemáticos, comparadores y lógicos; usar la forma correcta según sea `[ ]`, `[[ ]]` o `(( ))`.  
- Para funciones, mostrar claramente los parámetros con `$1`, `$2`, etc., y documentar su uso.  
- Mantener el código limpio, legible y modular para facilitar su mantenimiento y comprensión.

### Aplicaciones
- Automatización de tareas repetitivas.  
- Administración de sistemas y redes.  
- Encadenar aplicaciones mediante pipes.  
- Mejorar la experiencia de usuario.  

# :cyclone: 2. Variables

Las **variables** almacenan datos que pueden usarse y modificarse dentro de un script.

### Reglas básicas
- Se declaran con `nombre=valor` (sin espacios).  
- Para usarlas: `$nombre`  
- Para mostrarlas: `echo $nombre`  

### Comillas
- **Dobles ("")**: interpretan variables.  
- **Simples ('')**: no interpretan variables.  
- **Acento grave (`)**: ejecuta un comando y guarda su salida.  

### Tipos de datos (ejemplos en Python)
- Entero → `42, -10`  
- Flotante → `3.14, -0.5`  
- String → `"Hola"`  
- Booleano → `True/False`  
- Lista → `[1,2,3]`  
- Diccionario → `{"nombre":"Juan"}`  
- Null → `None/null`  

> En Bash no es necesario declarar tipo.  

# :cyclone:  3. Operaciones Básicas

| **Operadores aritméticos** | **Operadores lógicos** | **Operadores sobre ficheros** | **Prioridad de operadores** |
|-----------------------------|------------------------|-------------------------------|------------------------------|
| `+` Suma                   | `-lt` menor que        | `-e` existe                   | `()`                         |
| `-` Resta                  | `-gt` mayor que        | `-f` existe y no es directorio| `++ --`                      |
| `*` Multiplicación         | `-le` menor o igual que| `-s` no vacío                 | `* / %`                      |
| `/` División               | `-ge` mayor o igual que| `-d` es directorio            | `+ -`                        |
| `%` Módulo                 | `-eq` igual            | `-r` lectura                  | `< <= > >=`                  |
| `**` Potencia              | `-ne` distinto         | `-w` escritura                | `== !=`                      |
| `=, +=, -=, *=, /=, %=` Asignación | `-n` no nulo   | `-x` ejecución                | `&&`                         |
| `++` Incremento            | `-z` nulo              |                               | `||`                         |
| `--` Decremento            |                        |                               | `=`                          |

# :cyclone:  4. Estructuras de Control

### 🔹  Secuencial
En la estructura secuencial, las instrucciones se ejecutan una tras otra, en el orden en que aparecen en el script.
```bash
#!/bin/bash
echo "Inicio del programa"
nombre="Yeray"
echo "Hola, $nombre"
echo "Fin del programa"
```

### 🔹 Condicional (if-else)
Permite ejecutar diferentes bloques de código según se cumpla o no una condición.
```bash
#!/bin/bash
numero=5
if [ "$numero" -gt 3 ]; then
  echo "El número es mayor que 3"
else
  echo "El número es menor o igual que 3"
fi
```

### 🔹  Condicional (if-elif-else)
Evalúa varias condiciones en orden hasta que una de ellas se cumple.
```bash
#!/bin/bash
hora=12
if [ "$hora" -lt 12 ]; then
  echo "Buenos días"
elif [ "$hora" -lt 20 ]; then
  echo "Buenas tardes"
else
  echo "Buenas noches"
fi
```

### 🔹 Estructura case
Simplifica la comparación de una variable con varios valores posibles.
```bash
#!/bin/bash
opcion=2
case "$opcion" in
  1)
    echo "Has elegido la opción 1"
    ;;
  2)
    echo "Has elegido la opción 2"
    ;;
  3)
    echo "Has elegido la opción 3"
    ;;
  *)
    echo "Opción no válida"
    ;;
esac
```

### 🔹  Bucle for

Permite ejecutar un bloque de código un número determinado de veces.
```bash
#!/bin/bash
for i in {1..5}; do
  echo "Iteración $i"
done
```

### 🔹  Bucle while
Ejecuta un bloque de código mientras se cumpla una condición.
```bash
#!/bin/bash
contador=1
while [ "$contador" -le 5 ]; do
  echo "Contador: $contador"
  ((contador++))
done
```


# :cyclone:  5. Comparaciones en Bash

En Bash, las **comparaciones** se pueden hacer de varias formas según el **tipo de dato** (numérico o de texto) y el **contexto** (condición simple, compuesta, dentro de `[[ ]]`, `(( ))`, etc.).  A continuación se explican las diferencias:

### 🔹 `[ ... ]` → Prueba clásica (test)
- Es la forma tradicional POSIX.
- Necesita **espacios obligatorios** tras `[` y antes de `]`.
- Admite comparaciones de **números** y **cadenas**.

```bash
if [ "$a" -lt "$b" ]; then
  echo "a es menor que b"
fi
```
**Operadores numéricos válidos:**
`-lt`, `-le`, `-gt`, `-ge`, `-eq`, `-ne`

**Operadores de cadena válidos:**
`=`, `!=`, `-z` (cadena vacía), `-n` (cadena no vacía)

    ⚠️ Ojo: los operadores `<` y `>` **no** se usan aquí para números; serían redirecciones.

### 🔹 `[[ ... ]]` → Prueba extendida de Bash
- Es **más moderna y segura**.
- Permite **comparaciones de cadenas con comodines (`==`, `!=`, `=~`)**.
- Permite combinaciones con `&&` y `||`.

```bash
if [[ "$nombre" == A* ]]; then
  echo "Comienza por A"
elif [[ "$edad" -ge 18 && "$edad" -le 30 ]]; then
  echo "Entre 18 y 30"
fi
```

    ⚠️ Recomendado para scripts Bash actuales.

### 🔹 `(( ... ))` → Expresiones aritméticas
- Se usa para **operaciones numéricas** sin necesidad de `-lt` ni comillas.
- Se pueden usar operadores `>`, `<`, `>=`, `<=`, `==`, `!=`.
```bash
if (( a < b )); then
  echo "a es menor que b"
fi
```

    ⚠️ Dentro de `(( ))` no se usa `$` delante de las variables.

### 🔹 `[[]]` vs `(( ))` vs `[ ]` — Cuadro resumen

| Forma        | Tipo de comparación | Usa `$` | Ejemplo válido | Notas |
|---------------|--------------------|-------------|----------------|-------|
| `[ ... ]`     | POSIX, genérica    | ✅ Sí        | `[ "$a" -eq "$b" ]` | Más antigua, válida en todos los shells |
| `[[ ... ]]`   | Bash moderna       | ✅ Sí        | `[[ $a -ge 10 && $b -le 20 ]]` | Más robusta, evita errores de expansión |
| `(( ... ))`   | Aritmética pura    | 🚫 No        | `(( a < b ))` | Ideal para números enteros |
| `( ... )`     | Subshell           | ✅ Sí        | `$( comando1; comando2 )` | Ejecuta comandos en un subshell |
| `(( ... ))`   | Evaluación aritmética | 🚫 No     | `(( total++ ))` | Incrementos y cálculos directos |
_

| Objetivo | Sintaxis recomendada | Comentario |
|-----------|----------------------|-------------|
| Comparar números | `(( a < b ))` o `[ $a -lt $b ]` | Usa `(( ))` si es Bash puro |
| Comparar cadenas | `[[ $a == "hola" ]]` | Más robusto que `[ ]` |
_

# :cyclone:  6. Lectura de ficheros en Bash

Existen varias formas de **leer líneas de un fichero** en Bash.  
Las más comunes son con **`while`** y **`for`**, aunque también puede hacerse con `mapfile` o `readarray`.

### 🔹 Método 1: `while read` (recomendado)
Lee el fichero línea por línea.
```bash
while IFS= read -r linea; do
  echo "Línea: $linea"
done < archivo.txt
```
- `IFS=` evita que se recorten espacios.
- `-r` evita que `\` sea interpretado como escape.
- `< archivo.txt` redirige la entrada estándar desde el fichero.

      ⚠️ Método más seguro y usado.

### 🔹 Método 2: `for` con sustitución de comandos
Itera sobre las líneas del fichero, separadas por espacios o saltos de línea.
```bash
for linea in $(cat archivo.txt); do
  echo "Palabra o línea: $linea"
done
```
    ⚠️ No recomendable si el fichero contiene espacios en las líneas, ya que **divide por espacios**, no por líneas completas.

### 🔹 ¿Y `foreach`?
Bash **no tiene** una estructura `foreach` nativa. Sin embargo, el bucle `for` cumple esa función cuando se usa sobre una lista o un array:
```bash
for elemento in "${array[@]}"; do
  echo "$elemento"
done
```
### ✍️ **Consejo final:**  
    Usa `[[ ... ]]` para condiciones generales y `(( ... ))` para aritmética.  
    Para leer ficheros, siempre que necesites preservar el formato, usa `while read`.


# :cyclone:  7. Condicionales con comandos

El comportamiento de if en Bash no se basa en “verdadero/falso” aritmético, sino en códigos de salida de comandos.

### 🔹 Uso de `grep` dentro de un condicional

Este ejemplo busca un nombre de usuario dentro de los archivos de un directorio `lib`. Si el usuario se encuentra, se ejecuta un comando (en este caso, imprimir un mensaje).

```bash
#!/bin/bash

usuario="juan"
directorio="lib"

# Comprobamos si el usuario aparece en algún archivo dentro de lib
if grep -Rq "$usuario" "$directorio"; then
    echo "Usuario $usuario encontrado en lib"
else
    echo "Usuario $usuario no encontrado"
fi
```

**Explicación:**  
- `grep -R` recorre recursivamente todos los archivos del directorio.  
- `-q` hace que `grep` no imprima nada, solo devuelve el estado de salida (0 si encuentra coincidencias).  
- El condicional `if` evalúa el estado de salida y ejecuta la acción correspondiente.

### 🔹 Uso de `find` dentro de un condicional

Este ejemplo busca un archivo específico dentro del directorio `lib`. Si el archivo existe, se ejecuta una acción (por ejemplo, mostrar su contenido).


```bash
#!/bin/bash

directorio="lib"
archivo_buscado="config.txt"

# Usamos find directamente dentro del if
if find "$directorio" -type f -name "$archivo_buscado" -print -quit; then
    echo "Archivo $archivo_buscado encontrado, ejecutando acción..."
    cat "$directorio/$archivo_buscado"
else
    echo "Archivo $archivo_buscado no encontrado"
fi
```
**Explicación:**  
* **`if find ...:`**: La sentencia `if` ejecuta el comando `find`. El `if` verifica el **código de salida** del comando `find`. Un código de salida de **cero ($\text{0}$)** indica éxito (archivo encontrado), y cualquier otro valor indica fallo (archivo no encontrado o error).

* **`-name "mi_archivo.txt"`**: Busca un archivo llamado `mi_archivo.txt` en el directorio especificado por la variable `$directorio` (asumiendo que está definida en el *script*).

* **`-print`**: Imprime el nombre del archivo encontrado.

* **`-quit`**: Termina la búsqueda **inmediatamente** después de encontrar la primera coincidencia. Esto es crucial para que `find` devuelva un código de salida $\text{0}$ (éxito) si encontró el archivo, permitiendo que la condición `if` se cumpla.

* **`; then`**: Separa el comando (`find`) y su evaluación de las acciones a ejecutar si el comando tuvo éxito (es decir, si `find` encontró el archivo y terminó con código de salida $\text{0}$).

* **`echo "¡El archivo ..."`**: Este comando se ejecutará solo si `find` encontró el archivo, ya que solo en ese caso la condición del `if` será verdadera.

* **`fi`**: Cierra el bloque de la sentencia `if`.

# :cyclone:  8. Funciones

Son bloques de código reutilizables.  
### Definición
```bash
nombre() {
   comandos
}
```
### Parámetros especiales
- `$0` → nombre del script.  
- `$1, $2...` → parámetros pasados.  
- `$#` → número de parámetros.  
- `$*` → todos los parámetros como cadena.  
- `$@` → todos los parámetros como lista.  

### Ejemplo

```bash
#!/bin/bash

# Función que recibe dos parámetros y los muestra
saludar() {
  nombre=$1
  ciudad=$2
  echo "Hola, $nombre. Bienvenido a $ciudad."
}

# Llamada a la función con dos argumentos
saludar "Yeray" "Agüimes"
```

# :cyclone:  9. Depuración y Pruebas

- `bash -x script.sh` → modo debug (muestra ejecución línea a línea).  
- `bash -n script.sh` → verifica sintaxis sin ejecutar.  

## Bibliografía
- [Programación en Bash](https://github.com/IamJony/Programacion-bash)  
- [Guía de Bash scripting](https://github.com/Idnan/bash-guide)  
