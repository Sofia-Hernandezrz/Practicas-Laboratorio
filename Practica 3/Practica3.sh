#!/bin/bash

function ordenar(){
clear
limite=$rango
num=0
i=1
while [ $i -le $limite ]; do
	echo -n "Ingrese lo que desee ordenar: "
	read num
	echo $num >> numeros.txt
	i=$((i+1))
done

echo -n "¿Deseas ver lo introducido ordenado? (s/n): "
read numin
if [ $numin == "s" -o $numin == "S" ]
then
	echo -n "¿Como deseaas ver el orden? establecido, asendente o descente (o/a/d): "
	read orden
	case $orden
	in
	o|O)
	cat numeros.txt;;
	a|A)
	cat numeros.txt | sort -n;;
	d|D)
	cat numeros.txt | sort -n -r;;
	*)
	echo "Opcion no valida";;
	esac

fi
rm numeros.txt
}
echo "** Ordena lo que desees **"
echo -n "¿Determina el limite de lo que deseas ordenar?: "
read rango
ordenar
