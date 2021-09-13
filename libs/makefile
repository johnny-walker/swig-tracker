CXX 	  = g++
CXXFLAGS  = -fPIC -Wall -O2 -std=c++11 
CXXFLAGS += `pkg-config opencv4 --cflags`
LIBS      = `pkg-config opencv4 --libs`

all: libdetector.so

libdetector.so: detector.cpp
	$(CXX) $(CXXFLAGS) -shared $? ${LIBS} -o $@ 	
	cp $@ ..
clean:
	$(RM) libdetector.so

$(lib): detector.h