#!/bin/bash

# Uso de parámetros en Bash
# $1 es el primer parámetro
# $2 es el segundo parámetro
# $# es el número de parámetros recibidos

if [ $# -lt 1 ]; then
    echo "Uso: $0 NOMBRE [EDAD]"
    exit 1
fi

NOMBRE=$1
EDAD=$2

if [ -n "$EDAD" ]; then
    echo "Hola, $NOMBRE. Tienes $EDAD años."
else
    echo "Hola, $NOMBRE."
fi

bash saludo.sh Ana 25
# Salida: Hola, Ana. Tienes 25 años.

bash saludo.sh Luis
# Salida: Hola, Luis.

bash saludo.sh
# Salida: Uso: saludo2.sh NOMBRE [EDAD]

