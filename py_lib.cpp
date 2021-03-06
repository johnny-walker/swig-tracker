#include "py_lib.hpp"

CLTracker::CLTracker(): m_detecter(nullptr){
    m_detecter = new CLDetector;
    if (m_detecter) {
        m_detecter->hello();
    }
}

CLTracker::~CLTracker(){
}

//cv:Mat
void CLTracker::setImage(Mat& buffer){
    m_buffer = buffer;
    cout << "setImage, dims: " << m_buffer.dims << endl;
    if (m_detecter) {
        m_detecter->setImage(buffer);
    }
    //imshow("CLTracker", buffer);
    //waitKey(0);
}

Mat CLTracker::getImage()  {
    cout << "getImage, channels:" << m_buffer.channels() << endl;
    Mat dst = m_buffer.clone();
    blur( m_buffer, dst, Size( 5, 5 ));
    return dst;
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