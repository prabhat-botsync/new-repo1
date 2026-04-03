cmake_minimum_required(VERSION 3.0.2)
project(ros_tutorial)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  std_msgs
  message_generation
)

################################################
## Messages & Services
################################################

add_message_files(
  FILES
  RobotStatus.msg
)

add_service_files(
  FILES
  AddTwoInts.srv
)

generate_messages(
  DEPENDENCIES
  std_msgs
)

################################################
## Catkin package
################################################

catkin_package(
  CATKIN_DEPENDS roscpp std_msgs message_runtime
)

################################################
## Build
################################################

include_directories(
  ${catkin_INCLUDE_DIRS}
)

add_executable(publisher src/publisher.cpp)
target_link_libraries(publisher ${catkin_LIBRARIES})

add_executable(subscriber src/subscriber.cpp)
target_link_libraries(subscriber ${catkin_LIBRARIES})

add_executable(service_server src/service_server.cpp)
target_link_libraries(service_server ${catkin_LIBRARIES})

add_executable(service_client src/service_client.cpp)
target_link_libraries(service_client ${catkin_LIBRARIES})


add_dependencies(service_server ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
add_dependencies(service_client ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
