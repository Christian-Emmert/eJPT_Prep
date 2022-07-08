#!/bin/bash

RED='\033[0;31m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'
NC='\033[0m'

target=
smb_username=""
smb_password=""
smb_creds=""
choice_creds=0
trigger_nmap_args=0

read -p "please enter the target via IP or Domain: " target

while [[ $choice_creds -ne 1 ]]; do
  read -p "do you have any sort of credentials for smb? (Yes or No) : " smb_creds
  case $smb_creds in
    Yes)
      trigger_nmap_args=1
      choice_creds=1
    ;;
    No)
      trigger_nmap_args=0
      choice_creds=1
    ;;
    *)
      echo "Invalid Input ... try again with Yes or No"
      choice_creds=0
    ;;
  esac
done

if [[ $trigger_nmap_args -eq 1 ]]; then
  read -p "Username for smb?: " smb_username
  read -p "Password for smb?: " smb_password
fi

###
# clean targetdir and create fresh files
###

rm -rf $target;
mkdir -p $target;

###
# nmap OS enumeration
###

touch $target/smb_enum.txt
printf "${GREEN}nmap OS enumeration:${NC}\n"                                                                                    >> $target/smb_enum.txt
echo ""                                                                                                                         >> $target/smb_enum.txt
echo "nmap OS enumeration ..."
nmap -Pn -O $target                                                                                                             >> $target/smb_enum.txt
echo ""                                                                                                                         >> $target/smb_enum.txt

###
# smb-protocols
###

printf "${GREEN}nmap smb-protocols:${NC}\n"                                                                                     >> $target/smb_enum.txt
echo ""                                                                                                                         >> $target/smb_enum.txt
echo "nmap smb-protocols ..."
if [[ $trigger_nmap_args -eq 0 ]]; then
  nmap -p 445 -Pn --script smb-protocols $target                                                                                >> $target/smb_enum.txt
else
  nmap -p 445 -Pn --script smb-protocols --script-args smbusername=$smb_username,smbpassword=$smb_password $target              >> $target/smb_enum.txt
fi
echo ""                                                                                                                         >> $target/smb_enum.txt

###
# smb-security-mode
###

printf "${GREEN}nmap smb-security-mode:${NC}\n"                                                                                 >> $target/smb_enum.txt
echo ""                                                                                                                         >> $target/smb_enum.txt
echo "nmap smb-security-mode ..."
if [[ $trigger_nmap_args -eq 0 ]]; then
  nmap -p 445 -Pn --script smb-security-mode $target                                                                            >> $target/smb_enum.txt
else
  nmap -p 445 -Pn --script smb-security-mode --script-args smbusername=$smb_username,smbpassword=$smb_password $target          >> $target/smb_enum.txt
fi
echo ""                                                                                                                         >> $target/smb_enum.txt

###
# smb-enum-sessions
###

printf "${GREEN}nmap smb-enum-sessions:${NC}\n"                                                                                 >> $target/smb_enum.txt
echo ""                                                                                                                         >> $target/smb_enum.txt
echo "nmap smb-enum-sessions ..."
if [[ $trigger_nmap_args -eq 0 ]]; then
  nmap -p 445 -Pn --script smb-enum-sessions $target                                                                            >> $target/smb_enum.txt
else
  nmap -p 445 -Pn --script smb-enum-sessions --script-args smbusername=$smb_username,smbpassword=$smb_password $target          >> $target/smb_enum.txt
fi
echo ""                                                                                                                         >> $target/smb_enum.txt

###
# smb-enum-shares
###

printf "${GREEN}nmap smb-enum-shares:${NC}\n"                                                                                   >> $target/smb_enum.txt
echo ""                                                                                                                         >> $target/smb_enum.txt
echo "nmap smb-enum-shares ..."
if [[ $trigger_nmap_args -eq 0 ]]; then
  nmap -p 445 -Pn --script=smb-enum-shares $target                                                                              >> $target/smb_enum.txt
else
  nmap -p 445 -Pn --script=smb-enum-shares --script-args smbusername=$smb_username,smbpassword=$smb_password $target            >> $target/smb_enum.txt
fi
echo ""                                                                                                                         >> $target/smb_enum.txt

###
# smb-enum-users
###

printf "${GREEN}nmap smb-enum-users:${NC}\n"                                                                                    >> $target/smb_enum.txt
echo ""                                                                                                                         >> $target/smb_enum.txt
echo "nmap smb-enum-users ..."
if [[ $trigger_nmap_args -eq 0 ]]; then
  nmap -p 445 -Pn --script smb-enum-users $target                                                                               >> $target/smb_enum.txt
else
  nmap -p 445 -Pn --script smb-enum-users --script-args smbusername=$smb_username,smbpassword=$smb_password $target             >> $target/smb_enum.txt
fi
echo ""                                                                                                                         >> $target/smb_enum.txt

###
# smb-server-stats
###

printf "${GREEN}nmap smb-server-stats:${NC}\n"                                                                                  >> $target/smb_enum.txt
echo ""                                                                                                                         >> $target/smb_enum.txt
echo "nmap smb-server-stats ..."
if [[ $trigger_nmap_args -eq 0 ]]; then
  nmap -p 445 -Pn --script smb-server-stats $target                                                                             >> $target/smb_enum.txt
else
  nmap -p 445 -Pn --script smb-server-stats --script-args smbusername=$smb_username,smbpassword=$smb_password $target           >> $target/smb_enum.txt
fi
echo ""                                                                                                                         >> $target/smb_enum.txt

###
# smb-enum-domains
###

printf "${GREEN}nmap smb-enum-domains:${NC}\n"                                                                                  >> $target/smb_enum.txt
echo ""                                                                                                                         >> $target/smb_enum.txt
echo "nmap smb-enum-domains ..."
if [[ $trigger_nmap_args -eq 0 ]]; then
  nmap -p 445 -Pn --script smb-enum-domains $target                                                                             >> $target/smb_enum.txt
else
  nmap -p 445 -Pn --script smb-enum-domains --script-args smbusername=$smb_username,smbpassword=$smb_password $target           >> $target/smb_enum.txt
fi
echo ""                                                                                                                         >> $target/smb_enum.txt

###
# smb-enum-groups
###

printf "${GREEN}nmap smb-enum-groups:${NC}\n"                                                                                   >> $target/smb_enum.txt
echo ""                                                                                                                         >> $target/smb_enum.txt
echo "nmap smb-enum-groups ..."
if [[ $trigger_nmap_args -eq 0 ]]; then
  nmap -p 445 -Pn --script smb-enum-groups $target                                                                              >> $target/smb_enum.txt
else
  nmap -p 445 -Pn --script smb-enum-groups --script-args smbusername=$smb_username,smbpassword=$smb_password $target            >> $target/smb_enum.txt
fi
echo ""                                                                                                                         >> $target/smb_enum.txt

###
# smb-enum-services
###

printf "${GREEN}nmap smb-enum-services:${NC}\n"                                                                                 >> $target/smb_enum.txt
echo ""                                                                                                                         >> $target/smb_enum.txt
echo "nmap smb-enum-services ..."
if [[ $trigger_nmap_args -eq 0 ]]; then
  nmap -p 445 -Pn --script smb-enum-services $target                                                                            >> $target/smb_enum.txt
else
  nmap -p 445 -Pn --script smb-enum-services --script-args smbusername=$smb_username,smbpassword=$smb_password $target          >> $target/smb_enum.txt
fi
echo ""                                                                                                                         >> $target/smb_enum.txt

###
# smb-enum-shares,smb-ls
###

printf "${GREEN}nmap smb-enum-shares,smb-ls:${NC}\n"                                                                            >> $target/smb_enum.txt
echo ""                                                                                                                         >> $target/smb_enum.txt
echo "nmap smb-enum-shares,smb-ls ..."
if [[ $trigger_nmap_args -eq 0 ]]; then
  nmap -p 445 -Pn --script smb-enum-shares,smb-ls $target                                                                       >> $target/smb_enum.txt
else
  nmap -p 445 -Pn --script smb-enum-shares,smb-ls --script-args smbusername=$smb_username,smbpassword=$smb_password $target     >> $target/smb_enum.txt
fi
echo ""                                                                                                                         >> $target/smb_enum.txt

###
# enum4linux
###

printf "${GREEN}enum4linux enumeration:${NC}\n"                                                                                 >> $target/smb_enum.txt
echo ""                                                                                                                         >> $target/smb_enum.txt
echo "enum4linux enumeration ..."
if [[ $trigger_nmap_args -eq 0 ]]; then
  enum4linux -a $target                                                                                                         >> $target/smb_enum.txt 2>/dev/null
else
  enum4linux -a -u $smb_username -p $smb_password $target                                                                       >> $target/smb_enum.txt 2>/dev/null
fi
echo ""                                                                                                                         >> $target/smb_enum.txt
