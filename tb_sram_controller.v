`timescale 1ns/1ps

module tb_sram_controller;

  reg clk;
  reg rst;
  reg cs;
  reg we;
  reg output_en;
  reg [7:0] data_in;
  reg [7:0] addr;

  wire ready;
  wire [7:0] data;

  assign data = (we) ? data_in : 8'bz;

  sram_controller dut (
    .clk(clk),
    .rst(rst),
    .cs(cs),
    .we(we),
    .output_en(output_en),
    .addr(addr),
    .data(data),
    .ready(ready)
  );

  always #5 clk = ~clk;

  initial begin

    clk = 0;
    rst = 0;
    cs = 0;
    we = 0;
    output_en = 0;
    addr = 0;
    data_in = 0;

    #10;
    rst = 1;

    #10;
    cs = 1;
    we = 1;
    addr = 8'h05;
    data_in = 8'hAA;

    #10;
    cs = 0;
    we = 0;

    #20;
    cs = 1;
    we = 0;
    output_en = 1;
    addr = 8'h05;

    #20;

    $display("Read Data = %h", data);

    #20;
    $finish;
  end

endmodule
