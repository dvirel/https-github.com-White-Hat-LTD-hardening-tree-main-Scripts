
#!/bin/bash

GREEN=$'\e[0;32m'
RED=$'\e[0;31m'
NC=$'\e[0m'

echo "Check DB.Version:"
echo "___________________________________________________________________________________________________________________"
result=$( mongo --eval "db.verstion()"| grep "MongoDB shell" )
echo -e $result
echo -e "\e[5m${GREEN}The Most Updated Version is ------------> v3.6.8\e[5m${NC}"

echo "___________________________________________________________________________________________________________________"

echo "Check If Authorization Is Enabled On The MongoDB Server:"
auth1=$(cat /etc/mongodb.conf | grep -i " authorization: enabled")
if [ -z "$auth1" ] ;
then
  echo -e "The Mongo Server Authorization is NOT enabled ----------------------- > ${RED}\e[5m***Not Secure!***\e[5m${NC}"
else
  echo -e "The Mongo Server Authorization is enabled --------------------------- > ${GREEN}\e[5m***Secure!***\e[5m${NC}"

fi

echo "___________________________________________________________________________________________________________________"

echo "Check If The MongoDB Set To ByPass Authentication Via The Local-Host Exception:"
bypass1=$(cat /etc/mongodb.conf | grep -i  " enableLocalhostAuthBypass: false")

if [ -z "$bypass1" ] ;
then
  echo -e "The MongoDB ByPass Authentication Via The Local-Host Exception is true ----------------------- > ${RED}\e[5m***Not Secure!***\e[5m${NC}"
else
  echo -e "The MongoDB ByPass Authentication Via The Local-Host Exception is false --------------------------- > ${GREEN}\e[5m***Secure!***\e[5m${NC}"

fi

echo "___________________________________________________________________________________________________________________"

echo "Verify If The Certificate-Based Authentication Is Configured:"
pemkey1=$(cat /etc/mongodb.conf | grep -i  " PEMKeyFile: /etc/mongodb/ssl/server1.pem")

if [ -z "$pemkey1" ] ;
then
  echo -e "The MongoDB Certificate-Based Authentication Is ----------------------- > ${RED}\e[5m***Not Secure!***\e[5m${NC}"
else
  echo -e "The MongoDB Certificate-Based Authentication Is --------------------------- > ${GREEN}\e[5m***Secure!***\e[5m${NC}"

fi

echo "___________________________________________________________________________________________________________________"

echo "Verify If The CAFile Is Configured:"
CAFile=$(cat /etc/mongodb.conf | grep -i  " CAFile")

if [ -z "$CAFile" ] ;
then
  echo -e "The CAFile Is ----------------------- > ${RED}\e[5m***Not Secure!***\e[5m${NC}"
else
  echo -e "The CAFile Is --------------------------- > ${GREEN}\e[5m***Secure!***\e[5m${NC}"

fi

echo "___________________________________________________________________________________________________________________"

echo "Verify If The ClusterFile Is Configured:"
ClusterFile=$(cat /etc/mongodb.conf | grep -i  " ClusterFile")

if [ -z "$ClusterFile" ] ;
then
  echo -e "The ClusterFile Is ----------------------- > ${RED}\e[5m***Not Secure!***\e[5m${NC}"
else
  echo -e "The ClusterFile Is --------------------------- > ${GREEN}\e[5m***Secure!***\e[5m${NC}"
fi

echo "___________________________________________________________________________________________________________________"

echo "Verify If The ClusterAuthMode Is Configured:"
ClusterAuthMode=$(cat /etc/mongodb.conf | grep -i  " clusterAuthMode: x509")

if [ -z "$ClusterAuthMode" ] ;
then
  echo -e "The ClusterAuthMode Is ----------------------- > ${RED}\e[5m***Not Secure!***\e[5m${NC}"
else
  echo -e "The ClusterAuthMode Is --------------------------- > ${GREEN}\e[5m***Secure!***\e[5m${NC}"

fi

echo "___________________________________________________________________________________________________________________"

echo "Verify If The AuthenticationMechanisms Is Configured:"
AuthenticationMechanisms=$(cat /etc/mongodb.conf | grep -i  " AuthenticationMechanisms")

if [ -z "$AuthenticationMechanisms" ] ;
then
  echo -e "The AuthenticationMechanisms Is ----------------------- > ${RED}\e[5m***Not Secure!***\e[5m${NC}"
else
  echo -e "The AuthenticationMechanisms Is --------------------------- > ${GREEN}\e[5m***Secure!***\e[5m${NC}"

fi

echo "___________________________________________________________________________________________________________________"


echo "Verify If The Network Exposure Is Limited:"
Exposure=$(cat /etc/mongodb.conf |grep -i "bind")
if [ -z "$Exposure" ] ;
then
  echo -e "The Network Exposure Is ----------------------- > ${RED}\e[5m***Not Secure!***\e[5m${NC}"
else
  echo -e "The Network Exposure Is --------------------------- > ${GREEN}\e[5m***Secure!***\e[5m${NC}"

fi

echo "___________________________________________________________________________________________________________________"

echo "The IPTABLES Of The Server:"
iptables=$(sudo iptables -L )
echo $iptables

echo "___________________________________________________________________________________________________________________"

echo "Listing Of All Mongo Instances, The PID Number And The PID owner:"
ps1=$(ps -ef | grep -E "mongos|mongod")
echo $ps1

ps2=$(ps -aef | grep -i "mongod")
echo $ps2

echo "___________________________________________________________________________________________________________________"

echo "Check The Encryption of Data Verify If the server requires SSL or TLS:"
SSL=$(cat /etc/mongodb.conf | grep -i "file: /etc/ssl/mongodb.pem")
if [ -z "$SSL" ] ;
then
  echo -e "The Encryption of Data Is ----------------------- > ${RED}\e[5m***TLS!***\e[5m${NC}"
else
  echo -e "The Network Exposure Is --------------------------- > ${GREEN}\e[5m***SSL!***\e[5m${NC}"

fi

echo "___________________________________________________________________________________________________________________"

echo "Verify If FIPSMode Is Activated:"
FTIPS=$(cat /etc/mongodb.conf | grep -i "FIPSMode: true")
if [ -z "$FTIPS" ] ;
then
  echo -e "The FIPSMode Is ----------------------- > ${RED}\e[5m***Not Activte!***\e[5m${NC}"
else
  echo -e "The FIPSMode Is --------------------------- > ${GREEN}\e[5m***Active!***\e[5m${NC}"

fi

echo "___________________________________________________________________________________________________________________"

echo "Verify If The auditLog.destination Value Is Set Correctly:"
auditLog=$(cat /etc/mongodb.conf | grep -i "auditLog.destination")
if [ -z "$auditLog" ] ;
then
  echo -e "The auditLog.destination Value Is ----------------------- > ${RED}\e[5m***Not Secure!***\e[5m${NC}"
else
  echo -e "The auditLog.destination Value Is --------------------------- > ${GREEN}\e[5m***Secure!***\e[5m${NC}"

fi

echo "___________________________________________________________________________________________________________________"

echo "Verify If The auditLogFilter Configured on MongoDB:"
fr=$(cat /etc/mongodb.conf | grep -i "filter")
if [ -z "$fr" ] ;
then
  echo -e "The auditLogFilter Is ----------------------- > ${RED}\e[5m***Not Secure!***\e[5m${NC}"
else
  echo -e "The auditLogFilter Is --------------------------- > ${GREEN}\e[5m***Secure!***\e[5m${NC}"

fi

echo "___________________________________________________________________________________________________________________"

echo "Verify If The SystemLog.quiet Option Is Disabled:"
quiet=$(cat /etc/mongodb.conf |grep -i "quiet")
if [ -z "$quiet" ] ;
then
  echo -e "The SystemLog.quiet Option Is ture ----------------------- > ${RED}\e[5m***Not Secure!***\e[5m${NC}"
else
  echo -e "The SystemLog.quiet Option Is false --------------------------- > ${GREEN}\e[5m***Secure!***\e[5m${NC}"

fi

echo "___________________________________________________________________________________________________________________"

echo "Verify If The New Entries Are Appended To The End Of The Log File:"
logAppend=$(cat /etc/mongodb.conf |grep -r "systemLog.logAppend= true")
if [ -z "$logAppend" ] ;
then
  echo -e "The New Entries Are Appended To The End Of The Log File Is false ----------------------- > ${RED}\e[5m***Not Secure!***\e[5m${NC}"
else
  echo -e "The New Entries Are Appended To The End Of The Log File Is true --------------------------- > ${GREEN}\e[5m***Secure!***\e[5m${NC}"

fi

echo "___________________________________________________________________________________________________________________"

echo "Verify If The MongoDB Uses a Non-Default Port:"
port=$(cat /etc/mongodb.conf |grep -r "port= 27017")
if [ -z "$port" ] ;
then
  echo -e "The MongoDB Uses a Default Port ----------------------- > ${RED}\e[5m***Not Secure!***\e[5m${NC}"
else
  echo -e "The MongoDB Uses a Non-Default Port --------------------------- > ${GREEN}\e[5m***Secure!***\e[5m${NC}"

fi

echo "___________________________________________________________________________________________________________________"

echo "Verify If Server-Side Scripting Is Disabled If Not Needed:"
java=$(cat /etc/mongodb.conf |grep -r "javascriptEnabled: false")
if [ -z "$java" ] ;
then
  echo -e "The Server-Side Scripting Is true ----------------------- > ${RED}\e[5m***Not Secure!***\e[5m${NC}"
else
  echo -e "The Server-Side Scripting Is false --------------------------- > ${GREEN}\e[5m***Secure!***\e[5m${NC}"

fi

echo "___________________________________________________________________________________________________________________"

echo "Verify If The Database File Permissions Are Set Correctly:"
dbpath=$(cat /etc/mongodb.conf| grep -i "dbpath")
if [ -z "$dbpath" ] ;
then
  echo -e "The Database File Permissions Are Set Not Correctly ----------------------- > ${RED}\e[5m***Not Secure!***\e[5m${NC}"
else
  echo -e "The Database File Permissions Are Set Correctly --------------------------- > ${GREEN}\e[5m***Secure!***\e[5m${NC}"

fi

echo "___________________________________________________________________________________________________________________"
