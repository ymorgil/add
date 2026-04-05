---
title: "bash [Comandos]"
weight: 1
---

### 📌 Recursos útiles
- [Bash Cheat Sheet – Devhints](https://devhints.io/bash)

### Navegación de Directorios
- `pwd` – Muestra la ruta actual.
- `ls` – Lista los archivos y carpetas en el directorio actual.
- `cd <directorio>` – Cambia al directorio especificado.
- `cd ..` – Retrocede un nivel.
- `cd ~` – Cambia al directorio principal del usuario.

### Gestión de Archivos y Directorios
- `touch <archivo>` – Crea un archivo vacío.
- `mkdir <directorio>` – Crea un nuevo directorio.
- `rm <archivo>` – Elimina un archivo.
- `rm -r <directorio>` – Elimina un directorio y su contenido.
- `cp <origen> <destino>` – Copia archivos o directorios.
- `mv <origen> <destino>` – Mueve o renombra archivos o directorios.

### Visualización y Edición de Archivos
- `cat <archivo>` – Muestra el contenido de un archivo.
- `head <archivo>` – Muestra las primeras 10 líneas de un archivo.
- `tail <archivo>` – Muestra las últimas 10 líneas de un archivo.
- `nano <archivo>` – Edita el archivo usando el editor `nano`.

### Redirección y Pipes
- `>` – Redirecciona la salida a un archivo (sobrescribiendo). [ Ejemplo: `echo "Hello" > archivo.txt` ]
- `>>` – Redirecciona la salida y añade al final del archivo.
- `<` – Toma la entrada de un archivo.
- `|` – Pasa la salida de un comando como entrada de otro. [ Ejemplo: `cat archivo.txt | grep "texto"` ]

### Búsqueda
- `grep <texto> <archivo>` – Busca texto específico dentro de un archivo.
- `find <directorio> -name <nombre>` – Busca archivos o directorios por nombre.

### Procesamiento de Texto

- `awk` – Herramienta para el procesamiento y análisis de texto en función de patrones. Ejemplos:
    - `awk '{print $1}' archivo.txt` – Imprime la primera columna de cada línea en el archivo.
    - `awk '/patrón/ {print $0}' archivo.txt` – Imprime líneas que contienen el "patrón" en el archivo.
    - `awk -F , '{print $2}' archivo.csv` – Usa `,` como delimitador e imprime la segunda columna en un archivo CSV.

- `cut` – Extrae secciones de cada línea de un archivo o entrada estándar. Ejemplos:
    - `cut -d: -f1 /etc/passwd` – Imprime la primera columna (campos separados por `:`) del archivo `/etc/passwd`.
    - `cut -c1-5 archivo.txt` – Imprime los primeros cinco caracteres de cada línea.
    - `cut -f2 archivo.txt` – Imprime el segundo campo de cada línea (por defecto, los campos están separados por tabulaciones).

- `sed` – Editor de flujo para realizar sustituciones y manipulaciones de texto. Ejemplos:
    - `sed 's/patrón/nuevo_texto/g' archivo.txt` – Sustituye todas las ocurrencias de "patrón" por "nuevo_texto" en cada línea.
    - `sed -n '2,4p' archivo.txt` – Muestra solo las líneas de la 2 a la 4.
    - `sed '/^$/d' archivo.txt` – Elimina las líneas vacías.

### Alias
- `alias nombre='comando'` – Crea un alias para un comando. [ Ejemplo: `alias ll='ls -la'` ]
- `unalias nombre` – Elimina un alias.

### Comandos Útiles
- `echo <texto>` – Muestra texto en la terminal.
- `date` – Muestra la fecha y hora actual.
- `clear` – Limpia la terminal.
- `history` – Muestra el historial de comandos ejecutados.
- `whoami` – Muestra el usuario actual.
- `uname -a` – Muestra información del sistema.
- `df -h` – Muestra el uso de disco en el sistema.
- `du -h <archivo/directorio>` – Muestra el tamaño de un archivo o directorio.
- `uptime` – Muestra el tiempo que el sistema ha estado activo.

### Permisos
- `chmod <permisos> <archivo>` – Cambia los permisos de un archivo. Ejemplos:
    - `chmod 755 <archivo>` – Permisos de lectura, escritura y ejecución para el propietario; lectura y ejecución para grupo y otros.
    - `chmod +x <archivo>` – Añade permisos de ejecución.
    - `chmod -r <archivo>` – Elimina permisos de lectura.

- `chown <usuario>:<grupo> <archivo>` – Cambia el propietario y/o grupo de un archivo o directorio. Ejemplos:
    - `chown usuario <archivo>` – Cambia el propietario del archivo.
    - `chown usuario:grupo <archivo>` – Cambia el propietario y el grupo del archivo.
    - `chown -R usuario:grupo <directorio>` – Cambia recursivamente el propietario y grupo para todos los archivos dentro del directorio.

- `chgrp <grupo> <archivo>` – Cambia el grupo al que pertenece un archivo. Ejemplos:
    - `chgrp grupo <archivo>` – Cambia el grupo del archivo.
    - `chgrp -R grupo <directorio>` – Cambia recursivamente el grupo de todos los archivos dentro de un directorio.

- `umask <máscara>` – Establece los permisos por defecto para nuevos archivos y directorios. Resta permisos; por ejemplo, `777 - 022 = 755` o en archivos `666 - 022 = 644`. Ejemplos:
    - `umask 022` – Nuevos archivos tendrán permisos `755` y los directorios `644`.
    - `umask 077` – Nuevos archivos y directorios solo tendrán permisos para el propietario.

### Redes
- `ping <dirección>` – Prueba la conectividad con una dirección (IP o URL).
- `ifconfig` – Muestra la configuración de red (Linux y Unix).
- `ip addr` – Alternativa a `ifconfig` en sistemas modernos.
- `curl <URL>` – Realiza solicitudes HTTP y descarga contenido de URLs.
- `wget <URL>` – Descarga archivos desde Internet.
- `ssh usuario@host` – Inicia una conexión SSH a un servidor.
- `scp archivo usuario@host:<ruta>` – Copia un archivo de forma segura a otro equipo.
- `netstat -tuln` – Muestra las conexiones de red activas y puertos en uso.

### Gestión de Procesos
- `ps` – Muestra una lista de procesos en ejecución.
- `top` – Muestra una lista dinámica de procesos con uso de recursos.
- `kill <PID>` – Termina un proceso con el ID proporcionado.
- `killall <nombre_proceso>` – Termina todos los procesos con el nombre dado.

## Wildcards en Bash

    Asterisco *: Coincide con cero o más caracteres en una cadena.
        Uso: Puede coincidir con cualquier número de caracteres (incluyendo ninguno).
        Ejemplo:

    echo *.txt

    Este comando muestra todos los archivos que terminan con .txt en el directorio actual.

Signo de interrogación ?: Coincide con un solo carácter.

    Uso: Reemplaza exactamente un carácter en la cadena.
    Ejemplo:

    echo file?.txt

    Esto coincidiría con archivos como file1.txt, fileA.txt, pero no con file.txt.

Corchetes []: Coincide con uno de los caracteres dentro del conjunto de corchetes.

    Uso: Permite especificar un conjunto de caracteres posibles para esa posición.

    Ejemplo:

echo file[1-3].txt

Esto coincidiría con file1.txt, file2.txt y file3.txt.

También puedes usar rangos o listas explícitas:

    echo file[a-d].txt

    Esto coincidiría con filea.txt, fileb.txt, filec.txt, y filed.txt.

Caret ^ o ! dentro de los corchetes: Niega el conjunto de caracteres.

    Uso: Coincide con cualquier carácter que no esté dentro de los corchetes.
    Ejemplo:

    echo file[!a-z].txt

    Esto coincidiría con file!.txt, file#.txt, pero no con filea.txt.

Asterisco dentro de corchetes [*]: Coincide con el carácter asterisco literalmente, no como un comodín.

    Uso: Si quieres incluir un asterisco como un carácter normal en lugar de un comodín.
    Ejemplo:

    echo "file[*].txt"

    Esto coincidiría literalmente con el archivo file[*].txt.

Rango dentro de corchetes -: Define un rango de caracteres, como números o letras.

    Uso: Coincide con cualquier carácter dentro del rango especificado.

    Ejemplo:

echo file[0-9].txt

Esto coincidiría con archivos como file0.txt, file1.txt, file9.txt.

También puedes usar rangos de letras:

        echo file[a-z].txt

        Coincidiría con filea.txt, fileb.txt, etc., hasta filez.txt.

Ejemplos de uso en Bash:

    Buscar todos los archivos .txt en un directorio:

ls *.txt

Buscar archivos que empiecen con "log" y terminen con ".txt":

ls log*.txt

Buscar archivos que tengan un solo carácter después de "file":

ls file?.txt

Buscar archivos con nombres que contengan letras mayúsculas:

ls [A-Z]*.txt

Excluir archivos que tengan caracteres numéricos al final:

ls *[!0-9].txt

Coincidir con cualquier archivo que tenga uno o más caracteres entre "a" y "d" en su nombre:

    ls file[a-d]*.txt

Resumen de los Wildcards:

    *: Coincide con cero o más caracteres.
    ?: Coincide con un solo carácter.
    [ ]: Coincide con un solo carácter dentro de los corchetes.
    [! ] o [^ ]: Niega el conjunto de caracteres en los corchetes.
    [a-z]: Coincide con cualquier carácter dentro del rango de letras o números.

Los comodines son muy poderosos para realizar búsquedas y manipulaciones de archivos en Bash, lo que facilita trabajar con conjuntos de archivos o patrones complejos sin tener que especificar cada archivo individualmente.