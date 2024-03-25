BUILDDIR = ../${CPREFIX}build
TARGET = $(BUILDDIR)/goodbyedpi.exe
# Linking SSP does not work for some reason, the executable doesn't start.
#LIBS = -L$(WINDIVERTLIBS) -Wl,-Bstatic -lssp -Wl,-Bdynamic -lWinDivert -lws2_32
LIBS = -L$(WINDIVERTLIBS) -lWinDivert -lws2_32 -l:libssp.a
CC = $(CPREFIX)gcc
CCWINDRES = windres
CFLAGS = -std=c99 -pie -fPIE -pipe -I$(WINDIVERTHEADERS) -L$(WINDIVERTLIBS) \
         -O2 -D_FORTIFY_SOURCE=2 -fstack-protector \
         -Wall -Wextra -Wpedantic -Wformat=2 -Wformat-overflow=2 -Wformat-truncation=2 \
         -Wformat-security -Wno-format-nonliteral -Wshadow -Wstrict-aliasing=1 \
         -Wnull-dereference -Warray-bounds=2 -Wimplicit-fallthrough=3 \
         -Wstringop-overflow=4 \
         -Wformat-signedness -Wstrict-overflow=2 -Wcast-align=strict \
         -Wfloat-equal -Wcast-align -Wsign-conversion -Wno-stringop-overflow -Wno-stringop-overread \
         #-fstack-protector-strong
ifdef BIT64
LDFLAGS = -fstack-protector -Wl,-O1,-pie,--dynamicbase,--nxcompat,--sort-common,--as-needed \
-Wl,--image-base,0x140000000 -Wl,--disable-auto-image-base
else
LDFLAGS = -fstack-protector -Wl,-O1,-pie,--dynamicbase,--nxcompat,--sort-common,--as-needed
endif

ifdef BIT64
	LDFLAGS += -Wl,--high-entropy-va -Wl,--pic-executable,-e,mainCRTStartup
else
	CFLAGS += -m32
	LDFLAGS += -Wl,--pic-executable,-e,_mainCRTStartup -m32
endif

.PHONY: default all clean

default: $(TARGET)
all: default

OBJECTS = $(patsubst %.c, $(BUILDDIR)/%.o, $(wildcard *.c utils/*.c)) $(BUILDDIR)/goodbyedpi-rc.o
HEADERS = $(wildcard *.h utils/*.h)

$(BUILDDIR)/%.o: %.c $(HEADERS)
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILDDIR)/goodbyedpi-rc.o:
	$(CCWINDRES) goodbyedpi-rc.rc $(BUILDDIR)/goodbyedpi-rc.o

.PRECIOUS: $(TARGET) $(OBJECTS)

$(TARGET): $(OBJECTS)
	$(CC) $(OBJECTS) $(LDFLAGS) $(LIBS) -s -o $@

clean:
	-rm -f $(BUILDDIR)/*.o $(BUILDDIR)/utils/*.o
	-rm -f $(TARGET)
