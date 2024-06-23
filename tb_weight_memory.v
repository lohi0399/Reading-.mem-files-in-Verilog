`timescale 1ns / 1ps

module tb_Weight_Memory;

// Parameters
parameter numWeight = 5;
parameter addressWidth = 3;
parameter dataWidth = 8;

// Inputs
reg clk;
reg ren;
reg [addressWidth-1:0] radd;

// Outputs
wire [dataWidth-1:0] wout;

// Instantiate the Unit Under Test (UUT)
Weight_Memory #(numWeight, addressWidth, dataWidth) uut (
    .clk(clk),
    .ren(ren),
    .radd(radd),
    .wout(wout)
);

// Clock generation
initial begin
    clk = 1;
    forever #5 clk = ~clk;
end

// Test sequence
initial begin
    // Initialize Inputs
    ren = 0;
    radd = 0;

    // Wait for global reset
    #10;

    // Test Case 1: Read weight 0
    radd = 3'b000;
    ren = 1;
    #10;
    $display("Address: %b, Data: %b", radd, wout);

    // Test Case 2: Read weight 1
    radd = 3'b001;
    #10;
    $display("Address: %b, Data: %b", radd, wout);

    // Test Case 3: Read weight 2
    radd = 3'b010;
    #10;
    $display("Address: %b, Data: %b", radd, wout);

    // Test Case 4: Read weight 3
    radd = 3'b011;
    #10;
    $display("Address: %b, Data: %b", radd, wout);

    // Test Case 5: Read weight 4
    radd = 3'b100;
    #10;
    $display("Address: %b, Data: %b", radd, wout);

    // End of test
    $finish;
end

endmodule