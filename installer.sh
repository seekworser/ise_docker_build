# before using it, start xquartz.

export XQ_HOST_IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
xhost $XQ_HOST_IP
docker run -e --rm DISPLAY=$XQ_HOST_IP:0 ise /vivado-installer/xsetup
