BINARY=chip8
CODE_DIR=./src/
INCLUDE_DIR=$(CODE_DIR) ./include/raylib/
LIB_DIRS=./lib/raylib/

# Lib Flags
RAY_FLAGS=-lraylib -lGL -lm -lpthread -ldl -lrt -lX11

CC=gcc
OPT=-O0
DEP_FLAGS=-MP -MD
C_FLAGS_REQ=-Wall -Wextra -std=c99
C_FLAGS=$(foreach D,$(INCLUDE_DIR),-I$(D)) $(foreach D,$(LIB_DIRS),-L$(D)) $(OPT) $(C_FLAGS_REQ) $(DEP_FLAGS) $(RAY_FLAGS)

C_FILES=$(foreach D, $(CODE_DIR), $(wildcard $(D)/*.c))
OBJECTS=$(patsubst %.c,%.o,$(C_FILES))
DEP_FILES=$(patsubst %.c,%.d,$(C_FILES))

all:$(BINARY)

$(BINARY):$(OBJECTS)
	$(CC) -o $@ $^ $(C_FLAGS)

%.o:%.c
	$(CC) -o $@ $< $(C_FLAGS) -c

clean:
	rm -rf $(BINARY) $(OBJECTS) $(DEP_FILES)
