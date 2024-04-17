BINARY=chip8
CODE_DIR=./src/
INCLUDE_DIR=./src/ ./include/
LIBS=./libs/raylib/libraylib.a

CC=gcc
OPT=
DEP_FLAGS=-MP -MD
C_FLAGS=$(foreach D,$(INCLUDE_DIR),-I$(D)) $(foreach D,$(CODE_DIR),-I$(D)) $(foreach D,$(LIBS),-l$(D)) $(OPT) $(DEP_FLAGS)

C_FILES=$(foreach D, $(CODE_DIR), $(wildcard $(D)/*.c))
OBJECTS=$(patsubst %.c,%.o,$(C_FILES))
DEP_FILES=$(patsubst %.c,%.d,$(C_FILES))

all:$(BINARY)

$(BINARY):$(OBJECTS)
	$(CC) -o $@ $^

%.o:%.c
	$(CC) $(C_FLAGS) -c -o $@ $<

clean:
	rm -rf $(BINARY) $(OBJECTS) $(DEP_FILES)
