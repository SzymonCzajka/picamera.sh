#!/bin/bash

#Pin configuration

gpio -g mode 21 out #Buzzer
gpio -g mode 26 up #Button
gpio -g mode 12 pwm #LED

#Waiting for pressing the button

gpio -g pwm 12 800
gpio -g wfi 26 falling

#Taking photo

gpio -g pwm 12 0
gpio -g write 21 0

raspistill -t 200 -n -o 'picture-%d.jpg' -dt

gpio -g write 21 1
