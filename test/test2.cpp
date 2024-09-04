#include <iostream>

float n() { 
    std::cout << "test2() called..." << std::endl;
    return 3.14;
}

int main() {
    int a = 1;
    int b = 1;
    float c = [[ a, n(), b ]];
    std::cout << "Result: " << c << std::endl;
    return 0;
}
