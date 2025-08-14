`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/08/08 20:08:42
// Design Name: 
// Module Name: array_1_ext
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module array_1_ext(	// src/main/scala/utils/SRAMTemplate.scala:76:26
  input  [9:0]   RW0_addr,
  input          RW0_en,
                 RW0_clk,
                 RW0_wmode,
  input  [255:0] RW0_wdata,
  output [255:0] RW0_rdata,
  input  [3:0]   RW0_wmask
);

wire [31:0] wea_in;

assign wea_in = RW0_wmode ? {{8{RW0_wmask[3]}}, {8{RW0_wmask[2]}}, {8{RW0_wmask[1]}}, {8{RW0_wmask[0]}}}: 32'd0;

array_1_ext_bram array_1_ext_bram (
  .clka(RW0_clk),    // input wire clka
  .ena(RW0_en),      // input wire ena
  .wea(wea_in),      // input wire [31 : 0] wea
  .addra(RW0_addr),  // input wire [9 : 0] addra
  .dina(RW0_wdata),    // input wire [255 : 0] dina
  .douta(RW0_rdata)  // output wire [255 : 0] douta
);

endmodule
