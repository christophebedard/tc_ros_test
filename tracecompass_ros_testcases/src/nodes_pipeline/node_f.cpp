/**
 * \file node_f.cpp
 * \brief First node of a publisher/subscriber pipeline
 * \author Christophe Bedard
 */

#include <string>
#include <ros/ros.h>
#include <std_msgs/String.h>
#include "tc_ros_test/nodes_pipeline.h"


int main(int argc, char** argv) {
    ros::init(argc, argv, "node_f");
    ros::NodeHandle n;

    std::string pub_topic = get_topic_name(0);
    ros::Publisher pub = n.advertise<std_msgs::String>(pub_topic, PUB_QUEUE_SIZE, true);

    ros::Rate rate(PUB_FREQUENCY);
    while (ros::ok()) {
        std_msgs::String msg;
        msg.data = MSG_CONTENT_PREFIX + std::to_string(MSG_INITIAL_PAYLOAD);
        pub.publish(msg);

        ros::spinOnce();

        if (!rate.sleep()) {
            ROS_WARN("running slowly");
        }
    }

    return 0;
}
