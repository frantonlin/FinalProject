# CompArch Final Project Writeup - FPU Add/Sub

## Overview
I implemented an double precision floating point adder/subtractor using Verilog. The adder/subtractor is one of the most difficult portions of an FPU to implement, as keeping track of the exponent and sign of the output is quite confusing. I attempted to implement this as structurally as possible, but ran out of time before making it fully structural. However, the structure of the implementation along with the testing suite would make it fairly easy to swap out behavioral components for structural components. For example, the left and right shifters in the block diagram could be swapped out with a barrel shifter implementation.

Additionally, I did not implement rounding modes or deal with overflow during exponent difference calculation. The focus of this project was to understand and implement basic floating point arithmetic.

## Block Diagram
<img src="blockdiagram.png" alt="FPU Add/Sub Block Diagram">
This block diagram is based off of designs seen in the resources listed at the bottom. None of the resources gave a comprehensive diagram for implementation, so this design contains elements from many sources.

The sign compute block was constructed by creating a truth table based on the inputs, and finding a function that satisfies the truth table. The adder used was behavioral, but simulates a 53-bit 2's complement binary adder/subtractor that keeps track of an extra bit for sign.

Although not explicitly displayed in the diagram above, the normalization blocks can be further broken down into simpler blocks, including 53-bit left and right shifters, 11 bit adders/subtractors, and multiplexors.

## Testing
A comprehensive test suite was created, which tests all of the blocks of the implementation and automatically checks that the output is correct. Given that the tests do not pass, some additional information may be displayed. Furthermore, each test also contains commented out $display statements that display a verbose output of the testing.

## Resources
- http://steve.hollasch.net/cgindex/coding/ieeefloat.html
- http://www.eng.utah.edu/~cs6830/Slides/FP-cktsx2.pdf
- http://web.cs.ucla.edu/digital_arithmetic/files/ch8.pdf
- Computer Organization and Architecture (8th Edition) by William Stallings (pg. 327-337)
