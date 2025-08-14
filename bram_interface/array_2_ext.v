`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/08/08 20:14:41
// Design Name: 
// Module Name: array_2_ext
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


module array_2_ext(	
  input  [8:0]  RW0_addr,
  input         RW0_en,
                RW0_clk,
                RW0_wmode,
  input  [75:0] RW0_wdata,
  output [75:0] RW0_rdata,
  input  [3:0]  RW0_wmask
);

wire [11:0] wea_in;
wire [95:0] data_in;
wire [95:0] data_out;

assign data_in = {{RW0_wdata[75:57],5'b00000}, {RW0_wdata[56:38],5'b00000}, {RW0_wdata[37:19],5'b00000}, {RW0_wdata[18:0],5'b00000}};
assign wea_in = RW0_wmode ? {{3{RW0_wmask[3]}}, {3{RW0_wmask[2]}}, {3{RW0_wmask[1]}}, {3{RW0_wmask[0]}}} : 12'd0;
assign RW0_rdata = {data_out[95:77], data_out[71:53], data_out[47:29], data_out[23:5]};

array_2_ext_bram array_2_ext_bram (
  .clka(RW0_clk),    // input wire clka
  .ena(RW0_en),      // input wire ena
  .wea(wea_in),      // input wire [11 : 0] wea
  .addra(RW0_addr),  // input wire [8 : 0] addra
  .dina(data_in),    // input wire [95 : 0] dina
  .douta(data_out)  // output wire [95 : 0] douta
);

endmodule
