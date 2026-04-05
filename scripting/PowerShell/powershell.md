# 🌪️ PowerShell -- Scripting para Administración de Sistemas

## Índice

- [🌪️ PowerShell -- Scripting para Administración de Sistemas](#️-powershell----scripting-para-administración-de-sistemas)
  - [Índice](#índice)
- [:cyclone: 1. PowerShell](#cyclone-1-powershell)
  - [Qué es PowerShell](#qué-es-powershell)
  - [Pasos para crear un script](#pasos-para-crear-un-script)
  - [Buenas prácticas](#buenas-prácticas)
  - [Aplicaciones](#aplicaciones)
- [:cyclone: 2. Variables](#cyclone-2-variables)
- [:cyclone: 3. Operaciones básicas](#cyclone-3-operaciones-básicas)
- [:cyclone: 4. Estructuras de control](#cyclone-4-estructuras-de-control)
- [:cyclone: 5. Comparaciones](#cyclone-5-comparaciones)
- [:cyclone: 6. Lectura de ficheros](#cyclone-6-lectura-de-ficheros)
- [:cyclone: 7. Condicionales con comandos](#cyclone-7-condicionales-con-comandos)
- [:cyclone: 8. Funciones](#cyclone-8-funciones)
- [:cyclone: 9. Depuración y Pruebas](#cyclone-9-depuración-y-pruebas)
  - [Bibliografía](#bibliografía)

------------------------------------------------------------------------

# :cyclone: 1. PowerShell

PowerShell es un **lenguaje de scripting y shell de automatización**
desarrollado por Microsoft, orientado a la **administración de
sistemas**.\
Trabaja con **objetos**, no solo con texto, lo que lo hace especialmente
potente para tareas administrativas.

``` powershell
Write-Host "Hola mundo"
```

## Qué es PowerShell

-   Shell interactiva
-   Lenguaje de scripting
-   Basado en .NET
-   Orientado a objetos

------------------------------------------------------------------------

## Pasos para crear un script

``` powershell
Set-ExecutionPolicy RemoteSigned
./script.ps1
```

------------------------------------------------------------------------

## Buenas prácticas

-   Usar verbos estándar (`Get-`, `Set-`, `New-`)
-   Comentar el código
-   Modularizar con funciones
-   Controlar errores

------------------------------------------------------------------------

## Aplicaciones

-   Administración Windows
-   Active Directory
-   Automatización
-   Gestión remota

------------------------------------------------------------------------

# :cyclone: 2. Variables

``` powershell
$nombre = "Yeray"
$edad = 30
```

------------------------------------------------------------------------

# :cyclone: 3. Operaciones básicas

``` powershell
$a = 10
$b = 5
$a + $b
```

------------------------------------------------------------------------

# :cyclone: 4. Estructuras de control

``` powershell
if ($a -gt $b) {
    Write-Host "Mayor"
}
```

``` powershell
foreach ($i in 1..5) {
    Write-Host $i
}
```

------------------------------------------------------------------------

# :cyclone: 5. Comparaciones

  Operador   Significado
  ---------- -------------
  `-eq`      igual
  `-ne`      distinto
  `-gt`      mayor
  `-lt`      menor

------------------------------------------------------------------------

# :cyclone: 6. Lectura de ficheros

``` powershell
Get-Content archivo.txt
```

------------------------------------------------------------------------

# :cyclone: 7. Condicionales con comandos

``` powershell
if (Test-Path "config.txt") {
    Write-Host "Existe"
}
```

------------------------------------------------------------------------

# :cyclone: 8. Funciones

``` powershell
function Saludar {
    param ($Nombre)
    Write-Host "Hola $Nombre"
}
```

------------------------------------------------------------------------

# :cyclone: 9. Depuración y Pruebas

-   Write-Debug
-   Write-Verbose
-   Try/Catch

------------------------------------------------------------------------

## Bibliografía

-   https://learn.microsoft.com/powershell
-   https://devhints.io/powershell
