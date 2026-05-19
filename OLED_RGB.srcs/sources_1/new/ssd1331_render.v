`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/19/2026 03:02:40 PM
// Design Name: 
// Module Name: ssd1331_render
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


module ssd1331_render(
    input clk,
    input rst,
    input init_done, // Needs to know when initialization is done
    input spi_status,
    
    output reg render_dc, // Controls d/c mux 
    output reg spi_start, // Controlls SPI start mux
    output reg [7:0] spi_data // sends pixel data into mux 
    );
    
    initial begin
        render_dc = 1'b1;
        spi_start = 1'b0;
        spi_data = 8'h00;
    
    end
endmodule
