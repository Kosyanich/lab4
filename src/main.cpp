#include "../include/calculator.h"
#include <iostream>

int main() {
    Calculator calculator;
    double result = calculator.Add(2.5, 3.5);
    std::cout << "Result: " << result << std::endl;

    return 0;
}
