#include <cstring>
#include <iostream>

int main() {
    char hello[] = "hello world!";

    if ( strcmp(hello, "hello world!") == 0 ) {
        std::cout << "The tradition in programming is to print"
            << std::endl;
        std::cout << "Hello World! Like this in C++"
            << hello
            << std::endl;
    }

    return 0;
}
