#!/bin/bash

#TARGET function
function target(){
    
echo "Open ports: "
ss -nlt | awk 'NR>1{print$4}' | awk -F : '{print$2}' | uniq
}

#ALL function
function all(){

echo "Name of host and IP addresses :"
echo '     IP          Hostname'
       for  i in  $( ip n |awk '{print$1}')
do
echo "$i    $(host $i|awk -F pointer '{print$2}')   $(host $i|awk -F : '{print$2}')"
done
}

#NO keys
function other(){

echo  << EOF ' Please use keys:
 --all       displays the IP addresses and symbolic names of all hosts in the current subnet
 --target    displays a list of open system TCP ports'
EOF
}

#-----------MAIN SCRIPT----------------#

case $1 in
#target case
--target) target
;;
#IP case
--all)all
 ;;
#other  parameters
*)other
;;

esac