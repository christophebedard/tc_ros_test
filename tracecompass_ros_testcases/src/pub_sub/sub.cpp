/**
 * \file sub.cpp
 * \brief Subscriber node
 * \author Christophe Bedard
 */

#include <string>
#include <ros/ros.h>
#include <std_msgs/String.h>
#include "tc_ros_test/pub_sub.h"

void callbackFunction(const std_msgs::String::ConstPtr& msg) {
    ROS_INFO_STREAM(msg->data);
}

int main(int argc, char** argv) {
    ros::init(argc, argv, SUB_NODE_NAME);
    ros::NodeHandle n;

    ros::Subscriber sub = n.subscribe(TOPIC, SUB_QUEUE_SIZE, &callbackFunction);

    ros::spin();

    return 0;
}
