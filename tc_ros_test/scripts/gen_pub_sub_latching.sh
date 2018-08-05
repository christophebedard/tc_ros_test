#!/bin/bash
## Generate a test trace with the pub_sub node with 3 messages and latching
./${BASH_SOURCE%/*}/trace.sh pub-sub-latching 5 roslaunch tc_ros_test pub_sub.launch num_pubs:=10 latching:=true
