/**
 * \file pub.cpp
 * \brief Simple publisher node
 * \author Christophe Bedard
 */

#include <string>
#include <ros/ros.h>
#include <std_msgs/String.h>
#include "tc_ros_test/pub_sub.h"

int main(int argc, char** argv) {
    ros::init(argc, argv, PUB_NODE_NAME);
    ros::NodeHandle n;

    ros::NodeHandle n_p("~");
    int numPubs = 0;
    bool doLatching = false;
    n_p.getParam(NUM_PUB, numPubs);
    n_p.getParam(LATCHING, doLatching);

    ros::Publisher pub = n.advertise<std_msgs::String>(TOPIC, PUB_QUEUE_SIZE, doLatching);

    if (!doLatching) {
        // Make sure the subscriber has time to subscribe if latching is not on
        ros::Duration(PUB_SLEEP_TIME).sleep();
    }

    std_msgs::String msg;
    msg.data = PUB_MSG_CONTENT;
    for (int i = 0; i < numPubs; ++i) {
        pub.publish(msg);
    }

    ros::spin();

    return 0;
}
