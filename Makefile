nvcc --cuda test_cuda.cu test_cuda.cpp
g++ -o test_cuda.cpp test_cuda.o
nvcc --cuda utils.cu utils.cpp
g++ -o utils.cpp utils.o
nvcc test_cuda.o utils.o -o test_cuda

#CXX=gcc
#CXXFLAGS=-O3
#NVCC=nvcc
#
#test_cuda: test_cuda.o utils.o
#	$(NVCC) $+ -o $@
#test_cuda.c++: test_cuda



#NVCCFLAGS= -arch=sm_61 -lcurand -lcublas $(CXXFLAGS) --compiler-bindir=$(CXX)
#NVCCFLAGS= 
#SRCDIR=src
#SRCS=$(shell find $(SRCDIR) -name '*.cu' -o -name '*.cpp')
#OBJDIR=objs
#OBJS=$(subst $(SRCDIR),$(OBJDIR), $(SRCS))
#OBJS:=$(subst .cpp,.o,$(OBJS))
#OBJS:=$(subst .cu,.o,$(OBJS))
#TARGET=hoge

#$(TARGET): $(OBJS)
#	$(NVCC) $(NVCCFLAGS) $+ -o $@

#$(SRCDIR)/%.cpp: $(SRCDIR)/%.cu
#	$(NVCC) $(NVCCFLAGS) --cuda $< -o $@

#$(OBJDIR)/%.o: $(SRCDIR)/%.cpp
#	[ -d $(OBJDIR) ] || mkdir $(OBJDIR)
#	$(CXX) $(CXXFLAGS) $< -c -o $@

#clean:
#	rm -rf $(OBJS)
#	rm -rf $(TARGET)