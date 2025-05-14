module tb_counter;

  // Inputs
  reg clk;
  reg rst;
  reg up_down;

  // Output
  wire [2:0] out;

  // Instantiate the DUT (Device Under Test)
  counter dut (
    .clk(clk),
    .rst(rst),
    .up_down(up_down),
    .out(out)
  );

  // Clock Generation: 10ns period (100 MHz)
  always #5 clk = ~clk;

  // Stimulus
  initial begin
    // Initialize inputs
    clk = 0;
    rst = 0;
    up_down = 0;

    // Apply reset
    #10;
    rst = 1;

    // Count up for 8 clock cycles
    up_down = 1;
    repeat (8) @(posedge clk);

    // Count down for 4 clock cycles
    up_down = 0;
    repeat (4) @(posedge clk);

    // Finish simulation
    #10;
    $finish;
  end

  // Monitor output
  initial begin
    $display("Time\tclk\trstn\tup_down\tout");
    $monitor("%0t\t%b\t%b\t%b\t%0d", $time, clk, rst, up_down, out);
  end

endmodule
