#include "ros/ros.h"
#include "std_msgs/String.h"

int main(int argc, char **argv)
{
    ros::init(argc, argv, "simple_publisher");

    ros::NodeHandle nh;

    ros::Publisher pub = nh.advertise<std_msgs::String>("chatter", 10);

    ros::Rate rate(1);

    while (ros::ok())
    {
        std_msgs::String msg;

        msg.data = "Hello ROS";

        pub.publish(msg);

        ROS_INFO("Message sent");

        rate.sleep();
    }
}
