---
title: "Supuesto UT06-RA02 Gestión de Procesos en Sistemas Operativos"
weight: 1
---

# Gestión de Procesos en Sistemas Operativos

En esta práctica vas a construir y analizar una infraestructura real de contenedores sobre Windows utilizando WSL2 y Docker. A lo largo de los apartados irás desde la instalación del entorno hasta el análisis profundo de cómo el sistema operativo gestiona los procesos que hay detrás de cada contenedor, relacionando lo que ocurre dentro de Linux con lo que es visible desde Windows. El objetivo no es solo que el stack funcione, sino que entiendas qué está pasando a nivel de procesos en cada momento.

## 1. Instalación e integración de WSL2 y Docker en Windows

Comenzar con el entorno de desarrollo instalando WSL2 (Windows Subsystem for Linux) junto con una distribución de Ubuntu. Una vez que tengas Linux funcionando en tu equipo, es imprescindible abrir la configuración de Docker Desktop (si no está instalado, instalarlo en Windows) y habilitar específicamente la opción de integración con WSL2; este ajuste es el que permite que el comando `docker` sea reconocido y ejecutado directamente desde la terminal de Linux.

Para asegurar que todo el proceso se ha realizado correctamente, ejecuta los comandos necesarios para comprobar que Docker está respondiendo y que tu distribución de Linux está operando bajo la versión 2 del motor de WSL.

## 2. Observación de procesos reales en Windows (Administrador de tareas y PowerShell)

Identificar los procesos críticos en el Administrador de tareas, centrándose específicamente en `vmmem` (que representa el consumo de la máquina virtual de WSL) y los servicios propios de Docker Desktop.

Antes de iniciar cualquier contenedor, utiliza PowerShell para obtener una instantánea del estado actual, filtrando los procesos activos para registrar valores clave como el uso de CPU, la memoria RAM asignada, el PID y el usuario propietario. Este registro servirá como línea base para comparar el impacto real en los recursos del sistema una vez que la arquitectura de contenedores esté en pleno funcionamiento.

> **Nota:** La columna `WorkingSet` te indicará la memoria física que el proceso está utilizando en ese preciso instante.

## 3. Despliegue del Stack Multi-servicio con Docker Compose

Para esta fase debéis configurar un entorno profesional de tres capas. El objetivo es crear una arquitectura donde un servidor Nginx actúe como puerta de entrada, una aplicación web gestione la lógica y una base de datos PostgreSQL almacene la información.

Primero, actualizar los paquetes de la distribución para evitar conflictos de versiones y verificar el estado del servicio de Docker. A continuación, crear la carpeta del proyecto `proyectoname` con su estructura de directorios, definir el archivo `docker-compose.yml` con los tres servicios, las redes y los volúmenes necesarios, y dejarlo listo para ser desplegado.

> **Importante:** Es fundamental que definais correctamente los volúmenes para que la información de la base de datos no se pierda al reiniciar los contenedores, y establezcáis una red privada para que los servicios se comuniquen de forma segura entre ellos.

## 4. Levantamiento de Servicios y Análisis Inicial de Contenedores

Con el stack correctamente definido, ponlo en marcha y verifica que todos los servicios han arrancado en el estado esperado. Levanta los contenedores en modo detached, comprueba su estado desde la terminal y confirma que la capa de proxy es accesible desde el navegador a través del puerto publicado.

Una vez activos los tres contenedores, vuelve al Administrador de tareas de Windows y a PowerShell para comparar los valores de `vmmem` y los procesos de Docker respecto a los registrados en el apartado 2. Documenta las diferencias observadas.

## 5. Análisis de Procesos dentro de los Contenedores

Entra en el contenedor de la aplicación web mediante `docker exec` y lista todos los procesos activos en su interior. El objetivo es identificar el proceso principal del servidor (PID 1 dentro del contenedor) y sus posibles procesos hijo, comprendiendo por qué el aislamiento de namespaces de Linux hace que la numeración de PIDs dentro del contenedor sea independiente de la del sistema anfitrión.

Desde WSL2, usa `pstree -p` para visualizar la jerarquía completa y localizar la cadena `dockerd → containerd → shim → proceso del contenedor`, relacionando así los procesos internos con su representación real en el sistema operativo.

## 6. Gestión de Señales y Parada Controlada de Procesos (SIGTERM / SIGKILL)

Cuando un contenedor se detiene, Docker no corta la ejecución de forma abrupta: primero envía una señal `SIGTERM` al proceso con PID 1 del contenedor, dándole un margen de tiempo (por defecto 10 segundos) para que libere recursos y cierre conexiones abiertas. Si el proceso no responde en ese plazo, Docker escala la señal a `SIGKILL`, forzando la terminación inmediata sin posibilidad de limpieza.

Para observar este comportamiento, abre dos terminales de WSL2 en paralelo. En la primera, monitoriza en tiempo real los procesos del contenedor de la aplicación web. En la segunda, ejecuta primero una parada controlada con `docker stop` y anota cuánto tiempo tarda en desaparecer el proceso. Vuelve a levantar el contenedor y repite la operación usando esta vez `docker kill`, que envía directamente `SIGKILL` sin esperar.

Compara en ambos casos si el contenedor ha dejado algún mensaje de cierre en sus logs y observa en el Administrador de tareas de Windows si el consumo de `vmmem` varía de forma diferente según el tipo de parada. 

## 7. Monitorización de Recursos y Consumo de Procesos

Con el stack completamente activo, el objetivo de este apartado es obtener una visión clara del impacto real que cada contenedor tiene sobre el sistema.

Desde WSL2, lanza `htop` para ver en tiempo real el consumo de CPU y memoria de todos los procesos. Localiza en la lista los procesos correspondientes a cada contenedor e identifica cuál de los tres servicios tiene mayor peso sobre el sistema. Complementa esta información ejecutando `docker stats`, que muestra de forma directa el consumo de CPU, memoria, red y disco por contenedor sin necesidad de cruzar datos manualmente.

Desde Windows, abre el Administrador de tareas y compara el consumo de `vmmem` con lo que has observado en WSL2. Reflexiona sobre por qué desde Windows solo es visible una parte del consumo real y qué limitaciones tiene el Administrador de tareas para monitorizar entornos de contenedores respecto a las herramientas de Linux.

## 8. Simulación de Fallos y Análisis de Impacto en Procesos

En este apartado simularás un fallo real en la infraestructura deteniendo únicamente el contenedor de PostgreSQL mientras los demás siguen en ejecución.

Una vez detenida la base de datos, revisa los logs de la aplicación web y del proxy Nginx para identificar qué tipo de errores generan al perder la conexión con el servicio del que dependen. Fíjate especialmente en si los errores aparecen de forma inmediata o tras un tiempo de espera, ya que esto refleja cómo el sistema operativo gestiona los timeouts de conexión a nivel de proceso.

Observa también en `htop` si el consumo de CPU de los contenedores activos varía al intentar reconectarse repetidamente. Tras documentar el comportamiento en fallo, vuelve a iniciar el contenedor de PostgreSQL y comprueba si los servicios dependientes se recuperan de forma autónoma o si es necesaria alguna intervención manual para restablecer el stack completo.

## 9. Correlación entre Procesos de Contenedores, WSL2 y Windows

Con el stack activo, realiza un análisis cruzado que relacione cada servicio con su representación a tres niveles distintos. Para cada contenedor debes identificar el PID que tiene el proceso principal dentro del propio contenedor (usando `docker exec` y `ps`), el PID real con el que ese mismo proceso aparece en WSL2 (usando `ps aux` o `pstree -p`) y, por último, localizarlo como parte de la rama de `vmmem` o Docker Desktop en el Administrador de tareas de Windows.

Recoge toda esta información en una tabla con las columnas: **Servicio**, **Contenedor**, **PID dentro del contenedor**, **PID en WSL2** y **Proceso padre en Windows**. A partir de esa tabla, reflexiona sobre por qué el PID interno del contenedor y el PID visible en WSL2 son siempre distintos, y qué mecanismo del kernel de Linux hace posible ese aislamiento.

## 10. Análisis Comparativo: Antes y Después del Stack

El objetivo de este apartado es que realices una comparación estructurada del estado del sistema en dos momentos concretos: antes de levantar ningún contenedor y con el stack completamente activo.

Para ello, recupera los datos que registraste en el apartado 2 (instantánea base con PowerShell y Administrador de tareas) y obtén ahora una nueva captura equivalente con el stack en marcha. Compara en ambos momentos el número de procesos activos relacionados con Docker y WSL2, el consumo de memoria de `vmmem`, el uso de CPU de los procesos de Docker Desktop y los PIDs nuevos que han aparecido asociados a los contenedores.

Presenta esta comparación en forma de tabla con dos columnas (**Antes** y **Después**) para cada métrica analizada, y añade una breve explicación de cada diferencia observada justificando a qué se debe ese cambio en el comportamiento del sistema operativo.
