#!/bin/bash

set -e

trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'echo "$0: \"${last_command}\" command failed with exit code $?"' ERR

echo "$0: Adding ROS PPA"

sudo apt-get -y -o Acquire::Retries="4" install wget lsb-release gnupg curl sudo

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

curl -s --retry 4 --retry-max-time 60 --retry-all-errors https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

sudo apt-get update -o Acquire::Retries="4"

sudo apt-get -y -o Acquire::Retries="4" install python3-pip

sudo pip3 install -U rosdep

sudo rosdep init || echo "$0: rosdep already initialized"
rosdep update --include-eol-distros

echo "$0: ROS PPA added"
