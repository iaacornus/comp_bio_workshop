#include <cstring>
#include <iostream>

int main() {
    /* this is long comment */
    // this is ignored
    // this is variable
    char hello[] = "hello world!";

    // compare this variable to a string
    if ( strcmp(hello, "hello world!") == 0 ) {
        std::cout << "The tradition in programming is to print"
            << std::endl;
        std::cout << "Hello World! Like this in C++"
            << hello
            << std::endl;
    }

    return 0;
}
