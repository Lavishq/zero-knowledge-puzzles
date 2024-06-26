pragma circom 2.1.4;

include "../node_modules/circomlib/circuits/comparators.circom";

// Create a Quadratic Equation( ax^2 + bx + c ) verifier using the below data.
// Use comparators.circom lib to compare results if equal

template QuadraticEquation() {
    signal input x;     // x value
    signal input a;     // coeffecient of x^2
    signal input b;     // coeffecient of x 
    signal input c;     // constant c in equation
    signal input res;   // Expected result of the equation
    signal output out;  // If res is correct , then return 1 , else 0 . 

    // your code here

    signal x_sq <== x*x;
    signal ax_sq <== a*x_sq;
    signal bx <== b*x;
    signal add_first <== ax_sq+bx;
    signal add_final <== add_first+c;

    // component is_eq = IsEqual()(add_final, res); // did not work anon func using touples, maybe it only works via arrays
    // out <== is_eq.out;
    
    component is_eq = IsEqual();
    add_final ==> is_eq.in[0];
    res ==> is_eq.in[1];
    out <== is_eq.out;
    

}

component main  = QuadraticEquation();



