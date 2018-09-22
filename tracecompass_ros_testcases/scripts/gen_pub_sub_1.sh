#!/bin/bash
## Generate a test trace with the pub_sub node with 1 message
./${BASH_SOURCE%/*}/trace.sh pub-sub-1 5 roslaunch tracecompass_ros_testcases pub_sub.launch num_pubs:=1
