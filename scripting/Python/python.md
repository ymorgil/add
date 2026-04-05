# Python
> Manual de Introducción al Lenguaje de Programación Python  
> Autor: Sergio Delgado Quintero

---

## Capítulo 1: Introducción

### ¿Qué es programar?
Programar consiste en escribir instrucciones para que sean ejecutadas por un ordenador. El lenguaje utilizado se llama **lenguaje de programación**. Los ordenadores solo entienden código máquina (ceros y unos), pero a lo largo del tiempo se han creado lenguajes intermedios que luego se convierten a código máquina.

### Evolución de los lenguajes

| Nivel | Lenguaje | Ejemplo "Hello, World" |
|-------|----------|------------------------|
| Más bajo | Código máquina | `00001000 00000010 01111011...` |
| Bajo | Ensamblador | Instrucciones específicas por arquitectura (ej. x86) |
| Medio | C | `printf("Hello, World\n");` |
| Alto | Python | `print('Hello, World')` |

> **Nota:** Python usa un **intérprete** (no compilador). La diferencia es que el intérprete realiza la interpretación y ejecución de una vez, mientras que el compilador genera un ejecutable que se lanza después.

### Hitos históricos de la computación

| Año | Persona | Aporte |
|-----|---------|--------|
| Siglo XV | Gottfried Leibniz | Máquinas de operaciones básicas |
| Siglo XVII | Charles Babbage | Máquina diferencial para polinomios |
| Siglo XVII | Ada Lovelace | Primera programadora de la historia |
| 1890 | Herman Hollerit | Sistema para automatizar el censo |
| 1943 | Alan Turing | Máquina de Turing y computadora con tubos de vacío |
| 1854 | George Boole | Álgebra booleana |
| 1942 | John Atanasoff | Primera computadora digital electrónica (ABC) |
| 1944 | Howard Aiken | Mark I (electromecánica, 16 metros de largo) |
| 1945 | Grace Hopper | Primera programadora del Mark I |
| 1946 | Mauchly & Eckert | ENIAC (computadora electrónica a gran escala) |
| 1946 | John Von Neumann | Propuso guardar programas en memoria |

### Python

- Creado por **Guido van Rossum** a finales de los 80/principios de los 90.
- Nombre inspirado en los *Monty Python*.
- Creado como sucesor del lenguaje ABC.

**Ventajas:**

| Característica | Descripción |
|----------------|-------------|
| OpenSource | Libre y gratuito |
| Legibilidad | Sintaxis cercana al pseudocódigo |
| Multiplataforma | Windows, Mac, Linux |
| Multiparadigma | Imperativa, OOP, funcional |
| Ecosistema | Gran cantidad de librerías |
| Tipado | Fuertemente tipado, tipado dinámico |

**Desventajas:**

| Característica | Descripción |
|----------------|-------------|
| Velocidad | Más lento que lenguajes compilados |
| Memoria | Mayor consumo de RAM |
| Móvil | Desarrollo móvil limitado |
| Versiones | Python 2 vs Python 3 (incompatibles) |

### El Zen de Python
Filosofía creada por Tim Peters que resume las buenas prácticas de Python:
- Bello es mejor que feo.
- Explícito es mejor que implícito.
- Simple es mejor que complejo.
- La legibilidad es importante.
- Los errores nunca deberían pasar silenciosamente.

---

## Capítulo 2: Entorno de Desarrollo

### Herramientas necesarias

| Herramienta | Función |
|-------------|---------|
| **Intérprete** | Ejecuta el código Python |
| **Editor** | Permite crear y editar ficheros `.py` |
| **Depurador (debugger)** | Ejecuta el código paso a paso para detectar errores (bugs) |

### Thonny
IDE recomendado para aprender Python. Integra intérprete, editor y depurador en una sola aplicación. Disponible para Windows, Mac y Linux.

```python
# Primer programa en Python
print('Hello, World')

# Con variable
msg = 'Hello, World'
print(msg)
```

### Gestión de paquetes con pip

```bash
# Instalar un paquete
$ pip install pandas

# Desinstalar un paquete
$ pip uninstall pandas

# Actualizar un paquete
$ pip install --upgrade pandas
```

### Entornos virtuales

```bash
# Instalar virtualenv
$ pip install virtualenv

# Instalar virtualenvwrapper
$ pip install virtualenvwrapper

# Crear un entorno virtual
$ mkvirtualenv env1

# Activar el entorno virtual
$ workon env1

# Listar paquetes instalados en el entorno
$ lssitepackages
```

### Editores y IDEs

| Tipo | Herramienta |
|------|-------------|
| Generales con soporte Python | Eclipse + PyDev, Sublime Text, Atom, VS Code, Visual Studio |
| Específicos para Python | PyCharm, Spyder, Thonny |
| Notebooks interactivos | Jupyter Notebook |

### Versiones de Python

| Versión | Fecha |
|---------|-------|
| Python 1.0 | Enero 1994 |
| Python 2.0 | Octubre 2000 |
| Python 2.7 | Julio 2010 |
| Python 3.0 | Diciembre 2008 |
| Python 3.6 | Diciembre 2016 |
| Python 3.8 | Octubre 2019 |

> **Importante:** Desde el 1 de enero de 2020 finalizó el soporte oficial a Python 2.7. Se recomienda usar **Python 3**.

---

## Capítulo 3: Tipos de Datos

### Tipos de datos en Python

| Nombre | Tipo | Ejemplos |
|--------|------|----------|
| Booleano | `bool` | `True`, `False` |
| Entero | `int` | `21`, `34500`, `34_500` |
| Flotante | `float` | `3.14`, `1.5e3` |
| Complejo | `complex` | `2j`, `3 + 5j` |
| Cadena | `str` | `'tfn'`, `'''texto multilínea'''` |
| Tupla | `tuple` | `(1, 3, 5)` |
| Lista | `list` | `['Chrome', 'Firefox']` |
| Conjunto | `set` | `set([2, 4, 6])` |
| Diccionario | `dict` | `{'Chrome': 'v79', 'Firefox': 'v71'}` |

### Variables

```python
# Asignación simple
age = 30
name = 'Ana'
PI = 3.14159  # constante (mayúsculas por convención)

# Asignación múltiple
a = b = c = 3

# Conocer el tipo
type(age)     # <class 'int'>
type(name)    # <class 'str'>
```

**Reglas para nombres de variables:**

| Válido | Inválido | Razón |
|--------|----------|-------|
| `a` | `3` | Empieza por un dígito |
| `a3` | `3a` | Empieza por un dígito |
| `_abc` | `with` | Es palabra reservada |
| `a_b_c` | `another-name` | Contiene carácter no permitido |

### Números

```python
# Operaciones con enteros
5 + 8     # 13  → Suma
90 - 10   # 80  → Resta
4 * 7     # 28  → Multiplicación
7 / 2     # 3.5 → División flotante
7 // 2    # 3   → División entera
7 % 3     # 1   → Módulo (resto)
3 ** 4    # 81  → Exponenciación

# Asignación aumentada
stock = 100
stock -= 20   # equivale a: stock = stock - 20
```

### Conversión de tipos

| Tipo 1 | Tipo 2 | Resultado (conversión implícita) |
|--------|--------|----------------------------------|
| `bool` | `int` | `int` |
| `bool` | `float` | `float` |
| `int` | `float` | `float` |

```python
# Conversión explícita
bool(0)       # False
int('42')     # 42
float('3.14') # 3.14
str(100)      # '100'
```

### Cadenas de texto (strings)

```python
# Crear strings
greeting = 'Hola mundo'
multiline = '''Línea 1
Línea 2'''

# Operaciones
len('Python')         # 6 → longitud
'Py' + 'thon'         # 'Python' → concatenar
'ha' * 3              # 'hahaha' → repetir
'Python'[0]           # 'P' → acceder por índice
'Python'[-1]          # 'n' → índice negativo
'Python'[0:3]         # 'Pyt' → troceado (slice)

# Métodos útiles
'  hola  '.strip()         # 'hola'
'hola mundo'.split()       # ['hola', 'mundo']
'hola'.upper()             # 'HOLA'
'HOLA'.lower()             # 'hola'
'hola mundo'.replace('hola', 'adios')  # 'adios mundo'
'hola'.find('ol')          # 1

# f-strings (Python 3.6+)
name = 'Ana'
age = 25
print(f'Me llamo {name} y tengo {age} años.')

# Leer desde teclado
user_input = input('Introduce tu nombre: ')
```

---

## Capítulo 4: Control de Flujo

### Comentarios e indentación

```python
# Esto es un comentario de bloque

x = 10  # Esto es un comentario en línea

# Los bloques se definen con 4 espacios de indentación
if x > 5:
    print('x es mayor que 5')  # bloque del if
```

### Condicionales

```python
# if / elif / else
temperature = 30

if temperature > 35:
    print('Hace mucho calor')
elif temperature > 25:
    print('Hace calor')
elif temperature > 15:
    print('Temperatura agradable')
else:
    print('Hace frío')
```

### Operadores de comparación

| Operador | Símbolo | Ejemplo |
|----------|---------|---------|
| Igualdad | `==` | `5 == 5` → `True` |
| Desigualdad | `!=` | `5 != 3` → `True` |
| Menor que | `<` | `3 < 5` → `True` |
| Menor o igual | `<=` | `5 <= 5` → `True` |
| Mayor que | `>` | `7 > 3` → `True` |
| Mayor o igual | `>=` | `5 >= 5` → `True` |

```python
# Operadores lógicos
x = 7
x > 5 and x < 10   # True
x < 5 or x > 6     # True
not (x == 7)        # False

# Rango directo (pythónico)
5 < x < 10          # True
```

### Bucles

```python
# Bucle while
count = 1
while count <= 5:
    print(count)
    count += 1

# Romper un bucle con break
num = 20
while num >= 1:
    if num % 3 == 0:
        print(f'Primer múltiplo de 3: {num}')
        break
    num -= 1

# Bucle for (iterar sobre una cadena)
word = 'Python'
for letter in word:
    print(letter)

# Bucle for con range()
for i in range(1, 6):      # [1, 2, 3, 4, 5]
    print(i)

for i in range(0, 10, 2):  # [0, 2, 4, 6, 8]
    print(i)

for i in range(2, -1, -1): # [2, 1, 0]
    print(i)

# Bucles anidados: tablas de multiplicar
for i in range(1, 10):
    for j in range(1, 10):
        result = i * j
        print(f'{i} * {j} = {result}')
```

---

## Capítulo 5: Estructuras de Datos

### Listas

Las listas son **mutables**, ordenadas y permiten elementos duplicados.

```python
# Crear listas
fruits = ['apple', 'banana', 'cherry']
mixed  = [1, 'hello', True, 3.14]
empty  = []

# Acceso y troceado
fruits[0]       # 'apple'
fruits[-1]      # 'cherry'
fruits[0:2]     # ['apple', 'banana']

# Modificar
fruits.append('mango')        # añadir al final
fruits.insert(1, 'blueberry') # insertar en posición
fruits[0] = 'kiwi'            # modificar elemento
del fruits[0]                 # borrar por índice
fruits.remove('banana')       # borrar por valor
fruits.pop()                  # extraer el último

# Ordenar
sorted(fruits)    # nueva lista ordenada
fruits.sort()     # modifica la lista original

# Iterar
for fruit in fruits:
    print(fruit)

# Iterar con índice
for i, fruit in enumerate(fruits):
    print(i, fruit)

# Iterar sobre múltiples listas en paralelo
names  = ['Ana', 'Luis']
scores = [9, 7]
for name, score in zip(names, scores):
    print(f'{name}: {score}')

# Funciones matemáticas
sum([1, 2, 3])   # 6
min([1, 2, 3])   # 1
max([1, 2, 3])   # 3
len([1, 2, 3])   # 3
```

### Tuplas

Las tuplas son **inmutables**: una vez creadas no se pueden modificar.

```python
# Crear tuplas
point    = (3, 5)
single   = (42,)    # tupla de un solo elemento (coma obligatoria)
empty    = tuple()

# Desempaquetado
x, y = point
print(x, y)  # 3  5

# Intercambio de valores (sin variable auxiliar)
a, b = 1, 2
a, b = b, a
print(a, b)  # 2  1
```

| Operación | Lista (`list`) | Tupla (`tuple`) |
|-----------|:--------------:|:---------------:|
| Mutable | ✅ | ❌ |
| Ordenada | ✅ | ✅ |
| Duplicados | ✅ | ✅ |
| Índices | ✅ | ✅ |
| `append`, `sort`... | ✅ | ❌ |

### Diccionarios

Los diccionarios almacenan pares **clave-valor**. Son mutables y mantienen el orden de inserción (desde Python 3.7).

```python
# Crear diccionario
person = {'name': 'Ana', 'age': 25, 'city': 'Madrid'}

# Acceder
person['name']               # 'Ana'
person.get('phone', 'N/A')   # 'N/A' (sin error si no existe)

# Añadir / modificar
person['email'] = 'ana@mail.com'
person['age']   = 26

# Borrar
del person['city']
person.pop('email')

# Iterar
for key in person.keys():
    print(key)

for value in person.values():
    print(value)

for key, value in person.items():
    print(f'{key}: {value}')

# Combinar diccionarios
d1 = {'a': 1}
d2 = {'b': 2}
merged = {**d1, **d2}   # {'a': 1, 'b': 2}
d1.update(d2)            # modifica d1
```

### Conjuntos

Los conjuntos almacenan valores **únicos y sin orden**.

```python
# Crear conjuntos
evens = {2, 4, 6, 8}
empty = set()   # {} crearía un diccionario vacío

# Operaciones
evens.add(10)
evens.remove(2)
len(evens)
4 in evens   # True

# Teoría de conjuntos
A = {1, 2, 3}
B = {2, 3, 4}

A & B    # {2, 3}       → Intersección
A | B    # {1, 2, 3, 4} → Unión
A - B    # {1}           → Diferencia
A ^ B    # {1, 4}        → Diferencia simétrica
```

### Ficheros

```python
# Leer un fichero completo
with open('temps.dat', 'r') as f:
    content = f.read()        # todo como string
    # o bien:
    lines = f.readlines()     # lista de líneas

# Leer línea a línea (eficiente para ficheros grandes)
with open('temps.dat', 'r') as f:
    for line in f:
        min_t, max_t = line.strip().split()
        print(f'Min: {min_t}, Max: {max_t}')

# Escribir en un fichero
codes = ['TFN', 'LPA', 'ACE']
with open('airports.txt', 'w') as f:
    for code in codes:
        f.write(code + '\n')

# Añadir contenido (sin borrar el existente)
with open('airports.txt', 'a') as f:
    f.write('FUE\n')
```

| Modo | Símbolo | Descripción |
|------|---------|-------------|
| Lectura | `'r'` | Lee un fichero existente |
| Escritura | `'w'` | Crea o sobreescribe el fichero |
| Añadido | `'a'` | Añade al final sin borrar el contenido |

---

## Capítulo 6: Modularidad

### Funciones

Una función es un bloque de código **reutilizable** con nombre propio.

```python
# Definir una función simple
def greet():
    print('¡Hola!')

# Invocar la función
greet()

# Función con parámetros y retorno
def add(a, b):
    return a + b

result = add(3, 5)   # 8

# Parámetros con valor por defecto
def make_menu(wine, entree, dessert='Tiramisú'):
    return {'wine': wine, 'entree': entree, 'dessert': dessert}

make_menu('Rioja', 'Paella')
# {'wine': 'Rioja', 'entree': 'Paella', 'dessert': 'Tiramisú'}

# Argumentos por nombre (keyword arguments)
make_menu(entree='Gazpacho', wine='Albariño', dessert='Flan')

# Documentación (docstring)
def factorial(n):
    """
    Calcula el factorial de un número.

    Parameters
    ----------
    n : int
        Número entero no negativo.

    Returns
    -------
    int
        Factorial de n.
    """
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result

help(factorial)   # muestra el docstring
```

### Espacios de nombres

```python
animal = 'Tigre'   # variable global

def show_animal():
    animal = 'León'    # variable local (distinta de la global)
    print(animal)      # León

show_animal()
print(animal)          # Tigre
```

### Módulos

Un módulo es simplemente un fichero `.py` con código Python.

```python
# arith.py
def add(a, b):
    return a + b

def divide(a, b):
    return a / b
```

```python
# main.py — importar módulo completo
import arith
arith.add(3, 4)      # 7

# Importar solo lo necesario
from arith import divide
divide(10, 2)         # 5.0
```

### Paquetes

Un paquete es una **carpeta** que contiene módulos `.py`.

```
main.py
mymath/
    arith.py
    logic.py
```

```python
# Importar desde un paquete
from mymath import arith, logic

arith.add(2, 3)
logic.et(True, False)
```

### Programa principal

```python
# main.py
import some_module

def main():
    # lógica principal aquí
    pass

if __name__ == '__main__':
    main()
```

| Situación | `__name__` vale | Se ejecuta el bloque `if __name__ == '__main__'` |
|-----------|-----------------|--------------------------------------------------|
| Ejecutado directamente | `'__main__'` | ✅ Sí |
| Importado desde otro fichero | Nombre del módulo | ❌ No |
