// Code your design here
module cntr (input clk, rst_, enbl, 
             output reg [2:0] cntr); 
  
  always @ (posedge clk or negedge rst_) begin
    if (!rst_)
      cntr <= 3'b0;
  else if (enbl)
      cntr <= cntr + 1; 
  end 
  
endmodule
