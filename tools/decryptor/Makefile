# Copyright (C) 2021 Keyboard Slayer
# 
# This file is part of WM.
# 
# WM is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# WM is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with WM.  If not, see <http://www.gnu.org/licenses/>.

CC ?= gcc 
CFLAGS += 					\
	-std=gnu2x				\
	-Werror					\
	-Wall					\
	-Wextra					\

LDFLAGS += 					\
	-static					\

DIRECTORY_GUARD=@mkdir -p $(@D)
BUILD_DIRECTORY ?= build

TARGET 		= madness
SRCS   		= $(wildcard *.c)
OBJS   		= $(patsubst %.c, $(BUILD_DIRECTORY)/%.c.o, $(SRCS))

$(BUILD_DIRECTORY)/%.c.o: %.c
	@$(DIRECTORY_GUARD)
	@$(CC) $(CFLAGS) -c -o $@ $<

$(TARGET): $(OBJS)
	@$(DIRECTORY_GUARD)
	@$(CC) $^ $(LDFLAGS) -o $@

.PHONY: all
all: $(TARGET)

.PHONY: clean
clean:
	@rm -r build

.PHONY: test
test: $(TEST_OBJS)
	@$(CC) -o $@ $^ $(LDFLAGS)
	@./$@
