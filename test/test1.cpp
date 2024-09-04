#include <iostream>

int n() { 
    std::cout << "test1() called..." << std::endl;
    return 10;
}

int main() {
    int a = 0;
    int b = 2;
    int c = [[ a, n(), b ]];
    std::cout << "Result: " << c << std::endl;
    return 0;
}
