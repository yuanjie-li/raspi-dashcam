#!/bin/sh
 
file_name=/home/hei/Videos/raspicam_

for i in `seq 1 1 120` 
do

	# Early kill if connects to home network
	if [ $(iwgetid -r) = 'Winternet-5G' ]; 
	then
		echo
		echo "ALERT: Connected to home network."
		echo "No recording."
		echo
		break
	fi

	echo "Attempt $i times..."

	current_time=$(date "+%b-%d-%Y__%H.%M.%S")
	echo "Current Time : $current_time"
	 
	new_fileName=$file_name$current_time.mp4
	echo "New FileName: " "$new_fileName"
	
	# This was the toughest part of the whole project to 
	# find the optimal settings for recording.
	libcamera-vid -t 60000 --width 1920 --height 1080 --framerate 15 -b 4096k --codec libav -o  $new_fileName

	echo "Done with recording..."

	# Check for throttling 
	echo "Checking for throttle at cycle $i" >> throttle_logs.txt
	vcgencmd get_throttled >> throttle_logs.txt

done

