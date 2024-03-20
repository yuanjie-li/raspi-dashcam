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
		libcamera-vid -t 60000 --width 720 --height 480 --framerate 10 -b 9000000 --codec libav -o  $new_fileName

		echo "Done with recording..."

	done
fi
 
