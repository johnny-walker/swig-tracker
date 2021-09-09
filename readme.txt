#references:
https://docs.opencv.org/4.5.3/d0/db2/tutorial_macos_install.html
https://github.com/renatoGarcia/opencv-swig
https://blog.csdn.net/whahu1989/article/details/95874756

#(1)install opencv
git clone https://github.com/opencv/opencv.git
git clone https://github.com/opencv/opencv_contrib.git (optional)
cd opencv
mkdir release
cd release
cmake .. -DCMAKE_BUILD_TYPE=Release -DBUILD_EXAMPLES=ON -DOPENCV_GENERATE_PKGCONFIG=ON -DCMAKE_INSTALL_PREFIX=/usr/local 
make -j7
sudo make install

#(2)install opencv-swig:
git clone https://github.com/renatoGarcia/opencv-swig.git
cd opencv-swig
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=/usr/local
make install

#(3)build module(this GitHub)
create project with .i
mkdir build
cd build
cmake .. -DOpenCV-SWIG_ROOT=/usr/local
make
