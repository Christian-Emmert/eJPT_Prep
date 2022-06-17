#!/bin/bash

RED='\033[0;31m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'
NC='\033[0m'

target=
target_port=
default_out_dir= ## todo
use_creds= ## todo
smb_username= ## todo
smb_password= ## todo

read -p "please enter the target via IP or Domain: " target

read -p "what port is smb running on? (default 445): " target_port

###
# clean targetdir and create fresh files
###

rm -rf $target;
mkdir -p $target;

###
# smb-protocols
###

touch $target/passive_enum.txt
printf "${GREEN}nmap smb-protocols:${NC}\n" 						>> $target/passive_enum.txt
echo ""											>> $target/passive_enum.txt
echo "nmap smb-protocols ..."
nmap -p $target_port --script=smb-protocols $target					>> $target/passive_enum.txt
echo ""                                                                                 >> $target/passive_enum.txt

###
# smb-security-mode
###

printf "${GREEN}nmap smb-security-mode:${NC}\n"                                         >> $target/passive_enum.txt
echo ""                                                                                 >> $target/passive_enum.txt
echo "nmap smb-security-mode ..."
nmap -p $target_port --script=smb-security-mode $target                                 >> $target/passive_enum.txt
echo ""                                                                                 >> $target/passive_enum.txt

###
# smb-enum-shares
###

printf "${GREEN}nmap smb-enum-shares:${NC}\n"                                           >> $target/passive_enum.txt
echo ""                                                                                 >> $target/passive_enum.txt
echo "nmap smb-enum-shares ..."
nmap -p $target_port --script=smb-enum-shares $target                                   >> $target/passive_enum.txt
echo ""                                                                                 >> $target/passive_enum.txt

###
# smb-enum-users
###

printf "${GREEN}nmap smb-enum-users:${NC}\n"                                            >> $target/passive_enum.txt
echo ""                                                                                 >> $target/passive_enum.txt
echo "nmap smb-enum-users ..."
nmap -p $target_port --script=smb-enum-users $target                                    >> $target/passive_enum.txt
echo ""                                                                                 >> $target/passive_enum.txt

###
# smb-server-stats
###

printf "${GREEN}nmap smb-server-stats:${NC}\n"                                          >> $target/passive_enum.txt
echo ""                                                                                 >> $target/passive_enum.txt
echo "nmap smb-server-stats ..."
nmap -p $target_port --script=smb-server-stats $target                                  >> $target/passive_enum.txt
echo ""                                                                                 >> $target/passive_enum.txt

###
# smb-enum-domains
###

printf "${GREEN}nmap smb-enum-domains:${NC}\n"                                          >> $target/passive_enum.txt
echo ""                                                                                 >> $target/passive_enum.txt
echo "nmap smb-enum-domains ..."
nmap -p $target_port --script=smb-enum-domains $target                                  >> $target/passive_enum.txt
echo ""                                                                                 >> $target/passive_enum.txt

###
# smb-enum-groups
###

printf "${GREEN}nmap smb-enum-groups:${NC}\n"                                           >> $target/passive_enum.txt
echo ""                                                                                 >> $target/passive_enum.txt
echo "nmap smb-enum-groups ..."
nmap -p $target_port --script=smb-enum-groups $target                                   >> $target/passive_enum.txt
echo ""                                                                                 >> $target/passive_enum.txt

###
# smb-enum-shares,smb-ls
###

printf "${GREEN}nmap smb-enum-shares,smb-ls:${NC}\n"                                    >> $target/passive_enum.txt
echo ""                                                                                 >> $target/passive_enum.txt
echo "nmap smb-enum-shares,smb-ls ..."
nmap -p $target_port --script=smb-enum-shares,smb-ls $target                            >> $target/passive_enum.txt
echo ""                                                                                 >> $target/passive_enum.txt
