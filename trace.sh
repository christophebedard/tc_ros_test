#!/bin/bash
## Helper script for ROS tracing
## Christophe Bedard
## see: https://github.com/bosch-robotics-cr/tracetools/blob/devel/scripts/example-run-script.sh
# wait time before killing roslaunch
SLEEP_TIME=5

# create lttng session
lttng create ros

# enable events
./${BASH_SOURCE%/*}/../tracetools/scripts/setup-lttng-roscpp.sh

# start
lttng start

# preload UST library
LD_PRELOAD=/usr/lib/x86_64-linux-gnu/liblttng-ust-cyg-profile.so

# launch
roslaunch tc_ros_test pub_sub.launch &

# wait a bit and kill
echo "waiting $SLEEP_TIME..."
sleep $SLEEP_TIME
echo "killing"
kill $!

# stop & destroy
lttng stop
lttng destroy
