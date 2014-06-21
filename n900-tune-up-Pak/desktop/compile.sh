#!/bin/sh
gcc main.cc examplewindow.cc -o main `pkg-config --libs --cflags gtk+-2.0 hildonmm hildon-fmmm`
