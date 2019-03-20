#!/bin/bash
## Generate a test trace for the nodes_pipeline test case
./${BASH_SOURCE%/*}/trace.sh nodes-pipeline 5 roslaunch tracecompass_ros_testcases nodes_pipeline.launch num_pubs:=1
