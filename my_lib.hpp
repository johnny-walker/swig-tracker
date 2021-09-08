
#include <opencv2/core.hpp>
#include <iostream>

using namespace std;
using namespace cv;

class CLTracker {
public:
    CLTracker();
    ~CLTracker();

public:
    void moveTo(Point const& p);
    Mat3b getImage();

};


