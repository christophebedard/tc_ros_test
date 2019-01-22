/**
 * \file node_l.cpp
 * \brief Subscriber node, part of a pipeline
 * \author Christophe Bedard
 */

#include <string>
#include <ros/ros.h>
#include <std_msgs/String.h>
#include "tc_ros_test/nodes_pipeline.h"


int node_i = 3;

void callbackFunction(const std_msgs::String::ConstPtr& msg) {
    ROS_INFO_STREAM(msg->data);
}

int main(int argc, char** argv) {
    ros::init(argc, argv, "node_l");
    ros::NodeHandle n;

    std::string sub_topic = get_topic_name(node_i - 1);
    ros::Subscriber sub = n.subscribe(sub_topic, SUB_QUEUE_SIZE, &callbackFunction);

    ros::spin();

    return 0;
}
