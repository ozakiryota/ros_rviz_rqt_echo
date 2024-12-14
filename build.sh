#!/bin/bash

image="ros_rviz_rqt_echo"
tag="latest"
exec_pwd=$(cd $(dirname $0); pwd)

docker build $exec_pwd \
    -t $image:$tag