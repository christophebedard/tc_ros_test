# tracecompass_ros_testcases

Test cases package for Trace Compass Incubator ROS plugin.

# Tracing

See the [`trace.sh`](./tracecompass_ros_testcases/scripts/trace.sh) script.

# Traces

Some test traces are available in [`traces/`](./traces/). The scripts used to generate those traces are in [`tracecompass_ros_testcases/scripts/`](./tracecompass_ros_testcases/scripts/).

## Test cases

* `pub_sub`: simple publisher-subscriber

  * `pub_sub_1`  
    Publisher waits a bit, publishes 1 message, then subscriber re-publishes to `/rosout`.

  * `pub_sub_10`  
    Publisher waits a bit, then publishes 10 messages. The subscriber re-publishes to `/rosout`. Both queue size are smaller than 10.

  * `pub_sub_latching`  
    Publisher publishes 10 messages right away, but latching is enabled.

* `multi_instances`: multiple instances (different names) of the same node (type)
