#include <math.h>

unsigned int factorial(int N) {
    /*
     * c does not have any factorial
     * function, so you have to implement
     * your own factorial function if
     * you need to do factorial operations.
     */
    if (N <= 1) { return 1; }
    else {
        int prod = 1;
        for (int k = 1; k <= N; k++) {
            prod *= k;
        }
        return prod;
    }
}

int r_sat_func() {
    float r, r_num, r_den;
    // example arbitrary value, does not represent any
    float L = 50.05; float Kd = 1.65;
    int n = 5; int i = 4;

    unsigned int n_i_matrix =
        factorial(n)/factorial(n - i) * factorial(i);

    for (int j = 1; j == n; j++) {
        r_num += i * n_i_matrix * pow((L/Kd), i);
        r_den += 1 + n_i_matrix * pow((L/Kd), i);
    }
    return r_num + r_den;
}
