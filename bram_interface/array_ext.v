`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/08/08 19:52:22
// Design Name: 
// Module Name: array_ext
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


module array_ext(	
  input  [6:0]  RW0_addr,
  input         RW0_en,
                RW0_clk,
                RW0_wmode,
  input  [83:0] RW0_wdata,
  output [83:0] RW0_rdata,
  input  [3:0]  RW0_wmask
);

wire [11:0] wea_in;
wire [95:0] data_in;
wire [95:0] data_out;

assign data_in = {{RW0_wdata[83:63],3'b000}, {RW0_wdata[62:42],3'b000}, {RW0_wdata[41:21],3'b000}, {RW0_wdata[20:0],3'b000}};
assign wea_in = RW0_wmode ? {{3{RW0_wmask[3]}}, {3{RW0_wmask[2]}}, {3{RW0_wmask[1]}}, {3{RW0_wmask[0]}}} : 12'd0;
assign RW0_rdata = {data_out[95:75], data_out[71:51], data_out[47:27], data_out[23:3]};

array_ext_bram array_ext_bram (
  .clka(RW0_clk),    // input wire clka
  .ena(RW0_en),      // input wire ena
  .wea(wea_in),      // input wire [11 : 0] wea
  .addra(RW0_addr),  // input wire [6 : 0] addra
  .dina(data_in),    // input wire [95 : 0] dina
  .douta(data_out)  // output wire [95 : 0] douta
);

endmodule
