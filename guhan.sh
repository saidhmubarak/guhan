#!/bin/bash

usage() {
	echo -e "\n"
	echo "usage : ./gdork.sh -d,--dork <dork> -e,--engine <engine>"
}

curl_life() {
	curl -L -sSA "Mozilla/5.0" "https://www.google.com/search?q=$dork&num=100" > dorks.txt
	cat -v dorks.txt | html2text -o text.txt
}

regex() {

	reg='[w]{3}\.[[:alnum:]]*\.[[:alpha:]]{3}'
	while read line; do
		if [[ $line =~ $reg ]]; then
			echo [+] $line | sed 's/_M-bM-^@M-:_/\//g' | sed 's/_M-bM-^@M-://g'
			sleep 0.5
		fi
	done < text.txt

}
clear
cat guhan2.txt
dork=
engine=
if [[ ( -z $1 ) || ( $1 =~ "-h" || $1 =~ "--help") ]]; then
	usage
fi
if [[ ($1 =~ "-d" || $1 =~ "--dork") && ($3 =~ "-e" || $3 =~ "--engine") ]]; then
	dork=$2
	engine=$4
	curl_life
	echo -e "\n"
	regex
	echo -e "\033[1;31m[!] Heil Guhan...\033[0m"
fi
exit
