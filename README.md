# Custom Language Construct

> Extend the C programming language to support a new language construct:
> `[[ IntExpression, Expression, IntExpression ]]`
>
> Semantics:
> Evaluate `Expression` and then check if the first and the last expressions are equal. If yes, then stop; otherwise increment the first expression by one and then repeat the steps.

NAME: Jiefang Lin

EID: jl85223

## Code Modifications

### 1. Parser Integration

- Modified the parser to recognize the `[[ IntExpression, Expression, IntExpression ]]` syntax.

  The modified source file is `clang/lib/Parse/ParseExpr.cpp` and the newly implemented method is `ExprResult Parser::ParseCustomExpression(SourceLocation BeginLoc)`.

- Constructed a `CustomExpr` node in the Abstract Syntax Tree (AST).

  The modified source file is `clang/include/clang/AST/Expr.h` and the newly implemented class is `CustomExpr`.

### 2. Semantic Analysis

- Implemented the semantic checking in `clang/lib/Sema/SemaExpr.cpp` through the `ExprResult Sema::ActOnCustomExpr(SourceLocation BeginLoc, Expr *LeftExpr, Expr *MidExpr, Expr *RightExpr)` function.

  This function checks that both `IntExpression` expressions are of integer type and that the first integer is less than or equal to the second.

### 3. Code Generation

- Implemented the LLVM IR generation logic in `clang/lib/CodeGen/CodeGenFunction.cpp` to emit the correct IR for the custom expression.

- The `EmitCustomExpr` function generates a loop structure that repeatedly evaluates the `Expression` until the first and last expressions are equal.

  This function is called in `EmitScalarExpr` method from `clang/lib/CodeGen/CGExprScalar.cpp`.

### 4. Testing

Created some test cases to validate the implementation of the new construct.

## Compilation and Execution

A simple script `s.sh` is provided to compile and execute the test files.