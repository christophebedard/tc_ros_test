/**
 * \file instance.cpp
 * \brief Simple instance node
 * \author Christophe Bedard
 */

#include <string>
#include <ros/ros.h>

#define INSTANCE_NODE_NAME "instance_node_name"

int main(int argc, char** argv) {
    ros::init(argc, argv, INSTANCE_NODE_NAME);
    ros::NodeHandle n;

    // Just wait and keep on living
    while(ros::ok()) {
        ros::spinOnce();
    }

    return 0;
}
