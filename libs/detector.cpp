#include "detector.h"

CLDetector::CLDetector(){
}

CLDetector::~CLDetector(){
}

void CLDetector::hello(){
    cout << "hello detector" << endl;
}

//cv:Mat
void CLDetector::setImage(Mat& buffer){
    imshow("CLDetector", buffer);
    waitKey(0);
}
