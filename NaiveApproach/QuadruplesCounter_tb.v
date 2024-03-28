module QuadruplesCounter_tb;

    // Parameters
    parameter SIZE = 100;  // Size of the input array
   

    // Inputs
    reg [SIZE-1:0] input_array;
    reg [7:0] k;

    // Outputs
    wire [15:0] count;

    // Instantiate the module to be tested
    QuadruplesCounter DUT (
        .input_array(input_array),
        .k(k),
        .count(count)
    );

    // Stimulus
    initial begin
        // Initialize input array with test values
        // For example, alternating 1's and 0's
        input_array=100'hfffffffffffffffffffffffff;
        
        // Apply k value
        k = 8'b00000000;

        // Wait some time for output stabilization
        #10;

        // Display results
        $display("Number of quadruples with sum equal to %d:",  count);
        
        // End simulation
        $finish;
    end

endmodule
