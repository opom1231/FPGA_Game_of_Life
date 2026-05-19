`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/19/2026 01:54:43 PM
// Design Name: 
// Module Name: oled_top
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


module oled_top(
    input clk,
    input rst,
    
    output oled_dc,
    output oled_res,
    output oled_vccen,
    output oled_pmoden,
    output oled_sclk,
    output oled_sdin,
    output oled_cs
    );
    
    // Internal wires
    wire init_spi_start;
    wire [7:0] init_spi_data;
    wire init_done;
    
    wire render_spi_start;
    wire [7:0] render_spi_data;
    wire render_dc;
    
    wire spi_status;
    
    // Multiplexer
    // Determine whether we are starting up or rendering screen
    wire spi_start_mux = (init_done) ? render_spi_start : init_spi_start;
    // Determine where the data is coming from
    wire [7:0] data_mux = (init_done) ? render_spi_data : init_spi_data;
    // Who is controlling the data/command pin
    assign oled_dc = (init_done) ? render_dc : 1'b0; // Init only sends commands
    
    
    // Start up sequence
    ssd1331_init init_engine(
        .clk(clk),
        .rst(rst),
        
        .oled_res(oled_res),
        .oled_vccen(oled_vccen),
        .oled_pmoden(oled_pmoden),
        
        .spi_status(spi_status),
        .spi_start(init_spi_start),
        .init_done(init_done),
        .spi_data_in(init_spi_data)
        
    );
    
    // Renders to screen
    spi_master master_inst (
        .clk(clk),
        .rst(rst),
        .start(spi_start_mux),
        .data_in(data_mux),
        .status(spi_status),
        .oled_cs(oled_cs),
        .oled_sclk(oled_sclk),
        .oled_sdin(oled_sdin)
    );
    
    
endmodule
