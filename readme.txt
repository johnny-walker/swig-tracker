#references:
https://docs.opencv.org/4.5.3/d0/db2/tutorial_macos_install.html
https://github.com/renatoGarcia/opencv-swig
https://blog.csdn.net/whahu1989/article/details/95874756

(1)install opencv
git clone https://github.com/opencv/opencv.git
git clone https://github.com/opencv/opencv_contrib.git (optional)
cd opencv
mkdir release
cd release
cmake .. -DCMAKE_BUILD_TYPE=Release -DBUILD_EXAMPLES=ON -DOPENCV_GENERATE_PKGCONFIG=ON -DCMAKE_INSTALL_PREFIX=/usr/local 
make -j7
sudo make install

(2)install opencv-swig:
git clone https://github.com/renatoGarcia/opencv-swig.git
cd opencv-swig
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=/usr/local
make install

(3) build module
create project with .i

(3.a) (recommended) build module (w/o cmake) 
swig -I/usr/local/include/opencv4  -I/usr/local/share/swig/any -python -c++ my_lib.i
g++ -fPIC -c my_lib_wrap.cxx my_lib.cpp $(python3-config --include) $(pkg-config opencv4 --cflags) -std=c++11
g++ -shared -rpath /usr/local/lib/ my_lib_wrap.o my_lib.o -o _my_lib.so -L/Library/Frameworks/Python.framework/Versions/3.8/lib -lpython3.8 `pkg-config opencv4 --libs`

(3.b) build module (w/ cmake)
mkdir build
cd build
cmake .. -DOpenCV-SWIG_ROOT=/usr/local
make
