#!/bin/bash
echo "Welcome Port and host monitoring script"
read -p "Please insert HOST IP:" HOST
read -p "Please insert HOST PORT:" PORT
read -p "Please insert LocalHost Interface:" INT
tcpdump -vv -nn "host $HOST and port $PORT" -i $INT
if [ $? -ne "0" ]; then
yum -y install $RPM && tcpdump -vv -nn "host $HOST and port $PORT" -i $INT
fi
