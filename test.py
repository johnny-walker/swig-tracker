import py_lib as _lib
import numpy as np
import cv2

tracker = _lib.CLTracker()

img = cv2.imread("./data/opencv-logo.jpg", cv2.IMREAD_COLOR)
rect = _lib.Rect(0, 0, img.shape[0], img.shape[1])
size = _lib.Size( img.shape[0], img.shape[1])

# wrap cv:Size
tracker.setSize(size)
size2 = tracker.getSize()
print(size2)

# wrap cv:Rect
tracker.setRect(rect)
rect2 = tracker.getRect()
print(rect2)

# wrap cv:Point
p0 = _lib.Point(13, 17)
tracker.setPoint(p0)
p1 = tracker.getPoint()
pt1 = p1.x, p1.y
print (type(p1), pt1)

# wrap cv:Mat
tracker.setImage(_lib.Mat3b.from_array(img))
cv_img = tracker.getImage() # got blur image
blur_img = np.asarray(cv_img)

window_name = 'Python Blur'
cv2.imshow(window_name, blur_img)
cv2.waitKey()