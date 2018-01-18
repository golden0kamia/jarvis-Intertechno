#!/bin/bash

function pg_it_return()
{
	case $1 in
		no_device) echo "L'appareil $2 n'existe pas";;
		turn_on) echo "J'allume $2";;
		turn_off) echo "J'éteint";;
		*) jv_error "Error : key $1 unknow"
	esac
}
