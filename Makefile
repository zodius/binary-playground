CFLAGS = -g -Wall
CC = gcc
# Output
OUT_DIR = build
SRC_DIR = src
SRC = $(wildcard $(SRC_DIR)/*.c)
TARGET = $(patsubst $(SRC_DIR)/%.c, $(OUT_DIR)/%, $(SRC))

all: $(TARGET)

$(TARGET): $(OUT_DIR)/%: $(SRC_DIR)/%.c
	mkdir -p $(OUT_DIR)
	$(CC) $(CFLAGS) -o $@ $<

clean:
	rm -rf $(OUT_DIR)