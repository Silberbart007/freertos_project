CC = gcc
CFLAGS = -Wall -Wextra -O2 -pthread -I./freertos/FreeRTOS/Source/include \
          -I./freertos/FreeRTOS/Source/portable/ThirdParty/GCC/Posix \
          -I./include \
          -I./freertos/FreeRTOS/Source/portable/ThirdParty/GCC/Posix/utils

FREERTOS_SRC = \
  freertos/FreeRTOS/Source/tasks.c \
  freertos/FreeRTOS/Source/queue.c \
  freertos/FreeRTOS/Source/timers.c \
  freertos/FreeRTOS/Source/list.c \
  freertos/FreeRTOS/Source/event_groups.c \
  freertos/FreeRTOS/Source/portable/ThirdParty/GCC/Posix/port.c \
  freertos/FreeRTOS/Source/portable/ThirdParty/GCC/Posix/utils/wait_for_event.c \
  freertos/FreeRTOS/Source/portable/MemMang/heap_4.c

SRC = src/main.c

OBJ = $(FREERTOS_SRC:.c=.o) $(SRC:.c=.o)

TARGET = freertos_posix_demo

all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^ -lrt

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJ) $(TARGET)
