#!/bin/bash
#ping host ip
for hostip in {2..50};
do
ip="10.76.197.$hostip"
ping -c 1 -W 2 $ip &> /dev/null
if [ "$?" == "0" ];then
echo $ip is UP
else
echo $ip is DOWN

fi
done
