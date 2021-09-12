CXX 	  = g++
CXXFLAGS  = -fPIC -Wall -O2 -std=c++11 
CXXFLAGS += `pkg-config opencv4 --cflags`

RPATH     = ./libs
LIBS      = `pkg-config opencv4 --libs`

all: libdetector.so

libdetector.so:
	$(CXX) $(CXXFLAGS) -shared -rpath ${RPATH} detector.cpp ${LIBS} -o $@ 

clean:
	$(RM) libdetector.so

$(lib): detector.h