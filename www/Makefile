CC=g++
CFLAGS=-Wall -O0
LIBS=

SRCS=$(wildcard src/*.cpp)
OBJS=$(patsubst %.cpp, %.o, $(SRCS))

EXE = hello.cgi

.PHONY: clean all

all: $(EXE)

$(EXE): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^ $(LIBS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(EXE)* src/*.o
