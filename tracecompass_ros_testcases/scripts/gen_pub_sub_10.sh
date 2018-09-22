#!/bin/bash
## Generate a test trace with the pub_sub node with 10 messages
./${BASH_SOURCE%/*}/trace.sh pub-sub-10 6 roslaunch tracecompass_ros_testcases pub_sub.launch num_pubs:=10
