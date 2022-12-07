# Linux Bash
   
### A. Create a script that uses the following keys:
1. When starting without parameters, it will display a list of possible keys and their description.
2. The --all key displays the IP addresses and symbolic names of all hosts in the current subnet
3. The --target key displays a list of open system TCP ports.
The code that performs the functionality of each of the subtasks must be placed in a separate function

[Linc for cript](https://github.com/ArturMaksymchuk/EPAM_Autumn2022/blob/master/LinuxBash/a.sh)

<details>
  <summary>Code of script</summary>
  
  ```bash
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
  ```
  
</details>

<details>
  <summary>Screens</summary>
  
![](https://github.com/ArturMaksymchuk/EPAM_Autumn2022/blob/master/LinuxBash/screens/a1.png)
  
</details>

### B. Using Apache log example create a script to answer the following questions:
1. From which ip were the most requests?
2. What is the most requested page?
3. How many requests were there from each ip?
4. What non-existent pages were clients referred to? 
5. What time did site get the most requests?
6. What search bots have accessed the site? (UA + IP)

[Linc for cript](https://github.com/ArturMaksymchuk/EPAM_Autumn2022/blob/master/LinuxBash/b.sh)

<details>
  <summary>Code of script</summary>
  
  ```bash
#!/bin/bash

#-------------3---------
function  list_ip(){
echo "Count requests were there from each ip"
cat $1 | awk '{print$1}'|sort -n|uniq -c|sort -n -r
}
#-------------1---------
function most_ip(){
max=$(list_ip $1 |awk 'NR==2{print$1}')
maxip=$(list_ip $1 |awk 'NR==2{print$1}')

echo " The most requested IP: $maxip with $max requests "
}
#--------2---------
function count_pages(){
awk '{print$7}' $1 |sort -n |uniq -c |sort -n -r
}
function most_page(){
max=$(count_pages $1 |awk 'NR==1{print$1}')
maxp=$(count_pages $1 |awk 'NR==1{print$2}')
echo " The most requested page with $max requests is "
echo $maxp
}
#----------4----------
function nonpages(){
echo  "There are non-existent pages were clients referred to:"
echo " "
awk '($9=="404" ) {print$7}' $1 |sort -n |uniq |sort -n -r
}
#---------5---------
function timelist(){
cat $1 | awk '{print$4}'|awk -F: '{print$2}' |sort -n| uniq -c|sort -n -r
}
function mtime(){
max=$(timelist $1 |awk 'NR==1{print$1}')
maxtime=$(timelist $1 |awk 'NR==1{print$2}')
echo " The most requested time: $maxtime hour with $max requests "
}

#-----------6-----------
function acc_site(){
echo  "There are UA what have accessed the site:"
awk ' {print$12}' $1 |sort -n |uniq| sed  's/"//g'
}

#--------other-----------

#NO keys
function other(){

echo  << EOF ' 
Usage: b.sh [OPTION]... [FILE]...
option and pats to file is mandatory
[OPTION] :
--1 show most requests IP
--2 show the most requested page
--3 count requests from each IP 
--4 non-existent pages were clients referred to 
--5 What time did site get the most requests?
--6 (UA + IP) have accessed the site
--all       displays all previos keys'
 
EOF
}

#-----------MAIN SCRIPT----------------#

case $1 in
#target case
--1) most_ip $2
;;
--2) most_page $2
;;
--3) list_ip $2
;;
--4) nonpages $2
;;
--5) mtime $2
;;
--6) acc_site $2
;;
#IP case
--all)
most_ip $2
most_page $2
list_ip $2
nonpages $2
mtime $2
acc_site $2
 ;;
#other  parameters
*)other
;;

esac

  ```
  
</details>

<details>
  <summary>Screens</summary>
  
![](https://github.com/ArturMaksymchuk/EPAM_Autumn2022/blob/master/LinuxBash/screens/b1.png)
  
</details>

### C. Create a data backup script that takes the following data as parameters:
1. Path to the syncing directory.
2. The path to the directory where the copies of the files will be stored.
In case of adding new or deleting old files, the script must add a corresponding entry to the log file indicating the time, type of operation and file name. [The command to run the script must be added to crontab with a run frequency of one minute]

[Linc for cript](https://github.com/ArturMaksymchuk/EPAM_Autumn2022/blob/master/LinuxBash/c.sh)


<details>
  <summary>Code of script</summary>
  
  ```bash
  #!/bin/bash

dir1=$1
dir2=$2
function rmold(){
for i in $(diff $1 $2  |awk -v var="$2:" '(var==$3) {print $4}')
do
if [ -f $2/$i  ] ; then
  if [ $i != "backup.log" ] ; then
rm  -f $2/$i
echo "[ $(date) ] delete file $i"  >> $2/backup.log
   fi
elif [ -d $2/$i ] ; then
rm  -r $2/$i
echo "[ $(date) ] delete directory $i"  >>  $2/backup.log
fi
done
}

function copynew(){
for i in $(diff $1 $2  |awk -v var="$1:" '(var==$3) {print $4}')
do
if [ -f $1/$i ] ; then
cp $1/$i $2
echo "[ $(date) ] create file $i"  >> $2/backup.log
elif  [ -d $1/$i ] ; then
cp -r $1/$i $2
echo "[ $(date) ] create directory $i"   >> $2/backup.log
fi
done
}

copynew $dir1 $dir2
rmold $dir1 $dir2

  ```
  
</details>



<details>
  <summary>Screens</summary>
  
![](https://github.com/ArturMaksymchuk/EPAM_Autumn2022/blob/master/LinuxBash/screens/c1.png)
  
</details>
