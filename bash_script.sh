#!/bin/bash
cd "C:\Program Files\mosquitto"
./mosquitto_pub.exe -h "test.mosquitto.org" -t "esp32/test" -m "Start of Script" # Start Script Publish Message

# Generate Random Number continuosly and publish associated color
RANDOM=$$
while true; do
    S=$(($RANDOM%30)) # Generate Random Numbers up to 30
    echo $S
    sleep 0.1m # 0.1 minute time delay
    if ((S < 10));
    then
        echo "BLUE"
        ./mosquitto_pub.exe -h "test.mosquitto.org" -t "esp32/test" -m "BLUE"   # 0-10 range is Blue, then publish
    elif ((S > 10)) && ((S < 21));
    then
        echo "YELLOW"
        ./mosquitto_pub.exe -h "test.mosquitto.org" -t "esp32/test" -m "YELLOW" # 11-21 range is Yellow, then publish
    elif ((S > 21));
    then
        echo "GREEN"
        ./mosquitto_pub.exe -h "test.mosquitto.org" -t "esp32/test" -m "GREEN" # 21-30 range is green, then publish
    ./mosquitto_sub.exe -t "esp32/test" -h "test.mosquitto.org" # Subscribe to color value being published
    fi
done
# end random number generation