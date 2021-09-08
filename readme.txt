#reference:
https://github.com/renatoGarcia/opencv-swig
https://blog.csdn.net/whahu1989/article/details/95874756

#install opencv-swig:
git clone https://github.com/renatoGarcia/opencv-swig.git
cd opencv-swig
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=/usr/local
make install

#build module:
create project with .i

mkdir build
cd build
cmake .. -DOpenCV-SWIG_ROOT=/usr/local
make
