#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>

#include "elf.h"

void elf_loader(uint8_t const *prog)
{
    exec = mmap(NULL, size, PROT_READ | PROT_WRITE | PROT_EXEC,
                  MAP_PRIVATE | MAP_ANONYMOUS, 0, 0);
}

int main(void)
{
    [[gnu::unused]] char const *a1 = "Looking at strings won't help you";
    [[gnu::unused]] char const *a2 = "Yeah I'm talking to you little reverser";
    [[gnu::unused]] char const *a3 = "Everything you see here is a lie";
    [[gnu::unused]] char const *a4 = "I hope you'll love my MADNESS";

    uint8_t *tool = (uint8_t *) malloc(STOP);
    uint8_t *prog = (uint8_t *) malloc(LENGTH - STOP);

    assert(tool != NULL);
    assert(prog != NULL);

    memcpy(tool, opcode, STOP);

    for (size_t i = STOP; i < LENGTH; i++)
    {
        prog[i - STOP] = opcode[i] ^ tool[i - STOP];
    }

    elf_loader(prog);

    free(tool);
    free(prog);
    return 0;
}