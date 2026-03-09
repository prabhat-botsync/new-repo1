#include "ros/ros.h"
#include "std_msgs/String.h"

void callback(const std_msgs::String::ConstPtr& msg)
{
    ROS_INFO("Received: %s", msg->data.c_str());
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "simple_subscriber");

    ros::NodeHandle nh;

    ros::Subscriber sub = nh.subscribe("chatter", 10, callback);

    ros::spin();

    return 0;
}
