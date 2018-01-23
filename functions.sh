#!/bin/bash
#Creator Bastien Piguet @Golden0kamia

file='settings.json' #Settings file

pinIN=$((jq .setting.pinIN $file))
pinOUT=$((jq .setting.pinOUT $file))

gpio mode $pinIN in
gpio mode $pinOUT out

function pg_it_send()
{
	
    adresse=$((jq .device.$1.adresse $file))
    status=$2
	group=$3
    unit=$((jq .device.$1.unit $file))
    delay=$((jq .device.$1.delay $file))
	
	if[$2 = 1]
	then
		pg_it_return turn_on $1
	else
		pg_it_return turn_off $1
	fi
	
	./send433 $adresse $status $group $unit $delay
}