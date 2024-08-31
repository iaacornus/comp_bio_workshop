#include <stdio.h>
#include <string.h>

int main() {
    char hello[] = "hello world!";

    if ( strcmp(hello, "hello world!") == 0 ) {
        printf("The tradition in programming is to print\n");
        printf("Hello World! Like this in C, %s\n", hello);
    }

    return 0;
}
