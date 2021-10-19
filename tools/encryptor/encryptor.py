#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import sys
import random

if __name__ == "__main__":
    bytecode = None
    raw_mp3 = None
    result = bytearray()
    
    if len(sys.argv) != 2:
        sys.stderr.write("No file specified\n")
        exit(1) 

    if not os.path.isfile(os.path.join(os.path.dirname(sys.argv[0]), "tool.mp3")):
        os.system("youtube-dl --extract-audio --audio-format mp3 https://www.youtube.com/watch?v=Y7JG63IuaWs")
        os.system(f"mv *.mp3 {os.path.join(os.path.dirname(sys.argv[0]), 'tool.mp3')}")

    with open(sys.argv[1], "rb") as f:
        bytecode = bytearray(f.read())

    if bytecode[1:4] != bytearray([69, 76, 70]):
        sys.stderr.write("File is not a valid ELF file\n")
        exit(1)
    
    with open(os.path.join(os.path.dirname(sys.argv[0]), "tool.mp3"), "rb") as f:
        raw_mp3 = bytearray(f.read())

    with open("code.h", "w") as f:
        result += raw_mp3

        for index, byte in enumerate(bytecode):
            result.append(byte ^ raw_mp3[index])

        f.write("#pragma once\n\n#include <stdint.h>\n#define STOP 0x%x\n#define LENGTH 0x%x\n\nuint8_t opcode[0x%x] = {\n    " % (len(raw_mp3), len(result), len(result)))

        for index, byte in enumerate(result):
            if (index+1) % 20 == 0:
                f.write("0x%02x,\n    " % byte)
            elif index == len(result) - 1:
                f.write("0x%02x };" % byte)
            else:
                f.write("0x%02x, " % byte)
