#!/bin/sh
 
file_name=/home/hei/Videos/raspicam_

if [ $? -eq 0 ]; then
    echo "Online: awaiting ssh ..."
else
    echo "Offline: Starting recording ..."
	for i in `seq 1 1 120` 
	do
		echo "Attempt $i times..."

		current_time=$(date "+%b-%d-%Y__%H.%M.%S")
		echo "Current Time : $current_time"
		 
		new_fileName=$file_name$current_time.mp4
		echo "New FileName: " "$new_fileName"
		
		#This was the toughest part of the whole project to find the optimal settings for recording.
		libcamera-vid -t 60000 --width 1920 --height 1080 --framerate 10 -b 1024k --codec libav -o  $new_fileName

		echo "Done with recording..."

		# Check for throttling 
		echo "Checking for throttle at cycle $i" >> throttle_logs.txt
		vcgencmd get_throttled >> throttle_logs.txt

	done
fi
 
