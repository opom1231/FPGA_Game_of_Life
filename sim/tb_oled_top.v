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
    
    // Redefining clock cycle parameters 
    defparam uut.render_engine.FRAME_MAX = 21'd10; // 10 cylces instead of 1.6M
    
    defparam uut.init_engine.POWER_UP_MAX = 22'd10; // 10 cycles instead of 2M
    defparam uut.init_engine.VCC_WAIT_MAX = 22'd10; // 10 cycles instead of 2.5M
    
    defparam uut.render_engine.BYTE_MAX = 14'd3;
    defparam uut.init_engine.RESET_MAX = 5;
    
    // 100MHz clock, 10ns period
    always #5 clk = ~clk;
    
    initial begin
        clk = 0;
        rst = 1;
        #40; // hold for 40ns
        rst = 0;
        
        #1500000; // 
        $finish;
    end
    
endmodule
