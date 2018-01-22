#!/bin/bash
#Creator Bastien Piguet @golden0kamia

file='settings.json' #Settings file

pinIN=$(jq .setting.pinIN $file)
pinOUT=$(jq .setting.pinOUT $file)

gpio mode $pinIN in
gpio mode $pinOUT out

function pg_it_send()
{
	
    adresse=$((jq .device.$1.adresse $file)
    unit=$((jq .device.$1.unit $file)
	group=$3
    status=$2
    delay=$((jq .device.$1.delay $file))
	
	./send433 $adresse $status $group $unit $delay
	
}