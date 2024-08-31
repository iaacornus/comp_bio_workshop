#include <stdio.h>
#include <string.h>

int main() {
    /* this is comment */
    // this is ignored
    // this is variable
    char hello[] = "hello world!";

    // compare this variable to a string
    if ( strcmp(hello, "hello world!") == 0 ) {
        printf("The tradition in programming is to print\n");
        printf("Hello World! Like this in C, %s\n", hello);
    }

    return 0;
}
