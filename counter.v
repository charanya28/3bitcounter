module counter (
    input clk,
    input rst,
    input up_down,
    output reg [2:0] out
); 

always @ (posedge clk) begin
    if (!rst)
        out <= 0;
    else begin
        if (up_down)
            out <= out + 1; 
        else 
            out <= out - 1; 
    end 
end 

endmodule
