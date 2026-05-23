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
    input btnU,
    input btnD,
    input btnL,
    input btnR,
    
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
    
    // Handles the start up sequence
    ssd1331_init init_engine(
        // Global inputs
        .clk(clk),
        .rst(rst),
        
        // Direct outputs to physical board pins
        .oled_res(oled_res),
        .oled_vccen(oled_vccen),
        .oled_pmoden(oled_pmoden),
        
        // Lines to/from the top level mux and master
        .spi_status(spi_status), // Input driven by spi_master
        .spi_start(init_spi_start), // Output driven to init_spi_start for start mux
        .init_done(init_done),  // Output that determines if sequence finished or not
        .spi_data_in(init_spi_data) // Output for data mux
        
    );
    
    // Renders to screen  
    ssd1331_render render_engine(
        // Global inputs
        .clk(clk),
        .rst(rst),
        .btnU(btnU),
        .btnR(btnR),
        .btnL(btnL),
        .btnD(btnD),
        // Mux and spi_master connections
        .init_done(init_done), // Input sent by init_engine. Are we done startup sequence?
        .spi_status(spi_status), // Input sent by spi_master. Are we currently sending data?
        .spi_start(render_spi_start),   // Output sent to render_spi_start for start mux
        .spi_data(render_spi_data), // Output for data mux
        
        .render_dc(render_dc) // Output determined by render_engine
    );
    
    spi_master master_inst (
        // Global inputs
        .clk(clk),
        .rst(rst),
        
        .start(spi_start_mux), // Input determined by start mux
        .data_in(data_mux), // Input determined by data mux
        
        // Outputs from spi_master
        .status(spi_status), 
        .oled_cs(oled_cs), 
        .oled_sclk(oled_sclk),
        .oled_sdin(oled_sdin)
    );
    
    
endmodule
