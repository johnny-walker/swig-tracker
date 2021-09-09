
#include <opencv2/core.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/imgcodecs.hpp>
#include <iostream>

using namespace std;
using namespace cv;

class CLTracker {
public:
    CLTracker();
    ~CLTracker();
    
    void setImage(Mat& buffer);
    Mat getImage();

    void setPoint(Point& p);
    Point getPoint();

    void setRect(Rect& rect);
    Rect getRect(); 
    
    void setSize(Size& size);
    Size getSize(); 

private:
    Point   m_point;
    Mat     m_buffer;
    Rect    m_rect;
    Size    m_size;
};


