    
#include "my_lib.hpp"

CLTracker::CLTracker(){
}

CLTracker::~CLTracker(){
}

//cv:Mat
void CLTracker::setImage(Mat& buffer){
    m_buffer = buffer;
    cout << "setImage, dims: " << m_buffer.dims << endl;
}

Mat CLTracker::getImage()  {
    cout << "getImage, channels:" << m_buffer.channels() << endl;
    return m_buffer;
}

//cv:Point
void CLTracker::setPoint(Point& p) {
    m_point =  p;
    cout << "set point: " << p << endl;
}

Point CLTracker::getPoint() {
    Point pt = Point(m_point.x+10, m_point.y+10);
    return pt; 
}

//cv:Rect
void CLTracker::setRect(Rect& rect){
    m_rect = rect;
}

Rect CLTracker::getRect()  {
    return m_rect;
}

//cv:Size
void CLTracker::setSize(Size& size){
    m_size = size;
}

Size CLTracker::getSize()  {
    return m_size;
}