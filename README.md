# Madness 

## Introduction
In the context of my reverse engineering course, we were asked to make a malicious piece of software. I've decided to go full in and showcase my mad scientist side :godmode:

## ~ Let met introduce you to the madness ~
### 1 - The virtual machine
I've always remembered that the hardest reversing challanges in CTFs was based around virtual machines and custom instructions set.

What's funny about this instruction set is the fact that the opcodes seems random but they are not ! They are based around the fibonacci sequence.
#### The instruction table
| Opcode | Mnemonic    | Description                                                                                                 |
|--------|-------------|-------------------------------------------------------------------------------------------------------------|
| 0x02   | ENV         | Fetch information from the environnement variable the name of the variable should be stored in a register   |
| 0x04   | EXIT        | Exit the program                                                                                            |
| 0x07   | PRINT       | Print what's inside a register (mostly for debug purpose)                                                   |
| 0x0C   | APPEND      | Takes two registers and put them together                                                                   |
| 0x14   | LOADR       | Take the value of a register and put it inside another the result is put in the register **re**             |
| 0x21   | OPEN        | Take the name of a file and open a file pointer and put it inside of a register                             |
| 0x36   | SYSTEM      | Take a register with a command you want to execute and put the output of it inside the register **re**      |
| 0x58   | CLOSE       | Just an instruction to close a file pointer                                                                 |
| 0x87   | WRITE       | Write the value of a register to a file pointer                                                             |
| 0xe8   | LOADS       | Take a string and put it inside of a register                                                               |
#### The registers
You can find their value inside of the [assembler](https://github.com/keyboard-slayer/madness/blob/main/tools/assembler/assembler.py)
#### The assembler
I was too lazy to write the opcode by hand (and also remembering them by heart), so I wrote a quick and dirty assembler. It generates a Rust file containing the raw opcodes inside of an array.
#### Languages used
I've used Python for the assembler and Rust for the virtual machine
### 2 - Basic Obfuscation
I thought, well it's not mad enough for my taste so I added a little bit of spice.
Every strings passed to the assembler are xored with the value `0x42` to make impossible to use the command `strings`. 
Afterwards I had a terrific idea: what happen if you take an ELF binary and you xor it with another file. In that optic I wrote an [encryptor](https://github.com/keyboard-slayer/madness/blob/main/tools/encryptor/encryptor.py)
that download [Lateralus](https://www.youtube.com/watch?v=Y7JG63IuaWs) by tool (in the most legal way I promise :pleading_face:).  I've chosen this song beause it's fairly long enough to encode all the data and also because it's about over-analysing stuff great choice for that situation I guess...

The encoder spits out a C header that contains the song itself and our cyphered binary. It just needs a [decoder](https://raw.githubusercontent.com/keyboard-slayer/madness/main/tools/decryptor/main.c) that executes de result. And to give it even more spice and also because I knew too well that my classmates will execute `strings` I put the song lyrics inside of the executable. 
(Spoiler alert: even the teacher tought that has something to do with all of this, but if you pay close attention to the code you'll see that it goes straight to `/dev/null`)

And the for the cherry on the top everything is compiled in `-O3` with debug symbols stripped.

## What should I do for a V2 ?
* Write the vm in golang to make it even harder to understand
* Uses a stack based VM and xor the strings inside of it, make it harder to understand inside of a debugger
* Write my own elf parser
* Anti-debugger feature
