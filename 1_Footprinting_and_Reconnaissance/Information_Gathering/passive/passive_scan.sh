#!/bin/bash

RED='\033[0;31m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'
NC='\033[0m'

target=
default_out_dir= ## todo

read -p "please specify the target via IP or Domain: " target

###
# clean targetdir and create fresh files
###

rm -rf $target;
mkdir -p $target;

###
# host lookup
###
touch $target/passive_enum.txt
printf "${GREEN}host enumeration:${NC}\n" 						>> $target/passive_enum.txt
echo ""											>> $target/passive_enum.txt
echo "host lookup ..."
host $target 										>> $target/passive_enum.txt
echo "" 										>> $target/passive_enum.txt

#
###
# whois lookup
###

printf "${GREEN}whois enumeration:${NC}\n" 						>> $target/passive_enum.txt
echo ""											>> $target/passive_enum.txt
echo "whois lookup ..."
whois $target 										>> $target/passive_enum.txt
echo "" 										>> $target/passive_enum.txt

###
# netcraft lookup
###

echo "Starting Netcraft lookup ..."
firefox https://sitereport.netcraft.com &

###
# dnsrecon lookup
###

printf "${GREEN}dnsrecon enumeration:${NC}\n" 						>> $target/passive_enum.txt
echo ""											>> $target/passive_enum.txt
echo "dnsrecon lookup ..."
dnsrecon -d $target									>> $target/passive_enum.txt
echo "" 										>> $target/passive_enum.txt

###
# dnsdumpster lookup
###

echo "Starting DNSdumpster lookup ..."
firefox https://dnsdumpster.com &

###
# wafw00f WAF lookup
###

printf "${GREEN}wafw00f enumeration:${NC}\n" 						>> $target/passive_enum.txt
echo ""											>> $target/passive_enum.txt
echo "wafw00f lookup ..."
wafw00f $target										>> $target/passive_enum.txt
echo "" 										>> $target/passive_enum.txt

###
# sublist3r lookup
###

printf "${GREEN}sublist3r enumeration:${NC}\n" 						>> $target/passive_enum.txt
echo ""											>> $target/passive_enum.txt
echo "sublist3r lookup ..."
sublist3r -d $target									>> $target/passive_enum.txt
echo ""											>> $target/passive_enum.txt

###
# Google Dorking lookup
###

echo "Starting Google Dorking lookup ..."
firefox https://www.exploit-db.com/google-hacking-database &

###
# theHarvester lookup
###


printf "${GREEN}theHarvester enumeration:${NC}\n" 					>> $target/passive_enum.txt
echo ""											>> $target/passive_enum.txt
echo "theHarvester lookup ..."
theHarvester -d $target -b anubis,baidu,bing,bingapi,bufferoverun,certspotter,crtsh,dnsdumpster,duckduckgo,hackertarget,linkedin,linkedin_links,n45ht,omnisint,otx,qwant,rapiddns,sublist3r,threatcrowd,threatminer,trello,twitter,urlscan,virustotal,yahoo	>> $target/passive_enum.txt
#theHarvester -d $target -b binaryedge							>> $target/passive_enum.txt
#theHarvester -d $target -b fullhunt							>> $target/passive_enum.txt
#theHarvester -d $target -b github-code							>> $target/passive_enum.txt
#theHarvester -d $target -b hunter							>> $target/passive_enum.txt
#theHarvester -d $target -b intelx							>> $target/passive_enum.txt
#theHarvester -d $target -b pentesttools						>> $target/passive_enum.txt
#theHarvester -d $target -b projecdiscovery						>> $target/passive_enum.txt
#theHarvester -d $target -b rocketreach							>> $target/passive_enum.txt
#theHarvester -d $target -b securityTrails						>> $target/passive_enum.txt
#theHarvester -d $target -b shodan							>> $target/passive_enum.txt
#theHarvester -d $target -b spyse							>> $target/passive_enum.txt
#theHarvester -d $target -b vhost							>> $target/passive_enum.txt
#theHarvester -d $target -b zoomeye							>> $target/passive_enum.txt
echo ""											>> $target/passive_enum.txt


