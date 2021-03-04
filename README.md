# CUDA challange

Nothing guaranteed.

## Compile CUDA programs separately

This is my memory to reproduce separate files compile.
Using Makefile might be smart.
Binary files build from separate files seems to be slow than compiled from one `*.cu` file. Mayby 1.5 times slower.
Some options might help the performance, but I don't know well about CUDA.

Separate `*.cu` files are able to be compiled into one binary via `*.cpp` files, translated by nvcc with `--cuda` option.  

```
$ ls *.cu
test.cu utils.cu
$ nvcc --cuda test.cu -o test.cpp
$ nvcc --cuda utils.cu -o utils.cpp
$ ls *.cpp
test.cpp utils.cpp
```

Compile `*.cpp` files by g++.

```
$ g++ -c test.cpp
$ g++ -c utils.cpp
```

Link object files by nvcc.

```
$ nvcc test.o utils.o -o test
```


