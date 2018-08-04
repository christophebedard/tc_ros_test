#!/bin/bash
## Helper script for ROS tracing
## Christophe Bedard
## see: https://github.com/bosch-robotics-cr/tracetools/blob/devel/scripts/example-run-script.sh
## Call this by providing these arguments:
##  1. a session name [optional; 'ros' will be used]
##  2. a wait time before killing and stopping (in seconds)
##  3. a roslaunch/rosrun command
## ex: ./trace.sh 3 roslaunch tc_ros_test pub_sub.launch

## Parameters

# if no parameters were given, exit with error 
if [ -z "$1" ] ; then
    echo "Error: no parameters were given!"
    exit 1
elif [ "$1" == "-h" ] ; then
    echo -e "ROS tracing helper script.\n" \
    "Provide 3 arguments:\n" \
        "1. the lttng session name [optional; 'ros' will be used]\n" \
        "2. the wait time before killing and stopping (in seconds)\n" \
        "3. the roslaunch/rosrun command\n" \
    "Example: ./trace.sh ros-trace 3 roslaunch tc_ros_test pub_sub.launch"
    exit 0
fi

# session name
session_name="$1"
case "$session_name" in
    ''|*[!0-9]*) # not a number: good
    shift
    ;;
    *) # number: so use a default session name
    session_name="ros"
    ;;
esac

# wait time (seconds) before killing and stopping
sleep_time="$1"
case "$sleep_time" in
    ''|*[!0-9]*) # not a number: error!
    echo "Error: not a valid sleep time!"
    exit 1
    ;;
    *) # number: good
    shift
    ;;
esac

# launch command from remaining arguments
if [ -z "$1" ] ; then
    echo "Error: no launch command was given!"
    exit 1
fi
launch_cmd="$@"
launch_cmd+=" &"

## Trace

# create lttng session (and set output to traces/ directory)
lttng create $session_name --output=./${BASH_SOURCE%/*}/../traces/$session_name/

# enable events (this assumes that tracetools is in the same src/ directory)
./${BASH_SOURCE%/*}/../../../tracetools/scripts/setup-lttng-roscpp.sh

# start
lttng start

# preload UST library
LD_PRELOAD=/usr/lib/x86_64-linux-gnu/liblttng-ust-cyg-profile.so

# launch
eval "$launch_cmd"

# wait a bit and kill
echo "waiting $sleep_time..."
sleep $sleep_time
echo "killing"
kill $!

# wait again for everything to shutdown
echo "waiting for shutdown..."
sleep 2
echo "stopping"

# stop & destroy
lttng stop
lttng destroy
