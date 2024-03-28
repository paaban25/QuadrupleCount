module QuadruplesCounter (
    input [99:0] input_array, // Array of 100 input bits
    input [7:0] k,             // Value to check sum against
    output reg [15:0] count    // Output count of quadruples
);

// Declare hash map to store the frequency of sums
reg [15:0] hash_map[511:0];
integer idx,i,j;
always @* begin
    count = 0; // Initialize count to zero

    // Initialize hash map
    for ( idx = 0; idx <= 511; idx = idx + 1) begin
        hash_map[idx] = 0;
    end

    // Compute the frequencies of all pair sums using parallel processing
    for ( i = 0; i < 100; i = i + 1) begin
        for ( j = i + 1; j < 100; j = j + 1) begin
            hash_map[input_array[i] + input_array[j] + 255] = hash_map[input_array[i] + input_array[j] + 255] + 1;
        end
    end

    // Count quadruples whose sum equals k using parallel processing
    for ( i = 0; i < 100; i = i + 1) begin
        for ( j = i + 1; j < 100; j = j + 1) begin
            count = count + hash_map[k - input_array[i] - input_array[j] + 255];
        end
    end

    // Adjust for cases where quadruples contain duplicate elements
    for ( i = 0; i < 100; i = i + 1) begin
        if (input_array[i] * 2 == k) begin
            count = count - 3; // Deduct count for each pair of duplicates
        end
    end
end

endmodule
