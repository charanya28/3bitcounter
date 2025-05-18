module cntr_tb ();
  reg clk = 0, rst_, enbl; 
  wire [2:0] count_o; 
  
  cntr cntr_0 (.clk(clk), 
               .rst_(rst_), 
               .enbl(enbl),
               .cntr(count_o)
               );
  
  always 
    clk = #5 ~clk; 
  
  initial begin
    $dumpvars(1, cntr_tb); 
    $dumpfile("cntr.vcd");
    rst_ = 0; enbl = 1; 
    #3;
    rst_ = 1; enbl = 1; 
    #4; 
    rst_ = 0; enbl = 1; 
    #5; 
    rst_ = 1; enbl = 1; 
    #5
    rst_ = 0; enbl = 1;
    #6 
    rst_ = 1; enbl = 1; 
    #100
    $finish; 
  end 
endmodule 
