module Weight_Memory(
    input wire clk,             // Clock signal
    input wire rst,             // Reset signal
    output reg [3:0] data_out1,  // Output data register 1
    output reg [3:0] data_out2,  // Output data register 2
    output reg [3:0] data_out3  // Output data register 3
);

// Memory array to store file data, sized according to number of lines and inputs per line
reg [3:0] data_memory [2:0][2:0]; // Assuming 2 lines of data, each with 1 input

// Read pointer to keep track of which line to read
integer read_ptr = 0;

initial begin
    // Load all data from file into the memory array at initialization
    $readmemb("input.mem", data_memory);
end

always @(posedge clk or posedge rst) begin
    if (rst) begin
        read_ptr <= 0;             // Reset the read pointer to 0
        data_out1 <= 4'b0000;      // Reset output data
        data_out2 <= 4'b0000;
        data_out3 <= 4'b0000;
    end else begin
        // Update output data from memory based on the current read pointer
        data_out1 <= data_memory[read_ptr][0];
        data_out2 <= data_memory[read_ptr][1];
        data_out3 <= data_memory[read_ptr][2];
        
        // Increment read pointer for the next clock cycle
        read_ptr <= read_ptr + 1;
        // Wrap around if it exceeds the number of lines
        if (read_ptr >= 2)
            read_ptr <= 0;
    end
end

endmodule
