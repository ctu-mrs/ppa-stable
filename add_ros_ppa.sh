#!/bin/bash

set -e

trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'echo "$0: \"${last_command}\" command failed with exit code $?"' ERR

echo "$0: Adding ROS PPA"

sudo apt-get -o Acquire::Retries=4 -y install wget lsb-release gnupg curl sudo

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

curl -s --retry 4 --retry-connrefused https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

sudo apt-get -o Acquire::Retries=4 update

sudo apt-get -o Acquire::Retries=4 -y install python3-pip

sudo pip3 install -U rosdep

sudo rosdep init || echo "$0: rosdep already initialized"
rosdep --include-eol-distros --rosdistro=noetic update

echo "$0: ROS PPA added"
