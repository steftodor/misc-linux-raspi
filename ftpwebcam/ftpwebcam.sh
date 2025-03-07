#!/bin/bash

FTP Server Details
FTP_HOST=""
FTP_USER=""
FTP_PASS=""
FTP_REMOTE_PATH=""

DATA_TITLE=""
DATA_SUBTITLE=""
DATA_INFO="" # this will be displayed under the timestamp



capture_webcam_snapshot() {
    fswebcam \
        --resolution="1024x576" \
        --title="$DATA_TITLE" \
	--subtitle="$DATA_SUBTITLE" \
	--info="$DATA_INFO" \
        --timestamp "%A %B %d, %Y %H:%M:%S %Z" \
        /home/pi/ftpcam/webcam.jpg
}

# Function to upload image via FTP using curl
upload_to_ftp() {
    curl -T /home/pi/ftpcam/webcam.jpg \
         --user "$FTP_USER:$FTP_PASS" \
         "ftp://$FTP_HOST/$FTP_REMOTE_PATH"
}


capture_webcam_snapshot
upload_to_ftp