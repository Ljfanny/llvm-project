#!/bin/bash
mkdir build && cd build
cmake -DLLVM_ENABLE_PROJECTS=clang -DCMAKE_BUILD_TYPE=Release -G "Unix Makefiles" ../llvm && make
cd ..

MYCLANG="build/bin/clang"
TEST_DIR="test"

chmod +x $TEST_DIR/test1.cpp
chmod +x $TEST_DIR/test2.cpp
chmod +x $TEST_DIR/test3.cpp

$CLANG -o $TEST_DIR/test1 $TEST_DIR/test1.cpp
$CLANG -o $TEST_DIR/test2 $TEST_DIR/test2.cpp
$CLANG -o $TEST_DIR/test3 $TEST_DIR/test3.cpp

echo "Running test1..."
./$TEST_DIR/test1
echo ""

echo "Running test2..."
./$TEST_DIR/test2
echo ""

echo "Running test3..."
./$TEST_DIR/test3
echo ""