#!/bin/bash
#Creator Bastien Piguet @golden0kamia

source gpio.sh

file='settings.json' #Settings file

pinIN=$(jq .setting.pinIN $file)
pinOUT=$(jq .setting.pinOUT $file)

gpio mode $pinIN in
gpio mode $pinOUT out
    

function pg_it_send()
{
    adresse=$(jq .device.$1.adresse $file)
    unit=$(jq .device.$1.unit $file)
    delay=$((jq .device.$1.delay $file))
    status=$2
    
    if [ "$3" = "1" ]
    then
        for i in {1..4}
        do
            start_send
            send_adresse $adresse
            send_bit 0 #Send to disable group action
            send_bit $status #Send the status of the light [on|off]
            send_unit $unit
            stop_send
        done
    elif [ "$3" = "0" ]
        for i in {1..4}
        do
            start_send
            send_adresse $adresse
            send_bit 1 #Send to enable group action
            send_bit $status #Send the status of the light [on|off]
            send_unit 0 #unit note use in group
            stop_send
        done
    else
        jv_error "Wrong bit send"
        jv_exit
    fi
    sleep 2
}

########## Sending data ##########
function start_send()
{
    gpio write $pin 1
    usleep $delay
    gpio write $pin 0
    usleep $((delay*10+delay/2))
}

function send_adresse()
{
    for i in {25..0}
    do
        send_bit $(((adresse >> i) & 1))
    done
}

function send_unit()
{
    for i in {3..0}
    do
        send_bit $(((unit >> i) & 1))
    done
}

function stop_send()
{
    gpio write $pin 1
    usleep $delay
    gpio write $pin 0
    usleep $((delay * 40))
}

function send_bit()
{
    if [ "$1" = "1" ]
    then
        gpio write $pin 1
        usleep $delay
        gpio write $pin 0
        usleep $((delay * 5))
        gpio write $pin 1
        usleep $delay
        gpio write $pin 0
        usleep $delay
    elif [ "$1" = "0" ]
        gpio write $pin 1
        usleep $delay
        gpio write $pin 0
        usleep $delay
        gpio write $pin 1
        usleep $delay
        gpio write $pin 0
        usleep $((delay * 5))
    else
        jv_error "Wrong bit send"
        jv_exit
    fi
}
