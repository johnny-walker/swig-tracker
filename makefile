# http://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html
# $@：current target
# $^: all the prerequisites (dependencies)
# $<：current prerequisite
# $?：rebuild-required prerequisite

CXX = g++
CFLAGS = -fPIC -Wall -O2 -std=c++11 
MODFLAGS = `python3-config --include` `pkg-config opencv4 --cflags`

SWIGINC = -I/usr/local/include/opencv4 -I/usr/local/share/swig/any

RPATH = /usr/local/lib
CVLIBS = `pkg-config opencv4 --libs`
LIBS = -L/Library/Frameworks/Python.framework/Versions/3.8/lib -lpython3.8 ${CVLIBS}

all: _my_lib.so

_my_lib.so: my_lib_wrap.o my_lib.o
	$(CXX) -shared -rpath ${RPATH} $^ ${LIBS} -o $@ 

my_lib_wrap.o: my_lib_wrap.cxx 
	$(CXX) ${CFLAGS} -c $? ${MODFLAGS} -o $@  

my_lib.o: my_lib.cpp
	$(CXX) ${CFLAGS} -c $? ${MODFLAGS}  -o $@   

my_lib_wrap.cxx : my_lib.i my_lib.hpp
	swig ${SWIGINC} -python -c++ my_lib.i

.PHONY: clean
clean:
	rm -f my_lib.py *.so *.o *.cxx