#!/bin/bash
# Here you can create functions which will be available from the commands file
# You can also use here user variables defined in your config file
# To avoid conflicts, name your function like this
# pg_XX_myfunction () { }
# pg for PluGin
# XX is a short code for your plugin, ex: ww for Weather Wunderground
# You can use translations provided in the language folders functions.sh
source ./gpio

pin=$pg_it_pin
delay=$time

gpio mode $pin out
    

function pg_it_send()
{
    adresse=$1
    unit=$2
    status=$3
    
    start_send
    send_adresse $adresse
    send_bit "0" #Send to disable group action
    send_bit $status #Send the status if th light [on|off]
    send_unit $unit
    stop_send
}

function start_send()
{
    gpio write $pin 1
    sleep $delay
    gpio write $pin 0
    sleep $((delay*10+delay/2))
}

function send_adresse()
{
    for i in {25..0}
    do
        send_bit $(((adresse >> i) & 1))
        sleep $delay
    done
}

function send_unit()
{
    for i in {3..0}
    do
        send_bit $(((unit >> i) & 1))
        sleep $delay
    done
}

function stop_send()
{
    gpio write $pin 1
    sleep $delay
    gpio write $pin 0
    sleep $((delay * 40))
}

function send_bit()
{
    if [ "$1" = "1" ]
    then
        gpio write $pin 1
        sleep $delay
        gpio write $pin 0
        sleep $((delay * 5))
        gpio write $pin 1
        sleep $delay
        gpio write $pin 0
        sleep $delay
    elif [ "$1" = "0" ]
        gpio write $pin 1
        sleep $delay
        gpio write $pin 0
        sleep $delay
        gpio write $pin 1
        sleep $delay
        gpio write $pin 0
        sleep $((delay * 5))
    else
        jv_error "Wrong bit send"
        jv_exit
    fi
}
