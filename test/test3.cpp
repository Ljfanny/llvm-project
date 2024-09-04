#include <iostream>

int n(int a, int b) { 
    std::cout << "test3() called..." << std::endl;
    return a + b;
}

int main() {
    int a = 2;
    int b = 4;
    int c = [[ a, n(a, b), b ]];
    std::cout << "Result: " << c << std::endl;
    return 0;
}
