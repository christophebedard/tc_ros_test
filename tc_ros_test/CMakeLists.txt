cmake_minimum_required(VERSION 2.8.3)
project(tc_ros_test)

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
