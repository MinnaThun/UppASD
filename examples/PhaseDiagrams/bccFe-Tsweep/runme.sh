#! /bin/bash 
for Temp in 100 200
do
    mkdir T$Temp/ 2>/dev/null
    echo "Temp: " $Temp
    cp Base/* T$Temp/
    cd T$Temp/
    sed -i "s/TEMP/$Temp/g" inpsd.dat
    if [ $Temp -ne 100 ]
    then
	sed -i "s/#restart/restart/" inpsd.dat 
	cp ../restart.bccFe100.out .
    fi
    ../../../../source/sd > out.log
    cp restart.bccFe100.out ../
    cd ..
done
exit
