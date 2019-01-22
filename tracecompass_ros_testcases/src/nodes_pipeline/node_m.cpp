/**
 * \file node_m.cpp
 * \brief Publisher/subscriber node, part of a pipeline
 * \author Christophe Bedard
 */

#include <string>
#include <ros/ros.h>
#include <std_msgs/String.h>
#include "tc_ros_test/nodes_pipeline.h"


ros::Publisher pub;
int node_i;

int get_payload(std::string str) {
    int payload = 0;

    std::size_t pos = str.find("_");
    if (pos != std::string::npos) {
        std::string payload_str = str.substr(pos + 1);
        payload = std::stoi(payload_str);
    }

    return payload;
}

void callbackFunction(const std_msgs::String::ConstPtr& msg) {
    std_msgs::String next_msg;
    int payload = get_payload(msg->data);
    int new_payload = payload + pow(payload, 2);
    if (node_i == 2) {
        ros::Duration(SUDDEN_SLEEP_TIME).sleep();
    }
    next_msg.data = MSG_CONTENT_PREFIX + std::to_string(new_payload);
    pub.publish(next_msg);
}

int main(int argc, char** argv) {
    ros::init(argc, argv, "node_m");
    ros::NodeHandle n;

    node_i = 1;
    ros::NodeHandle n_p("~");
    n_p.getParam("i", node_i);

    std::string sub_topic = get_topic_name(node_i - 1);
    ros::Subscriber sub = n.subscribe(sub_topic, SUB_QUEUE_SIZE, &callbackFunction);
    std::string pub_topic = get_topic_name(node_i);
    pub = n.advertise<std_msgs::String>(pub_topic, PUB_QUEUE_SIZE, true);

    ros::spin();

    return 0;
}
