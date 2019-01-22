/**
 * \file nodes_pipeline.h
 * \brief nodes_pipeline test case defines
 * \author Christophe Bedard
 */

#include <string>

#define TOPIC "/the_topic_name"

#define TOPIC_PREFIX "/topic_"
#define PUB_FREQUENCY 10.0
#define MSG_CONTENT_PREFIX "somecontent_"
#define MSG_INITIAL_PAYLOAD 2
#define PUB_QUEUE_SIZE 10
#define SUB_QUEUE_SIZE 10
#define SUDDEN_SLEEP_TIME 0.1

std::string get_topic_name(int pub_node_index) {
    return TOPIC_PREFIX + std::to_string(pub_node_index);
}
