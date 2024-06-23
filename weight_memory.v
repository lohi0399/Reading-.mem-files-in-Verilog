
module Weight_Memory # (parameter numWeight = 128,addressWidth=7,dataWidth=8)
(
input clk,
input ren,
input [addressWidth-1:0] radd,
output reg [dataWidth-1:0] wout);

reg [dataWidth-1:0] mem [numWeight-1:0];

    initial 
    begin
        $readmemb("full_path_of_your_mem_file", mem);
    end
    
    always @(posedge clk)
    begin
        if (ren)
        begin
            wout <= mem[radd];
        end
    end 

endmodule
