########## Pull ##########
FROM ros:noetic
########## User ##########
ARG home_dir="/home/user"
COPY copy/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN apt-get update && \
	apt-get install -y \
		gosu \
		sudo && \
	chmod +x /usr/local/bin/entrypoint.sh && \
	mkdir -p $home_dir
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
########## Non-interactive ##########
ENV DEBIAN_FRONTEND=noninteractive
########## ROS setup ##########
RUN echo "source /opt/ros/noetic/setup.bash" >> $home_dir/.bashrc && \
	echo "source ~/catkin_ws/devel/setup.bash" >> $home_dir/.bashrc && \
	echo "export ROS_WORKSPACE=~/catkin_ws" >> $home_dir/.bashrc
########## debug ##########
RUN apt-get update && \
	apt-get install -y \
		ros-noetic-rviz \
		ros-noetic-robot-state-publisher \
		ros-noetic-rqt-graph \
		ros-noetic-rqt-tf-tree \
		ros-noetic-can-msgs \
		ros-noetic-imu-tools \
		ros-noetic-image-transport \
		ros-noetic-image-transport-plugins \
		ros-noetic-image-view
########## Initial position ##########
WORKDIR $home_dir
CMD ["bash"]