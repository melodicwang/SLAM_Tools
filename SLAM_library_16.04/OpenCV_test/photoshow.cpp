/**
 * @title       photoshow   
 * @author      king    19-3-19 下午6:01  
 */
#include <iostream>
#include <chrono>

#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>

using namespace std;
using namespace cv;

int main( int argc, char** argv)
{
    Mat srcImage = imread( "ubuntu.png");

    imshow( "111", srcImage );

    waitKey( 0 );
    return 0;

}