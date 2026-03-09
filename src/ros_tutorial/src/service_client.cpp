#include "ros/ros.h"
#include "ros_tutorial/AddTwoInts.h"

int main(int argc, char **argv)
{
  ros::init(argc, argv, "add_client");

  ros::NodeHandle n;

  ros::ServiceClient client = n.serviceClient<ros_tutorial::AddTwoInts>("add_two_ints");

  ros_tutorial::AddTwoInts srv;

  srv.request.a = 3;
  srv.request.b = 5;

  if (client.call(srv))
  {
    ROS_INFO("Sum: %ld", srv.response.sum);
  }
}
