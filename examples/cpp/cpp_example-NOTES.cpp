#include <cstring>
#include <iostream>

int main() {
    /* this is long comment */
    // this is ignored
    // this is variable
    char hello[] = "hello world!";

    // compare this variable to a string
    if ( strcmp(hello, "hello world!") == 0 ) {
        std::cout << "The tradition in programming is to"
            << std::endl;
        std::cout << "print Hello World! Like this in C++"
            << hello
            << std::endl;

        for (int i = 0; i < 3; i++) {
            std::cout <<
                i << " " << hello
                << std::endl;
        }
    }

    // return value
    return 0;
}
