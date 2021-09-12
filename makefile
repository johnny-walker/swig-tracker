# http://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html
# $@：current target
# $^: all the prerequisites (dependencies)
# $<：first prerequisite
# $?：rebuild-required prerequisite

CXX 	  = g++
CXXFLAGS  = -fPIC -Wall -O2 -std=c++11 
PKGFLAGS  = `python3-config --include`
PKGFLAGS += `pkg-config opencv4 --cflags`

SWIGINC   = -I/usr/local/include/opencv4
SWIGINC  += -I/usr/local/share/swig/any

RPATH     = /usr/local/lib
LIBS      = -L/Library/Frameworks/Python.framework/Versions/3.8/lib -lpython3.8 
LIBS     += `pkg-config opencv4 --libs`

#CLINC     = -I./libs
#CLLIBS	  = -L./libs -ldetector
#LDFLAGS   = -ldl

all: _py_lib.so

_py_lib.so: py_lib_wrap.o py_lib.o 
	$(CXX) -shared -rpath ${RPATH} $^ ${LIBS} -o $@ 

py_lib_wrap.o: py_lib_wrap.cxx 
	$(CXX) ${CXXFLAGS} -c $? ${PKGFLAGS} -o $@  

py_lib.o: py_lib.cpp 
	$(CXX) ${CXXFLAGS} -c $? ${PKGFLAGS} -o $@   

py_lib_wrap.cxx : py_lib.i py_lib.hpp
	swig ${SWIGINC} -python -c++ py_lib.i
.PHONY: clean
clean:
	rm -f py_lib.py *.so *.o *.cxx