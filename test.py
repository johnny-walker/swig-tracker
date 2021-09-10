import my_lib
import numpy as np
import cv2

tracker = my_lib.CLTracker()

p0 = my_lib.Point(13, 17)
tracker.setPoint(p0)

p1 = tracker.getPoint()
pt1 = p1.x, p1.y
print (type(p1), pt1)

img = cv2.imread("./data/opencv-logo.jpg", cv2.IMREAD_COLOR)
rect = my_lib.Rect(0, 0, img.shape[0], img.shape[1])
size = my_lib.Size( img.shape[0], img.shape[1])

tracker.setSize(size)
tracker.setRect(rect)

size2 = tracker.getSize()
print(size2)

rect2 = tracker.getRect()
print(rect2)

tracker.setImage(my_lib.Mat3b.from_array(img))

cv_img = tracker.getImage() # got blur image
blur_img = np.asarray(cv_img)

window_name = 'blur'
cv2.imshow(window_name, blur_img)
cv2.waitKey()