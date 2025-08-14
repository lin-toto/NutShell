`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/08/08 19:48:46
// Design Name: 
// Module Name: array_0_ext
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


module array_0_ext(	
  input  [8:0]  RW0_addr,
  input         RW0_en,
                RW0_clk,
                RW0_wmode,
  input  [72:0] RW0_wdata,
  output [72:0] RW0_rdata
);

array_0_ext_bram array_0_ext_bram (
  .clka(RW0_clk),    // input wire clka
  .ena(RW0_en),      // input wire ena
  .wea(RW0_wmode),      // input wire [0 : 0] wea
  .addra(RW0_addr),  // input wire [8 : 0] addra
  .dina(RW0_wdata),    // input wire [72 : 0] dina
  .douta(RW0_rdata)  // output wire [72 : 0] douta
);

endmodule
