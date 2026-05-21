`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/21/2026 10:55:44 AM
// Design Name: 
// Module Name: tb_oled_top
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


module tb_oled_top();
    reg clk, rst;
    
    wire oled_dc;
    wire oled_res;
    wire oled_vccen;
    wire oled_pmoden;
    wire oled_sclk;
    wire oled_sdin;
    wire oled_cs;
    
    oled_top uut(
        .clk(clk),
        .rst(rst),
        .oled_dc(oled_dc),
        .oled_res(oled_res),
        .oled_vccen(oled_vccen),
        .oled_pmoden(oled_pmoden),
        .oled_sclk(oled_sclk),
        .oled_sdin(oled_sdin),
        .oled_cs(oled_cs)
    );
    
    // 100MHz clock, 10ns period
    always #5 clk = ~clk;
    
    initial begin
        clk = 0;
        rst = 1;
        #40;
        rst = 0;
        
        
        
        
        
        $finish;
    end
    
endmodule
