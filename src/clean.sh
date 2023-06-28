#!/usr/bin/sh

CPREFIX="i686-w64-mingw32-"
make clean CPREFIX=${CPREFIX} WINDIVERTHEADERS=../../Divert/include WINDIVERTLIBS=../../Divert/install/MINGW/i386

CPREFIX="x86_64-w64-mingw32-"
make clean CPREFIX=${CPREFIX} BIT64=1 WINDIVERTHEADERS=../../Divert/include WINDIVERTLIBS=../../Divert/install/MINGW/amd64

rm -f ../dist/x86/* ../dist/x86_64/*
