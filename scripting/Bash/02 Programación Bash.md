---
title: "bash [Programación]"
weight: 2
---

## Índice

## Programación en Bash

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
    - [Ejemplo](#ejemplo-3)
  - [9. Depuración y Pruebas](#9-depuración-y-pruebas)
  - [Bibliografía](#bibliografía)
  - [📦 Operadores y wildcards](#-operadores-y-wildcards)
  - [Funciones en Bash](#funciones-en-bash)
  - [Definición de una función](#definición-de-una-función)
  - [Parámetros](#parámetros)




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

## 2. Variables
Las ``variables`` en Bash se utilizan para almacenar información que se puede utilizar más adelante en el script. No es necesario declarar el tipo de una variable, solo se asigna un valor.

```bash
VARIABLE=valor # Define una variable.
$VARIABLE # Accede al valor de una variable.
export VARIABLE=valor # Define una variable de entorno.

# Ejemplos:
VAR=valor        # 💾 Asignar variable
echo $VAR        # 📢 Mostrar variable
read VAR         # 🎤 Leer entrada del usuario

nombre="Juan"
echo "Hola, $nombre"
```




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

## 3. Operaciones Básicas

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

## 4. Estructuras de Control

### 🔹  Secuencial
En la estructura secuencial, las instrucciones se ejecutan una tras otra, en el orden en que aparecen en el script.
```bash
#!/bin/bash
echo "Inicio del programa"
nombre="Yeray"
echo "Hola, $nombre"
echo "Fin del programa"
```

```bash
echo "Comenzando script"
mkdir nuevo_directorio
echo "Directorio creado"
```

### ❓ Condicional (if-else)

> #### Estructura Condicional `if`

La estructura `if` permite ejecutar un bloque de comandos si se cumple una condición. Para esa condición se sueles usar:

1. Simples corchetes [ ... ]:

   - Se utilizan para evaluar expresiones condicionales simples son más antiguos y se basan en el comando **test**.
   - Limitados en cuanto a operadores de comparación y no permiten trabajar con cadenas que contienen espacios sin comillas.
   - No permiten operaciones de comparación de cadenas con patrones (como == o != con **wildcards**).

2. Dobles corchetes [[...]]:
   - Permiten el uso de operadores lógicos más avanzados, como &&, || y !.
   - Son más tolerantes con las cadenas que contienen espacios, ya que no requieren que las variables se citen explícitamente en muchos casos.
   - Soportan comparaciones de cadenas con patrones, como == y !=, y permiten el uso de comodines (\*, ?).
3. Operadores comunes: (Ver sección operadores y wildcards)
    ```bash
    [ "$a" = "$b" ]     # 📏 Igualdad de cadenas
    [ "$a" -eq "$b" ]   # 🔢 Igualdad numérica
    [ -f FILE ]         # 📄 Es un archivo
    [ -d DIR ]          # 📁 Es un directorio
    [ -z "$STR" ]       # 🈳 Cadena vacía
    ```

**Sintaxis**

```bash
  if [[ condición ]]; then
      # comandos
  elif [[ condición ]]; then
      # comandos alternativos
  else
      # comandos alternativos
  fi
```

**Ejemplo**

```bash
numero=10
if [ $numero -gt 5 ]; then
    echo "El número es mayor que 5"
else
    echo "El número es menor o igual que 5"
fi
```

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

> #### Estructura Condicional `case`

El case se utiliza cuando se desea evaluar múltiples opciones posibles para una variable. Es útil cuando se tienen muchas condiciones que verificar.

**Sintaxis**

```bash
case $variable in
    valor1)
        # comandos si la variable es igual a valor1
        ;;
    valor2)
        # comandos si la variable es igual a valor2
        ;;
    *)
        # comandos si ninguna opción coincide
        ;;
esac
```

**Ejemplo**

```bash
read -p "Elige una opción (a/b): " opcion
case $opcion in
    "a")
        echo "Elegiste A"
        ;;
    "b")
        echo "Elegiste B"
        ;;
    *)
        echo "Opción no válida"
        ;;
esac
```

En este ejemplo, dependiendo del valor de opcion, se ejecuta un bloque de código específico.

## 🔁Estructuras iterativa (bucles)

Permite repetir un conjunto de comandos varias veces, según una condición o una lista de valores. Se usan cuando quieres automatizar tareas repetitivas sin escribir el mismo código una y otra vez.

> ### Estructura iterativa `for`

🔹 Recorre una lista o secuencia de valores.

✔️ Úsalo cuando sabes cuántas veces vas a repetir algo o tienes una lista definida.

#### Sintaxis

```bash
for variable in {inicio..fin}; do
    # comandos
done
```

#### Ejemplo

```bash
for i in {1..5}; do
    echo "Iteración $i"
done
# Este bucle imprimirá "Iteración 1", "Iteración 2", hasta "Iteración 5".
```

```bash
for archivo in *.txt; do
  echo "Procesando $archivo"
done
```

> ### Estructura iterativa `while` 

🔹 Repite mientras una condición sea verdadera.

✔️ Úsalo cuando no sabes cuántas veces se repetirá y depende de una condición que puede cambiar durante la ejecución.

#### Sintaxis

```bash
while [ condición ]; do
    # comandos
done
```

#### Ejemplo:

```bash
contador=1
while [ $contador -le 3 ]; do
    echo "Contador: $contador"
    contador=$((contador + 1))  # ((contador++))
done
#Este bucle seguirá ejecutándose mientras la condición sea verdadera. En este caso, imprimirá los valores del contador del 1 al 3.
```

```bash
while IFS= read -r linea; do
    echo "Línea: $linea"
done < archivo.txt

# El bucle while es comúnmente utilizado para leer archivos línea por línea, especialmente cuando no sabes cuántas líneas tiene el archivo o cuando necesitas realizar operaciones dinámicas en cada línea.

# Recuerda usar `IFS` y `-r` para una lectura más robusta si las líneas contienen espacios o caracteres especiales.
```

> ### Estructura iterativa `until`

🔹 Repite hasta que una condición sea verdadera (lo opuesto a while).

✔️ Úsalo cuando quieres repetir algo hasta que ocurra una condición.

#### Sintaxis

```bash
until [ condición ]; do
    # comandos
done
```

#### Ejemplo

```bash
contador=1
until [ $contador -gt 3 ]; do
    echo "Contador: $contador"
    contador=$((contador + 1)) # ((contador++))
done
# Este bucle continuará ejecutándose hasta que la condición se haga verdadera (cuando el contador sea mayor que 3)
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

## 9. Depuración y Pruebas

- `bash -x script.sh` → modo debug (muestra ejecución línea a línea).  
- `bash -n script.sh` → verifica sintaxis sin ejecutar.  

## Bibliografía
- [Programación en Bash](https://github.com/IamJony/Programacion-bash)  
- [Guía de Bash scripting](https://github.com/Idnan/bash-guide)  




## 📦 Operadores y wildcards

> ### 🔢 Tabla de Operadores Lógicos en Bash

| Operador     | Descripción                                |
|--------------|---------------------------------------------|
| `-lt` (<)    | less than (menor que)                       |
| `-gt` (>)    | greater than (mayor que)                    |
| `-le` (<=)   | less or equal than (menor o igual que)      |
| `-ge` (>=)   | greater or equal than (mayor o igual que)   |
| `-eq` (==)   | equal (igual)                               |
| `-ne` (!=)   | not equal (distinto)                        |
| `-n`         | not null (el valor contiene al menos 1 carácter) |
| `-z`         | null (el valor no contiene ningún carácter) |

> ### 📁 Operadores Condicionales de Ficheros en Bash

| Operador | Descripción                                                  |
|----------|--------------------------------------------------------------|
| `-e`     | Verifica si existe el fichero o directorio                   |
| `-f`     | Verifica si existe el fichero **y NO es** un directorio      |
| `-s`     | Verifica si el fichero existe **y no está vacío**            |
| `-d`     | Verifica si **es un directorio**                             |
| `-r`     | Verifica si el fichero/directorio tiene **permisos de lectura** |
| `-w`     | Verifica si tiene **permisos de escritura**                  |
| `-x`     | Verifica si tiene **permisos de ejecución**                  |

> ### 📎 Tabla de Wildcards en Bash

| Comodín | Significado                                 | Ejemplo             | Coincidencias típicas             |
|---------|---------------------------------------------|---------------------|-----------------------------------|
| `*`     | Cualquier cantidad de caracteres (incluido ninguno) | `*.txt`             | `nota.txt`, `resumen.txt`, etc.   |
| `?`     | Un solo carácter (cualquiera)               | `archivo?.log`      | `archivo1.log`, `archivoA.log`    |
| `[abc]` | Un solo carácter que sea `a`, `b` o `c`     | `file[123].txt`     | `file1.txt`, `file2.txt`, etc.    |
| `[a-z]` | Un solo carácter en ese rango               | `letra[a-z].sh`     | `letraa.sh`, `letrab.sh`, etc.    |
| `[!abc]` o `[^abc]` | Cualquier carácter excepto `a`, `b` o `c` | `file[!0-9].txt`     | `filea.txt`, `file_.txt`, etc.    |
| `{uno,dos}` | Expansión de lista, separado por comas  | `echo {uno,dos}`    | `uno dos` (expande ambas opciones)|
| `{1..3}` | Expansión de rango numérico o alfabético   | `file{1..3}.txt`    | `file1.txt`, `file2.txt`, `file3.txt` |
| `**`    | Recursivo (si `shopt -s globstar`)          | `**/*.txt`          | Todos los `.txt` en subdirectorios |

> 🔧 **Nota**: La expansión `**` solo funciona si activas `globstar`:
```bash
shopt -s globstar
```
## Funciones en Bash

Las funciones en Bash permiten agrupar un conjunto de comandos bajo un mismo nombre para poder reutilizarlos en diferentes partes de un script. Esto ayuda a organizar el código, evitar repeticiones y facilitar su mantenimiento.

## Definición de una función

Para definir una función en Bash, se utiliza la siguiente sintaxis:
```bash
nombre_funcion() {
    # Comandos que realiza la función
}
```
```bash
mi_funcion() {
    echo "Hola desde la función"
}
```
Una vez definida la función, puedes llamarla en cualquier lugar del script simplemente escribiendo su nombre:
```bash
mi_funcion
```
La salida de este script será:
- Hola desde la función


## Parámetros
Puedes pasar parámetros a una función al momento de llamarla. Los parámetros se acceden dentro de la función a través de $1, $2, $3, etc., que representan el primer, segundo y tercer parámetro, respectivamente.
Ejemplo con parámetros:
```bash
saludar() {
    echo "Hola, $1"
}
```
```bash
saludar "Juan"
```
En este ejemplo, la función saludar toma un argumento (en este caso, el nombre "Juan") y lo imprime con un mensaje. La salida sería:
- Hola, Juan