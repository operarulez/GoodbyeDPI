#!/usr/bin/sh

CPREFIX="i686-w64-mingw32-"
mkdir -p ../${CPREFIX}build/utils
mkdir -p ../dist/x86
make CPREFIX=${CPREFIX} WINDIVERTHEADERS=../../Divert/include WINDIVERTLIBS=../../Divert/install/MINGW/i386
cp ../${CPREFIX}build/goodbyedpi.exe ../dist/x86
