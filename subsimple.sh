#!/usr/bin/env bash

# SubSimple v1.0 (GNU/Linux x86_64).
# Copyright (C) 2021 egrullon <Amix>.
# License GPLv3+: GNU GPL version 3 or later <https://www.gnu.org/licenses/gpl-3.0.html>.
# This program comes with ABSOLUTELY NO WARRANTY.
# This is free software and you are free to change and redistribute it.

# Author: egrullon <Amix>
# Date: 2021-04-08
# egrullon@cystrong.com
# www.cystrong.com
# Description: A simple subdomains of websites enumeration tool.

: '

  █████████             █████      █████████   ███                            ████          
 ███░░░░░███           ░░███      ███░░░░░███ ░░░                            ░░███          
░███    ░░░  █████ ████ ░███████ ░███    ░░░  ████  █████████████   ████████  ░███   ██████ 
░░█████████ ░░███ ░███  ░███░░███░░█████████ ░░███ ░░███░░███░░███ ░░███░░███ ░███  ███░░███
 ░░░░░░░░███ ░███ ░███  ░███ ░███ ░░░░░░░░███ ░███  ░███ ░███ ░███  ░███ ░███ ░███ ░███████ 
 ███    ░███ ░███ ░███  ░███ ░███ ███    ░███ ░███  ░███ ░███ ░███  ░███ ░███ ░███ ░███░░░  
░░█████████  ░░████████ ████████ ░░█████████  █████ █████░███ █████ ░███████  █████░░██████ 
 ░░░░░░░░░    ░░░░░░░░ ░░░░░░░░   ░░░░░░░░░  ░░░░░ ░░░░░ ░░░ ░░░░░  ░███░░░  ░░░░░  ░░░░░░  
                                                                    ░███                    
                                                                    █████                   
                                                                   ░░░░░                   v1.0 


'

set -o errexit

# ANSI Colors

re="\e[0;91m"
wh="\e[0;97m"

if [[ "$1" == "" ]]; then

	echo -e "\n${re}[${wh}*${re}] You need to put a Domain!! ${reset}"
    echo -e "${re}[${wh}*${re}] Usage: bash subsimple.sh cystrong.com\n  ${reset}"

else
	curl -s https://crt.sh/\?q\=%25.$1\&output\=json | jq -r '.[].name_value' | sed 's/\*\.//g' | sort -u

fi
