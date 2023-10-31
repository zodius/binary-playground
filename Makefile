CC = gcc
CPP = g++

CFLAGS = -Wall -O0
CXXFLAGS = -Wall

C32FLAGS = -m32 -mpreferred-stack-boundary=2

SRC_DIR = src
BUILD_DIR = build

SRC_FILES := $(wildcard $(SRC_DIR)/*/*.c) $(wildcard $(SRC_DIR)/*/*.cpp)

EXECUTABLES := $(patsubst $(SRC_DIR)/%.c,$(BUILD_DIR)/%,$(filter %.c, $(SRC_FILES))) \
               $(patsubst $(SRC_DIR)/%.cpp,$(BUILD_DIR)/%,$(filter %.cpp, $(SRC_FILES))) \
	       $(BUILD_DIR)/calling-convention/calling-convention-cdecl-x64


all: $(EXECUTABLES) $(patsubst $(BUILD_DIR)/%,$(BUILD_DIR)/%.s,$(EXECUTABLES))

$(BUILD_DIR)/%: $(SRC_DIR)/%.c
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) $(C32FLAGS) -no-pie -fno-pic -fno-stack-protector -o $@ $<

$(BUILD_DIR)/%: $(SRC_DIR)/%.cpp
	@mkdir -p $(@D)
	$(CXX) $(CXXFLAGS) $(C32FLAGS) -no-pie -fno-pic -fno-stack-protector -o $@ $<

$(BUILD_DIR)/calling-convention/calling-convention-cdecl-x64: src/calling-convention/calling-convention-cdecl.c
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) -no-pie -fno-pic -fno-stack-protector -o $@ $<

$(BUILD_DIR)/%.s: $(BUILD_DIR)/%
	@mkdir -p $(@D)
	objdump -d -M intel $< > $@

clean:
	rm -rf $(BUILD_DIR)

.PHONY: all clean
