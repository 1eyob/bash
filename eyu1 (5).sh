#!/bin/bash

echo  "1.change ownership"
echo  "2.hide my file/folder with specific directory"
echo "3.unhide my file/folder with specific directory"
echo "4.ecrypt/Decrypt file/folder"

read p
case $p in
1)
echo "<<<list of usernames>>>"
cat /etc/passwd| grep '/home' |cut -d: -f1
echo "<<enter username>>"
read n
echo "<<enter groupname>> "
read g

echo "<<give a directory please?   starting like /home/rootuser/...>> "
read direct

echo 
 sudo chown -H $n:$g  "$direct"  
echo "<<do u want to change the mode Y/N?>>"
read ch
if [ $ch == 'y' ] || [ $ch == 'Y' ]
then
echo "<<what do u want to change the modes>>"
 echo "1.user"
  echo  "2.group"
   echo "3.others"
   read mo
   case $mo in
   1) 
echo "1.to give r/w/x permission for the user $n"
echo "2.to give -/w/x permission for the user $n"
echo "3.to give -/-/x permission for the user $n"
echo "4.to give r/-/- permission for the user $n"
echo "5.to give -/w/- permission for the user $n"
echo "6.to give r/w/- permissio for the user  $n"
echo "7.to give r/-/x permissio for the user  $n"
read n1
  if [ $n1 == 1 ]
    then
    sudo chmod 711 $direct
    echo "changed mode to r/w/x of user $n"
  elif [ $n1 == 2 ]
    then 
    sudo chmod 311 $direct
    echo "changed mode to -/w/x of user $n"
   elif [ $n1 == 3 ]
    then
    sudo chmod 111 $direct
    echo "changed mode to -/-/x of user $n"
   elif [ $n1 == 4 ]
     then 
      sudo chmod 411 $direct
       echo "changed mode to r/-/ of user $n"
   elif [ $n1 == 5 ]
       then 
       sudo chmod 211 $direct
        echo "changed mode to -/w/- of user $n"
     elif [ $n1 == 6 ]
        then 
        sudo chmod 611 $direct
        echo "changed mode to r/w/- of user $n"
     elif [ $n == 7]
        then 
        sudo chmod 511 $direct   
          echo "changed mode to r/w/- of user $n"
       else
       echo "<<please enter correct choice>>"
  fi;;
 2) echo "<<list of groups associated in $n user>> "
     groups $n
     echo "1.to give r/w/x permission for the group"
echo "2.to give -/w/x permission for the groups "
echo "3.to give -/-/x permission for the groups "
echo "4.to give r/-/- permission for the groups "
echo "5.to give -/w/- permission for the groups "
echo "6.to give r/w/- permissio for the groups  "
echo "7.to give r/-/x permissio for the groups "
read n2
if [ $n2 == 1 ]
    then
    sudo chmod 171 $direct
    echo "changed mode to r/w/x of groups"
  elif [ $n2 == 2 ]
    then 
    sudo chmod 131 $direct
    echo "changed mode to -/w/x of groups"
   elif [ $n2 == 3 ]
    then
    sudo chmod 111 $direct
    echo "changed mode to -/-/x of groups"
   elif [ $n2 == 4 ]
     then 
      sudo chmod 141 $direct
       echo "changed mode to r/-/- of groups"
          elif [ $n2 == 5 ]
       then 
       sudo chmod 121 $direct
        echo "changed mode to -/w/- of groups"
     elif [ $n2 == 6 ]
        then 
        sudo chmod 161 $direct
        echo "changed mode to r/w/- of groups"
     elif [ $n2 == 7]
        then 
        sudo chmod 151 $direct   
          echo "changed mode to r/-/x of groups"
       else
       echo "<<please enter correct choice>>"
  fi;;
3) echo "1.to give r/w/x permission for the others"
echo "2.to give -/w/x permission for the others "
echo "3.to give -/-/x permission for the others "
echo "4.to give r/-/- permission for the others "
echo "5.to give -/w/- permission for the others "
echo "6.to give r/w/- permissio for the others "
echo "7.to give r/-/x permissio for the others "
read n3
if [ $n3 == 1 ]
    then
    sudo chmod 117 $direct
    echo "changed mode to r/w/x of groups"
  elif [ $n3 == 2 ]
    then 
    sudo chmod 113 $direct
    echo "changed mode to -/w/x of others"
   elif [ $n3 == 3 ]
    then
    sudo chmod 111 $direct
    echo "changed mode to -/-/x of others"
   elif [ $n3 == 4 ]
     then 
      sudo chmod 114 $direct
       echo "changed mode to r/-/- of others"
          elif [ $n3 == 5 ]
       then 
       sudo chmod 112 $direct
        echo "changed mode to -/w/- of others"
     elif [ $n3 == 6 ]
        then 
        sudo chmod 116 $direct
        echo "changed mode to r/w/- of others"
     elif [ $n3 == 7]
        then 
        sudo chmod 115 $direct   
          echo "changed mode to r/-/x of others"
       else
       echo "<<please enter correct choice>>"
  fi;;
  esac
  else 
   echo "<<good bye bro>>"
   
 
fi;;
2)
echo "<<give a directory of file/folder please?   starting like /home/rootuser/...>> "
read dirr
echo "<<files/folders in the $dirr>>" 
ls $dirr
echo "do u wanna to hide th file/folder in the same directory Y\N? above"
read hch
if [ $hch == 'y' ] || [ $hch == 'Y' ]
then


echo "write afile/floder u want to hide if there is a file/folder"
read pt

for i in $dirr
do
mv "${dirr}${pt}"  "${dirr}.${pt}"
done
elif [ $hch == 'n' ] || [ $hch == 'N' ]
then
echo "enter  a new existing Directory please "
read hdir
echo "write afile/floder u want to hide if there is a file/folder"
read pt
for i in $dirr
do
mv "${dirr}${pt}"  "${hdir}.${pt}"
done
fi;;
3)
echo "<<give a directory of file/folder please?   starting like /home/rootuser/...>> "
read dirr1
echo "<<lists of hidden file in in the $dirr1"
ls -a  $dirr1
echo "do want to unhide the file/folder in the same directory above? Y/N"
read unch
if [ $unch == 'y' ] || [ $unch == 'y' ]
then

echo "write a file/folder u want to unhide if there is hidden file"
read pt1

for i in $dirr1
do 
mv "$dirr1.$pt1"  "$dirr1$pt1"
done
elif [ $unch == 'n' ] || [ $unch == 'N' ]
then
echo "enter a new exixting directory please?"
read undir
echo "write a file/folder u want to unhide if there is hidden file"
read pt1

for i in $dirr1
do 
mv "$dirr1.$pt1"  "$undir$pt1"
done
fi;;
4)

esac
