#!/bin/bash
## Generate a test trace for the nodes_pipeline test case with 1 message
./${BASH_SOURCE%/*}/trace.sh nodes-pipeline-1 6 roslaunch tracecompass_ros_testcases nodes_pipeline.launch num_pubs:=1
