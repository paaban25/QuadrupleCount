module QuadruplesCounter (
    input [99:0] input_array, // Array of 100 input bits
    input [7:0] k,             // Value to check sum against
    output reg [15:0] count    // Output count of quadruples
);

integer i, j, m, l;

always @* begin
    count = 0; // Initialize count to zero

    // Quadruple nested loops
    // i, j, k, l iterate over 100 elements
    // Check if sum of quadruple equals k
    for (i = 0; i < 97; i = i + 1) begin
        for (j = i + 1; j < 98; j = j + 1) begin
          for (m = j + 1; m < 99; m = m + 1) begin
            for (l = m + 1; l < 100; l = l + 1) begin
              if (input_array[i] + input_array[j] + input_array[m] + input_array[l] == k)
                        count = count + 1;
                end
            end
        end
    end
end

endmodule
