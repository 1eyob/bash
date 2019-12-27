#!/bin/bash
#file=~/Desktop/eyu.sh
echo  "1.chane owner"
echo  "2.change"
read p
case $p in
1)
cat /etc/passwd| grep '/home' |cut -d: -f1
echo "enter username"
read n
echo "give a directory please? "
read direct
cd $direct
ls -lh
echo "enter file or floder name"
read fil

{ sudo chown $n:$n $fil; } && { echo "The file is now permissioned to user $n"; }
echo "do u want to change the mode Y/N?"
read ch
if [ $ch == 'y' ] || [ $ch == 'Y' ]
then
echo "1.to give r/w/x permission for the user $n"
echo "2.to give -/w/x permission for the user $n"
echo "3.to give -/-/x permission for the user $n"
echo "4.to give r/-/- permission for the user $n"
echo "5.to give -/w/- permission for the user $n"
echo "6.to give r/w/- permissio for the user $n"
echo "7.to give r/-/x permissio for the user $n"
read n1
  if [ $n1 == 1 ]
    then
    sudo chmod 711 $fil
    echo "changed mode to r/w/x of user $n"
  elif [ $n1 == 2 ]
    then 
    sudo chmod 311 $fil
    echo "changed mode to -/w/x of user $n"
   elif [ $n1 == 3 ]
    then
    sudo chmod 111 $fil
    echo "changed mode to -/-/x of user $n"
   elif [ $n1 == 4 ]
     then 
      sudo chmod 411 $fil
       echo "changed mode to r/-/ of user $n"
   elif [ $n1 == 5 ]
       then 
       sudo chmod 211 $fil
        echo "changed mode to -/w/- of user $n"
     elif [ $n1 == 6 ]
        then 
        sudo chmod 611 $fil
        echo "changed mode to r/w/- of user $n"
     elif [ $n == 7]
        then 
        sudo chmod 511 $fil   
          echo "changed mode to r/w/- of user $n"
       else
       echo "please enter correct choice"
  fi
   else 
   echo "good bye bro"
 #else
 #echo "good bye!!"

fi;;
esac

#then echo "The file exists"
#{ sudo chown eyobed:eyobed $file; } && { echo "The #file is now permissioned to user eyobed"; }

#elif [ ! -e $file ]
#then echo "The file does NOT exist"

#fi
