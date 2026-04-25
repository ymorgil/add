---
title: "Rúbrica de Evaluación UT06-RA02"
weight: 2
---

# Rúbrica de Evaluación: Gestión de Procesos en Sistemas Operativos

Esta rúbrica detalla los criterios de corrección para el supuesto práctico. Cada uno de los 10 apartados tiene un valor máximo de **1 punto**, dividido en **4 evidencias de 0.25 puntos** cada una.


---

### Apartado 1: Instalación e integración de WSL2 y Docker en Windows
- Se aporta captura de pantalla de la terminal de Windows ejecutando `wsl -l -v` donde se verifica que la distribución Ubuntu utiliza la versión 2 del motor.
- Se incluye captura de la configuración de Docker Desktop donde se visualiza la opción "Use the WSL 2 based engine" y la integración con la distribución de Ubuntu activadas.
- Se demuestra mediante captura de terminal que los comandos `docker --version` y `docker ps` responden correctamente desde el prompt de Linux.
- Se incluye una breve explicación de los pasos realizados y la verificación de que el servicio de Docker y el portainer está en ejecución.

### Apartado 2: Observación de procesos reales en Windows
- Captura de pantalla del Administrador de tareas de Windows identificando los procesos `vmmem` y los servicios de Docker antes de iniciar el stack.
- Captura de la terminal de PowerShell con el comando de filtrado de procesos (CPU, RAM, PID, Usuario) para establecer la línea base.
- Se registra y señala específicamente el valor de la columna `WorkingSet` para la memoria física consumida por la instancia de WSL2.
- Documentación clara de los valores iniciales registrados que servirán para la comparativa final del apartado 10.

### Apartado 3: Despliegue del Stack Multi-servicio con Docker Compose
- El archivo `docker-compose.yml` está correctamente definido con las tres capas (Nginx, App, PostgreSQL) y las versiones de imagen adecuadas.
- Se incluye captura de la estructura de directorios del proyecto `proyectonombre` y la verificación del estado del servicio de Docker en Portainer.
- Se definen correctamente los volúmenes para la persistencia de datos de PostgreSQL y la red privada para la comunicación entre servicios.
- Explicación técnica de la configuración de red y volúmenes elegida, justificando por qué es necesaria para un entorno profesional.

### Apartado 4: Levantamiento de Servicios y Análisis Inicial
- Los contenedores arrancan en modo *detached* y aparecen en estado `running` (o `Up`) al ejecutar `docker compose ps`.
- Captura de pantalla del navegador accediendo a `localhost` a través del puerto de Nginx, y del puerto de python confirmando que la puerta de entrada funciona.
- Nueva captura de PowerShell y del Administrador de tareas mostrando la variación de recursos de `vmmem` tras el despliegue del stack.
- Descripción de las diferencias inmediatas encontradas entre los registros del apartado 2 y el estado actual de los procesos.

### Apartado 5: Análisis de Procesos dentro de los Contenedores
- Captura de pantalla de la ejecución de `ps` dentro del contenedor de la aplicación web, identificando claramente el proceso con PID 1.
- Se aporta la salida del comando `pstree` desde la terminal de WSL2, visualizando la jerarquía real del contenedor de servidor.
- - Se aporta la salida del comando `pstree` desde la terminal de WSL2, visualizando la jerarquía real del contenedor de aplicación.
- - Se aporta la salida del comando `pstree` desde la terminal de WSL2, visualizando la jerarquía real del contenedor de datos.

### Apartado 6: Gestión de Señales y Parada Controlada (SIGTERM / SIGKILL)
- Evidencia de la monitorización en tiempo real (con `watch`) del contenedor mientras se ejecuta la parada del contenedor.
- Comandos de parada entre `docker stop` y `docker kill`, anotando la duración exacta en segundos.
- Comparativa documentada justificada de lo sucedio y del porque.
- Captura de los logs del contenedor filtrado donde se aprecie el mensaje de recepción de la señal de parada o la interrupción abrupta.


### Apartado 7: Monitorización de Recursos y Consumo de Procesos
- Captura de pantalla de la herramienta `htop` en WSL2 donde se justifica los resultados encontrados.
- Se aporta la salida del comando `docker stats`, comparando de forma directa el uso de CPU y memoria de los tres servicios.
- Identificación razonada del servicio con mayor impacto en el sistema y explicación de qué recursos (CPU, RAM o I/O) consume más.
- Reflexión sobre la utilidad del Administrador de tareas de Windows frente a herramientas nativas de Linux para monitorizar contenedores.

### Apartado 8: Simulación de Fallos y Análisis de Impacto
- Gestión del Docker Stack: El alumno muestra que sabe arrancar el stack y visualizar los contenedores en funcionamiento desde la primera terminal.
- Uso del modo interactivo y Ping: Se comprueba que el alumno sabe entrar en la máquina app y lanzar el comando ping hacia el contenedor de base de datos.
- Simulación de parada: El alumno detiene el contenedor datos desde la tercera terminal y documenta el corte de comunicación.
- Reflexión y Capturas: Se incluye una explicación clara de lo ocurrido y se aportan las capturas de pantalla de docker, el ping fallido y el estado final.

### Apartado 9: Correlación entre Procesos, WSL2 y Windows
- Presentación de la tabla comparativa completa con las 5 columnas: Servicio, Contenedor, PID interno, PID WSL2 y Proceso padre Windows.
- Los datos de la tabla son coherentes y demuestran un rastreo preciso de un mismo proceso a través de todas las capas del sistema.
- Explicación sobre la relación jerárquica entre la rama de procesos de Docker Desktop en Windows y su ejecución dentro de la VM de WSL2.
- Reflexión teórica sobre los mecanismos del Kernel (Namespaces y Cgroups) que permiten este aislamiento y visibilidad diferenciada.

### Apartado 10: Análisis Comparativo: Antes y Después del Stack
- Tabla comparativa final con las columnas "Antes" y "Después" para métricas de CPU, memoria de `vmmem` y número de procesos totales.
- Inclusión de las capturas de pantalla finales de PowerShell y Administrador de tareas que respaldan los datos de la tabla comparativa.
- Justificación técnica de los cambios observados en el comportamiento del sistema operativo Windows tras cargar el stack de microservicios.
- Conclusiones finales sobre la gestión de procesos en entornos de contenedores y la eficiencia del uso de recursos en WSL2.

### Rubricas de la entrega
* Por cada pauta del curso incumplida restamos 0.5 en cualquiera de los apartados anteriores.