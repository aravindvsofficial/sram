module sram_controller(
    input clk,
    input rst,
    input cs,
    input we,
    input output_en,
    input [7:0] addr,
    inout [7:0] data,
    output reg ready
);

  parameter IDLE  = 2'b00;
  parameter READ  = 2'b01;
  parameter WRITE = 2'b10;
  parameter DONE  = 2'b11;

  reg [1:0] state, next_state;

  reg [7:0] mem [0:255];
  reg [7:0] data_out;

  reg data_drive;

  assign data = (data_drive) ? data_out : 8'bz;

  always @(posedge clk or negedge rst) begin
    if(!rst)
      state <= IDLE;
    else
      state <= next_state;
  end

  always @(*) begin
    next_state = state;

    case(state)

      IDLE: begin
        if(cs && we)
          next_state = WRITE;

        else if(cs && !we && output_en)
          next_state = READ;

        else
          next_state = IDLE;
      end

      READ  : next_state = DONE;
      WRITE : next_state = DONE;
      DONE  : next_state = IDLE;

      default: next_state = IDLE;

    endcase
  end

  always @(posedge clk or negedge rst) begin

    if(!rst) begin
      data_out   <= 8'b0;
      data_drive <= 1'b0;
      ready      <= 1'b0;
    end

    else begin

      case(state)

        IDLE: begin
          data_drive <= 1'b0;
          ready      <= 1'b0;
        end

        WRITE: begin
          mem[addr] <= data;
          data_drive <= 1'b0;
          ready <= 1'b0;
        end

        READ: begin
          data_out <= mem[addr];
          data_drive <= 1'b1;
          ready <= 1'b0;
        end

        DONE: begin
          data_drive <= 1'b0;
          ready <= 1'b1;
        end

      endcase
    end
  end

endmodule
