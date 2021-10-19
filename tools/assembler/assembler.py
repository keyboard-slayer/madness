#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sys
from typing import List

inst = {
    "loads": 0xe8,       # Load string
    "write": 0x87,       # Write to file
    "close": 0x58,       # Close a file 
    "system": 0x36,      # Run a system command
    "open": 0x21,        # Open a file
    "loadr": 0x14,       # Load a register value to a register 
    "append": 0x0C,      # Append a string with another string 
    "print": 0x07,       # Print value in a register
    "exit": 0x04,        # Exit
    "env": 0x02          # Find env variable
}

registers = {
    "re": 0x01,         # Result register
    "r1": 0x03,
    "r2": 0x05,
    "r3": 0x08,
    "r4": 0x0D,
    "r5": 0x15,
    "r6": 0x22,
    "r7": 0x37,
    "r8": 0x59,
    "r9": 0x90,
    "r10": 0x89
}

def obfuscate_string(s: str) -> List[int]:
    new_str = []

    for letter in s:
        new_str.append(ord(letter) ^ 0x42)

    new_str.append(0 ^ 0x42) # NULL Terminator
    return new_str


if __name__ == "__main__":
    if len(sys.argv) != 2:
        sys.stderr.write("No file specified\n")
        exit(1)

    with open(sys.argv[1], "r") as f:
        code = []
        for line in f.readlines():
            if line[0] == "#":
                continue
            
            if line:
                line = line.strip()

                for index, arg in enumerate(line.split()):
                    if arg[0] == "\"":
                        s = " ".join(line.split()[index:])
                        if s[0] == "\"" and s[-1] == "\"":
                            code += obfuscate_string(s[1:-1])
                            break
                        else:
                            sys.stderr.write("String error")
                            exit(1)
                    
                    elif arg in inst:
                        code.append(inst[arg])
                    
                    elif arg in registers:
                        code.append(registers[arg])
                    
                    else:
                        print(arg)
                        sys.stderr.write("Syntax error\n")
                        exit(1)

    with open("./main.rs", "w") as f:
        f.write("mod cpu;\n\nfn main(){\n    let code: Vec<u8> = vec![ %s ];\n    let mut cpu = cpu::Cpu::new(code);\n    cpu.run();\n}" % (", ".join(["0x%02x" % x for x in code])))

    print(f"The code is {len(code)} byte long")
