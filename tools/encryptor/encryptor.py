#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from typing import Optional
from pathlib import Path

import os
import sys

if __name__ == "__main__":
    bytecode: Optional[bytes] = None
    raw_mp3: Optional[bytes] = None
    result = bytearray()
    
    if len(sys.argv) != 2:
        sys.stderr.write("No file specified\n")
        exit(1) 

    musicFile = Path.cwd() / "tool.mp3"
    if not musicFile.is_file():
        os.system("yt-dlp --extract-audio --audio-format mp3 https://www.youtube.com/watch?v=Y7JG63IuaWs")
        os.system(f"mv *.mp3 {musicFile}")

    with open(sys.argv[1], "rb") as f:
        bytecode = f.read()

    if bytecode[:4] != b"\x7fELF":
        sys.stderr.write("File is not a valid ELF file\n")
        exit(1)
    
    with musicFile.open("rb") as f:
        raw_mp3 = f.read()

    result += raw_mp3

    for index, byte in enumerate(bytecode):
        result.append(byte ^ raw_mp3[index])

    with (Path.cwd() / "code.h").open("w") as f:
        f.write(f"#pragma once\n\n#include <stdint.h>\n#define STOP 0x{len(raw_mp3):x}\n#define LENGTH 0x{len(result):x}\n\nuint8_t opcode[0x{len(result):x}] = {{\n    ")

        for index, byte in enumerate(result):
            if (index+1) % 20 == 0:
                f.write(f"0x{byte:02x},\n    ")
            elif index == len(result) - 1:
                f.write(f"0x{byte:02x}}};")
            else:
                f.write(f"0x{byte:02x}, ")
