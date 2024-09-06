#include <stdio.h>
#include <string.h>

void main() { /* this is comment, this is ignored */
    char hello[] = "hello world!"; // this is variable

    if (strcmp(hello, "hello world!") == 0) {
        printf(
            "The tradition in programming is to print\n"
        );
        printf(
            "Hello World! Like this in C, %s\n", hello
        );

        for (int i = 1; i < 4; i++) { // loop over range of 1 to
            printf(                   // 4 and print hello world!
                "%d hello world!\n", i
            );
        }
    }

    return 0;
}
