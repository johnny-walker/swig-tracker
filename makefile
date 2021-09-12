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

all: _py_lib.so

_py_lib.so: py_lib_wrap.o py_lib.o
	$(CXX) -shared -rpath ${RPATH} $^ ${LIBS} -o $@ 

py_lib_wrap.o: py_lib_wrap.cxx 
	$(CXX) ${CFLAGS} -c $? ${MODFLAGS} -o $@  

py_lib.o: py_lib.cpp
	$(CXX) ${CFLAGS} -c $? ${MODFLAGS}  -o $@   

py_lib_wrap.cxx : py_lib.i py_lib.hpp
	swig ${SWIGINC} -python -c++ py_lib.i

.PHONY: clean
clean:
	rm -f py_lib.py *.so *.o *.cxx