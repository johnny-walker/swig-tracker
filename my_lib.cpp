    
#include "my_lib.hpp"

CLTracker::CLTracker() {
}

CLTracker::~CLTracker(){
}


void CLTracker::moveTo(Point const& p) {
    cout << "cv::Point moved to: " << p << endl;
}

Mat3b CLTracker::getImage()  {
    return Mat3b(3, 5);
}