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
    // global
    input clk,
    input rst,
    
    // Obtained by render_engine in oled_top.v
    input init_done, // Needs to know when initialization is done
    input spi_status, // Are we currently transmitting? 
    
    output reg render_dc, // Controls d/c mux 
    output reg spi_start, // Controls SPI start mux
    output reg [7:0] spi_data // Sends pixel data into mux 
    );

    reg [4:0] state;
    
    reg [13:0] bit_count; // We need to send a total of 12,288 bytes to control the screen every frame tick
    reg [20:0] frame_timer; // @60Hz we must count up to 16.67 ms per frame -> 1.67M clock cycles
    reg frame_tick;
    
    // Default values
    initial begin
        render_dc = 1'b1;
        spi_start = 1'b0;
        spi_data = 8'h00;
    end
    
    // States
    localparam STATE_IDLE = 3'd0;
    localparam STATE_READY = 3'd1;
    
    always @(posedge clk) begin
        if (rst) begin
            frame_timer <= 0;
            frame_tick <= 0;
        end
        
        else if (init_done) begin
            if(frame_timer == 1666666) begin
                frame_tick <= 1;
                frame_timer <= 0;
            end 
            
            else begin
                frame_timer <= frame_timer + 1;
                frame_tick <= 0;
            end
        end
    
    end
    
    always @(posedge clk) begin
        if (rst) begin
            state <= 0;
            render_dc <= 0;
            spi_start <= 0;
            bit_count <= 0;
        end
        
        else begin
            case (state)
                STATE_IDLE: begin
                    if (frame_tick) begin
                        state <= STATE_READY;
                    end
                    
                    else begin
                        state <= STATE_IDLE;
                    end
       
                end
                    
                STATE_READY: begin
                    render_dc <= 1; // Set dc pin on board on
                    spi_start <= 1;
                end
            
            endcase
       
        end        
        
    end
    
endmodule
