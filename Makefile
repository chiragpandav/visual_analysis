CXX = g++

# Compiler flags
CXXFLAGS = -std=c++11 -Iheaders -I/usr/include/eigen3 `pkg-config --cflags opencv` \
           -I/home/livello/Downloads/demographic_analysis/libfacedetection/build \
           -I/home/livello/Downloads/demographic_analysis/byte-track-eigen/build

# Linker flags
LDFLAGS = `pkg-config --libs opencv` -L/home/livello/Downloads/demographic_analysis/libfacedetection/build -lfacedetection

# Target executable
TARGET = main

# Source files
SRCS = main.cpp

# Object files
OBJS = $(SRCS:.cpp=.o)

# Default target
all: $(TARGET)

# Rule for linking the target executable
$(TARGET): $(OBJS)
	$(CXX) $(OBJS) -o $(TARGET) $(LDFLAGS)

# Rule for compiling source files into object files
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Clean up the build files
clean:
	rm -f $(OBJS) $(TARGET)
