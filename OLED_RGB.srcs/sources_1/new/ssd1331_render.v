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
    input btnU,
    input btnD,
    input btnL,
    input btnR,
    
    // Obtained by render_engine in oled_top.v
    input init_done, // Needs to know when initialization is done
    input spi_status, // Are we currently transmitting? 
    
    output reg render_dc, // Controls d/c mux 
    output reg spi_start, // Controls SPI start mux
    output reg [7:0] spi_data // Sends pixel data into mux 
    );
    
    // For testing
    parameter FRAME_MAX = 21'd1666666;
    parameter BYTE_MAX = 14'd12287;
    
    reg [2:0] state;
    
    reg [13:0] byte_counter; // We need to send a total of 12,288 bytes to control the screen every frame tick
    reg [20:0] frame_timer; // @60Hz we must count up to 16.67 ms per frame -> 1.67M clock cycles
    reg frame_tick;
    
    // Pixel Coords
    reg [6:0] pixel_x; // Width 96 pixels
    reg [5:0] pixel_y; // Height 64 pixels
    
    // Moveable block
    reg [6:0] box_x;
    reg [5:0] box_y;
    
    // Up
    reg btnU_ff1, btnU_ff2;
    // Down
    reg btnD_ff1, btnD_ff2;
    // Left
    reg btnL_ff1, btnL_ff2;
    // Right
    reg btnR_ff1, btnR_ff2;

    
    // Default values
    initial begin
        render_dc = 1'b1;
        spi_start = 1'b0;
        spi_data = 8'h00;
        
        pixel_x = 0;
        pixel_y = 0;
        
        // Center player
        box_x = 7'd48;
        box_y = 6'd32;

    end
    
    // States
    localparam STATE_IDLE = 3'd0;
    localparam STATE_READY = 3'd1;
    localparam STATE_PULSE = 3'd2;
    localparam STATE_WAIT = 3'd3;
    localparam STATE_NEXT_BYTE = 3'd4;
    
    // Buton edge detection
    always @(posedge clk) begin
        if (rst) begin
            btnU_ff1 <= 0; btnU_ff2 <= 0;
            btnD_ff1 <= 0; btnD_ff2 <= 0;
            btnL_ff1 <= 0; btnL_ff2 <= 0;
            btnR_ff1 <= 0; btnR_ff2 <= 0;
            
        end else begin 
            btnU_ff1 <= btnU; btnU_ff2 <= btnU_ff1; // Sample button press and keep track of the last press
            btnD_ff1 <= btnD; btnD_ff2 <= btnD_ff1;
            btnL_ff1 <= btnL; btnL_ff2 <= btnL_ff1;
            btnR_ff1 <= btnR; btnR_ff2 <= btnR_ff1;     
        end
    end
    
    wire btnU_pulse = (btnU_ff1 == 1) && (btnU_ff2 == 0); // Send pulse when we go from 0 to 1
    wire btnD_pulse = (btnD_ff1 == 1) && (btnD_ff2 == 0);
    wire btnL_pulse = (btnL_ff1 == 1) && (btnL_ff2 == 0);
    wire btnR_pulse = (btnR_ff1 == 1) && (btnR_ff2 == 0);
    
    // Frame counter
    always @(posedge clk) begin
        if (rst) begin
            frame_timer <= 0;
            frame_tick <= 0;
        end
        
        else if (init_done) begin
            if(frame_timer == FRAME_MAX) begin
                frame_tick <= 1;
                frame_timer <= 0; 
            end 
            
            else begin
                frame_timer <= frame_timer + 1;
                frame_tick <= 0; // We only want it to tick once ever 16.67 ms
            end
        end
    
    end
    
    // State logic
    always @(posedge clk) begin
        if (rst) begin
            state <= 0;
            render_dc <= 0;
            spi_start <= 0;
            byte_counter <= 0;
            pixel_x <= 0;
            pixel_y <= 0;
        end
        
        else begin
            case (state)
                STATE_IDLE: begin
                    if (frame_tick) begin
                        state <= STATE_READY;
                        byte_counter <= 0;
                        pixel_x <= 0;
                        pixel_y <= 0;
                        
                        // Player position state
                        if (btnR_ff1 && box_x < 90) begin
                            box_x <= box_x + 1; // Move right
                        end
                        
                        if (btnD_ff1 && box_y < 58) begin
                            box_y <= box_y + 1; // Move Down
                        end    
                        
                        if (btnU_ff1 && box_y > 6'd1) begin
                            box_y <= box_y - 1; // Move Up
                        end
                        
                        if (btnL_ff1 && box_x > 7'd1) begin
                            box_x <= box_x - 1; // Move left
                        end
                            
                    end
                    
                    else begin
                        state <= STATE_IDLE;
                    end
       
                end
                    
                STATE_READY: begin
                    render_dc <= 1; // Set dc pin on board on
                    spi_start <= 1;
                    
                    
                    
                    if(pixel_x == 0 || pixel_x == 95 || pixel_y == 0 || pixel_y == 63) begin // Check for the border pixels
                        if (byte_counter[0] == 0) begin
                            spi_data <= 8'hFF; // High byte (even)
                        end else begin
                            spi_data <= 8'hFF; // Low byte (odd)
                        end
                    end
                    
                    else if ((pixel_x >= box_x && pixel_x <= box_x + 3) && (pixel_y >= box_y && pixel_y <= box_y + 3)) begin
                        spi_data <= (byte_counter[0] == 0) ? 8'hFF : 8'hE0;
                    end
                    
                    // Drawing the background
                    else begin
                        if (byte_counter[0] == 0) begin
                            spi_data <= 8'h00;
                        end else begin
                            spi_data <= 8'h1F;
                        end
                    end
                    
                    state <= STATE_PULSE; // We need to buffer for a cycle while data transfer starts
                end
                
                STATE_PULSE: begin
                    spi_start <= 0;
                    state <= STATE_WAIT;
                
                end
                
                STATE_WAIT: begin
                    spi_start <= 0; // About to process an instruction 

                    if(spi_status == 0) begin // spi_master finished processing the byte
                        state <= STATE_NEXT_BYTE;
                    end
                    
                    else begin
                        state <= STATE_WAIT;
                    end
                end 
                
                STATE_NEXT_BYTE: begin
                    if(byte_counter == BYTE_MAX) begin
                        state <= STATE_IDLE;    
                    end
                    
                    else begin
                        byte_counter <= byte_counter + 1;
                        state <= STATE_READY;
                        
                        if (byte_counter[0] == 1) begin // full two bytes sent (pixel)
                            if (pixel_x == 7'd95) begin // Reach far right end
                                pixel_x <= 0; 
                                pixel_y <= pixel_y + 1; // Like a typewriter go to the far left and down one step
                            end else begin
                                pixel_x <= pixel_x + 1;
                            end
                        end    
                    end
                end
            endcase
        end        
        
    end
    
endmodule
