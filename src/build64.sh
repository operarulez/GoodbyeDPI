#!/usr/bin/sh

CPREFIX="x86_64-w64-mingw32-"
mkdir -p ../${CPREFIX}build/utils
mkdir -p ../dist/x86_64
make CPREFIX=${CPREFIX} BIT64=1 WINDIVERTHEADERS=../../Divert/include WINDIVERTLIBS=../../Divert/install/MINGW/amd64
cp ../${CPREFIX}build/goodbyedpi.exe ../dist/x86_64
