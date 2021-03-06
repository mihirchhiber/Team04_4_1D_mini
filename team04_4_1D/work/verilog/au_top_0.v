/*
   This file was generated automatically by Alchitry Labs version 1.2.0.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module au_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input usb_rx,
    output reg usb_tx,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [23:0] io_dip,
    input [1:0] s_cout_input,
    output reg [2:0] a_b_cout_output,
    input [2:0] a_b_cin_input
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_slowclock_value;
  counter_1 slowclock (
    .clk(clk),
    .rst(rst),
    .value(M_slowclock_value)
  );
  
  reg [2:0] M_register_1_d, M_register_1_q = 1'h0;
  
  
  localparam S0_y_controller = 2'd0;
  localparam S1_y_controller = 2'd1;
  localparam S2_y_controller = 2'd2;
  
  reg [1:0] M_y_controller_d, M_y_controller_q = S0_y_controller;
  
  wire [3-1:0] M_adder_s;
  wire [1-1:0] M_adder_cout;
  reg [3-1:0] M_adder_x;
  reg [3-1:0] M_adder_y;
  reg [1-1:0] M_adder_cin;
  three_bit_adder_2 adder (
    .x(M_adder_x),
    .y(M_adder_y),
    .cin(M_adder_cin),
    .s(M_adder_s),
    .cout(M_adder_cout)
  );
  
  wire [1-1:0] M_add_s;
  wire [1-1:0] M_add_cout;
  reg [1-1:0] M_add_x;
  reg [1-1:0] M_add_y;
  reg [1-1:0] M_add_cin;
  full_adder_3 add (
    .x(M_add_x),
    .y(M_add_y),
    .cin(M_add_cin),
    .s(M_add_s),
    .cout(M_add_cout)
  );
  
  wire [1-1:0] M_slowClockEdge_out;
  reg [1-1:0] M_slowClockEdge_in;
  edge_detector_4 slowClockEdge (
    .clk(clk),
    .in(M_slowClockEdge_in),
    .out(M_slowClockEdge_out)
  );
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_5 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  
  always @* begin
    M_y_controller_d = M_y_controller_q;
    M_register_1_d = M_register_1_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    usb_tx = usb_rx;
    led = 8'h00;
    a_b_cout_output = 3'h0;
    io_led = 24'h000000;
    io_seg = 8'hff;
    io_sel = 4'hf;
    M_slowClockEdge_in = M_slowclock_value;
    M_adder_y = 3'h0;
    M_adder_x = M_register_1_q;
    M_adder_cin = 1'h0;
    if (M_slowClockEdge_out == 1'h1) begin
      
      case (M_y_controller_q)
        S0_y_controller: begin
          if (io_dip[0+0+0-:1]) begin
            M_adder_x = 3'h0;
            M_adder_y = 3'h0;
            M_add_x = M_adder_s[0+0-:1];
            M_add_y = M_adder_s[1+0-:1];
            M_add_cin = M_adder_s[2+0-:1];
            a_b_cout_output = M_adder_s;
            io_led[8+7-:8] = M_adder_s;
            io_led[16+0+0-:1] = M_add_s;
            io_led[16+1+0-:1] = M_add_cout;
            if (M_add_s == s_cout_input[0+0-:1] && M_add_cout == s_cout_input[1+0-:1]) begin
              io_led[16+7+0-:1] = 1'h1;
            end
            M_y_controller_d = S1_y_controller;
          end else begin
            M_add_x = a_b_cin_input[0+0-:1];
            M_add_y = a_b_cin_input[1+0-:1];
            M_add_cin = a_b_cin_input[2+0-:1];
            io_led[8+7-:8] = a_b_cin_input;
            io_led[16+0+0-:1] = M_add_s;
            io_led[16+1+0-:1] = M_add_cout;
            if (M_add_s == s_cout_input[0+0-:1] && M_add_cout == s_cout_input[1+0-:1]) begin
              io_led[16+7+0-:1] = 1'h1;
            end
            M_y_controller_d = S2_y_controller;
          end
        end
        S1_y_controller: begin
          if (io_dip[0+0+0-:1]) begin
            M_adder_y = 3'h1;
            M_add_x = M_adder_s[0+0-:1];
            M_add_y = M_adder_s[1+0-:1];
            M_add_cin = M_adder_s[2+0-:1];
            a_b_cout_output = M_adder_s;
            io_led[8+7-:8] = M_adder_s;
            io_led[16+0+0-:1] = M_add_s;
            io_led[16+1+0-:1] = M_add_cout;
            if (M_add_s == s_cout_input[0+0-:1] && M_add_cout == s_cout_input[1+0-:1]) begin
              io_led[16+7+0-:1] = 1'h1;
            end
            M_y_controller_d = S1_y_controller;
          end else begin
            M_add_x = a_b_cin_input[0+0-:1];
            M_add_y = a_b_cin_input[1+0-:1];
            M_add_cin = a_b_cin_input[2+0-:1];
            io_led[8+7-:8] = a_b_cin_input;
            io_led[16+0+0-:1] = M_add_s;
            io_led[16+1+0-:1] = M_add_cout;
            if (M_add_s == s_cout_input[0+0-:1] && M_add_cout == s_cout_input[1+0-:1]) begin
              io_led[16+7+0-:1] = 1'h1;
            end
            M_y_controller_d = S2_y_controller;
          end
        end
        S2_y_controller: begin
          if (io_dip[0+0+0-:1]) begin
            M_adder_x = 3'h0;
            M_adder_y = 3'h0;
            M_add_x = M_adder_s[0+0-:1];
            M_add_y = M_adder_s[1+0-:1];
            M_add_cin = M_adder_s[2+0-:1];
            a_b_cout_output = M_adder_s;
            io_led[8+7-:8] = M_adder_s;
            io_led[16+0+0-:1] = M_add_s;
            io_led[16+1+0-:1] = M_add_cout;
            if (M_add_s == s_cout_input[0+0-:1] && M_add_cout == s_cout_input[1+0-:1]) begin
              io_led[16+7+0-:1] = 1'h1;
            end
            M_y_controller_d = S1_y_controller;
          end else begin
            M_add_x = a_b_cin_input[0+0-:1];
            M_add_y = a_b_cin_input[1+0-:1];
            M_add_cin = a_b_cin_input[2+0-:1];
            io_led[8+7-:8] = a_b_cin_input;
            io_led[16+0+0-:1] = M_add_s;
            io_led[16+1+0-:1] = M_add_cout;
            if (M_add_s == s_cout_input[0+0-:1] && M_add_cout == s_cout_input[1+0-:1]) begin
              io_led[16+7+0-:1] = 1'h1;
            end
            M_y_controller_d = S2_y_controller;
          end
        end
      endcase
      M_register_1_d = M_adder_s;
    end else begin
      M_register_1_d = M_register_1_q;
    end
    M_adder_cin = 1'h0;
  end
  
  always @(posedge M_slowclock_value) begin
    if (rst == 1'b1) begin
      M_register_1_q <= 1'h0;
    end else begin
      M_register_1_q <= M_register_1_d;
    end
  end
  
  
  always @(posedge M_slowclock_value) begin
    if (rst == 1'b1) begin
      M_y_controller_q <= 1'h0;
    end else begin
      M_y_controller_q <= M_y_controller_d;
    end
  end
  
endmodule
