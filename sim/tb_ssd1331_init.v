`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/19/2026 12:43:59 PM
// Design Name: 
// Module Name: tb_ssd1331_init
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


module tb_ssd1331_init();
    // Inputs
    reg clk;
    reg rst;
    
    // Outputs (Pins)
    wire oled_dc;
    wire oled_res;
    wire oled_vccen;
    wire oled_pmoden;
    
    // SPI 
    wire oled_sclk;
    wire oled_sdin;
    wire oled_cs;
    
    ssd1331_init uut (
        .clk(clk),
        .rst(rst),
        .oled_res(oled_res),
        .oled_dc(oled_dc),
        .oled_vccen(oled_vccen),
        .oled_pmoden(oled_pmoden),
        .oled_sclk(oled_sclk),
        .oled_sdin(oled_sdin),
        .oled_cs(oled_cs)
    );
    
endmodule
