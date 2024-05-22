# Digital-Logic-Design-Fall-2020

Digital Circuit design using VHDL
Projects written and simulated using ModelSim software.

Description of all CA's available in pdf format in the corresponding folders.

CA1: Implementation of Bit Compare Slice, circuit comparing two bits in Verilog. 

CA2: Implementation of 8 bit comparator using 4 Two Bit Compare Slices

CA3: The goal is to implement N bit Incrementor. During the step by step implementation the following circuits are developed

      1.n-bit comparator
      
      2.Two bit Multiplexer-based Adder
      
      3.N bit Multiplexer-based Adder
      
      3.Two bit Multiplexer-based Incrementor
      
      4.B bit Multiplexer-based Incrementor
CA4: Experimentation with flip-flops and latches and comparing their performance.

CA5: Design of Multi-channel Synchronous Serial Communication Demultiplexer with the following description.

            Serial bits of data appear on the serIn input of MSSD. Normally, in no transmission mode, serIn is 1. Transmission begins when serIn makes a 1 to 0 transition. The 
            0 value bit marks the beginning of transmission and has no other information. The two bits that 
            follow are the port number, p, LSB first in time. The next 6 bits are the number of bytes, n, 
            LSB comes first in time. With 1 + 2 + 6 + n×8 clock cycles after serIn becomes 0, it will return 
            to 1 and another transmission begins with another start-bit. Data on serIn are synchronized with 
            the MSSD clock, clk.
            
            This multiplexer extracts the destination code (d, two bits) and the number of bytes that will 
            go to the destination port (n, 6 bits). After that, the next n×8 bits will be transmitted to port d.
            In addition to the four ports of MSSD, i.e., p0, p1, p2, and p3, the active port id, i.e., d, and an
            outValid signal are the outputs of MSSD. The outValid signal remains 1 for as long as actual 
            data is being transmitted to an output port

CA6: Design of a circuit that calculates cos(x). It is implemented using the taylor expansion.
