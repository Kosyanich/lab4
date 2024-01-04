CC = g++
CFLAGS = -std=c++11 -Wall
LIBS = -lm

SRC_DIR = src
INC_DIR = include
BUILD_DIR = build
LIB_DIR = lib

SRCS = $(wildcard $(SRC_DIR)/*.cpp)
OBJS = $(patsubst $(SRC_DIR)/%.cpp, $(BUILD_DIR)/%.o, $(SRCS))

TARGET = my_calculator_app
LIBRARY = libcalculator.a

all: $(TARGET) $(LIBRARY)

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) -I$(INC_DIR) -c $< -o $@

$(TARGET): $(OBJS)
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) -o $@ $^ $(LIBS)

$(LIBRARY): $(OBJS)
	@mkdir -p $(@D)
	ar rcs $(LIB_DIR)/$@ $^

clean:
	rm -rf $(BUILD_DIR)/*.o $(TARGET) $(LIB_DIR)/*.a

.PHONY: all clean
