#include <iostream>
#include<opencv2/opencv.hpp>

using namespace std;
using namespace cv;

class CLDetector {
public:
    CLDetector();
    ~CLDetector();

public:
    void hello();
    void setImage(Mat& buffer);
};