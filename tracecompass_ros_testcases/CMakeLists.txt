cmake_minimum_required(VERSION 2.8.3)
project(tracecompass_ros_testcases)

find_package(catkin REQUIRED COMPONENTS
    roscpp
    std_msgs
)

catkin_package(
    INCLUDE_DIRS include
    CATKIN_DEPENDS roscpp std_msgs
)

###########
## Build ##
###########

include_directories(
    include ${catkin_INCLUDE_DIRS}
)

# pub_sub
add_executable(pub_node
    src/pub_sub/pub.cpp
)
target_link_libraries(pub_node
    ${catkin_LIBRARIES}
)
add_executable(sub_node
    src/pub_sub/sub.cpp
)
target_link_libraries(sub_node
    ${catkin_LIBRARIES}
)

# multi_instances
add_executable(instance_node
    src/multi_instances/instance.cpp
)
target_link_libraries(instance_node
    ${catkin_LIBRARIES}
)

# nodes_pipeline
add_executable(node_f
    src/nodes_pipeline/node_f.cpp
)
target_link_libraries(node_f
    ${catkin_LIBRARIES}
)
add_executable(node_m
    src/nodes_pipeline/node_m.cpp
)
target_link_libraries(node_m
    ${catkin_LIBRARIES}
)
add_executable(node_l
    src/nodes_pipeline/node_l.cpp
)
target_link_libraries(node_l
    ${catkin_LIBRARIES}
)
