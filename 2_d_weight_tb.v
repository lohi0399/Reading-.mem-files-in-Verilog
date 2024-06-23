module tb_Weight_Memory();

    // Clock and reset signals
    reg clk;
    reg rst;

    // Output data registers from the module
    wire [3:0] data_out1;
    wire [3:0] data_out2;
    wire [3:0] data_out3;

    // Instantiate the module under test
    Weight_Memory uut (
        .clk(clk),
        .rst(rst),
        .data_out1(data_out1),
        .data_out2(data_out2),
        .data_out3(data_out3)
    );

    // Clock generation
    always begin
        #5 clk = ~clk; // Toggle clock every 5 time units
    end

    // Initial block to set up and control the testbench
    initial begin
        // Initialize signals
        clk = 0;
        rst = 0;

        // Display header for output
        $display("Time\tclk\trst\tdata_out1\tdata_out2\tdata_out3");

        // Apply reset
        rst = 1;
        #10;
        rst = 0;

        // Run the simulation for a certain period
        #100 $finish; // Stop the simulation after 100 time units
    end

    // Monitor changes and display output values
    always @(posedge clk) begin
        $display("%0d\t%b\t%b\t%b\t%b\t%b", $time, clk, rst, data_out1, data_out2, data_out3);
    end

endmodule
