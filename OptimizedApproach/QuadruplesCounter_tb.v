module QuadruplesCounter_tb;

    // Parameters
    localparam N = 100;
    

    // Inputs
    reg [N-1:0] input_array;
    reg [7:0] k;
    
    // Outputs
    wire [15:0] count;

    // Instantiate the QuadruplesCounter module
    QuadruplesCounter dut (
        .input_array(input_array),
        .k(k),
        .count(count)
    );

    // Stimulus
    initial begin
        // Initialize inputs
        input_array = 100'b0;
        k = 8'b000000011;
        
        // Run test cases
        #10;
        input_array = 100'hfffffffffffffffffffffffff; // Example input: 
        $display("Input array: %b", input_array);
        $display("k: %d", k);
        #10;
        $display("Count of quadruples with sum equal to k: %d", count);
        
        // Add more test cases as needed
        
        // End simulation
        #10;
        $finish;
    end

endmodule
