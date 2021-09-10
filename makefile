# https://jasonblog.github.io/note/gunmake/makefilefan_li_jiao_xue.html
#all: add.so sub.so main 有順序問題要先編譯出so檔案在main , 所以main擺最後

CXX = g++

LDFLAGS = -lm

CFLAGS = -fPIC -Wall -O2 -std=c++11 

SWIGINC = -I/usr/local/include/opencv4  -I/usr/local/share/swig/any

PYTHON3INC = `python3-config --include)`
OPENCVINC = `pkg-config opencv4 --cflags`
LIBPATH = /usr/local/lib/

all: _my_lib.so

_my_lib.so: my_lib_wrap.o my_lib.o
	$(CXX) -shared -rpath ${LIBPATH} $? -L/Library/Frameworks/Python.framework/Versions/3.8/lib -lpython3.8 `pkg-config opencv4 --libs` -o $@ 

my_lib_wrap.o: my_lib_wrap.cxx 
	$(CXX) ${CFLAGS} -c $? `python3-config --include` `pkg-config opencv4 --cflags` -o $@  

my_lib.o: my_lib.cpp
	$(CXX) ${CFLAGS} -c $? `python3-config --include` `pkg-config opencv4 --cflags` -o $@   

my_lib_wrap.cxx : my_lib.i my_lib.hpp
	swig ${SWIGINC} -python -c++ my_lib.i

.PHONY: clean
clean:
	rm -f main *.so *.o *.cxx