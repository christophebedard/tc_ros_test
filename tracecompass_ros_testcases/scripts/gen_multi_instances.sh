#!/bin/bash
## Generate a test trace with the multiple instances of the same node
./${BASH_SOURCE%/*}/trace.sh multi-instances 3 roslaunch tracecompass_ros_testcases multi_instances.launch
