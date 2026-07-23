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
    
    // For testing
    parameter FRAME_MAX = 21'd1666666;
    parameter BYTE_MAX = 14'd12287;
    
    reg [2:0] state;
    
    reg [13:0] byte_counter; // We need to send a total of 12,288 bytes to control the screen every frame tick
    reg [20:0] frame_timer; // @60Hz we must count up to 16.67 ms per frame -> 1.67M clock cycles
    reg frame_tick;
  
    // Cell parameters
    reg [6:0] pixel_x; // 96 pixel width
    reg [5:0] pixel_y; // 64 pixel height 
    
    wire [12:0] read_addr = (pixel_y * 96) + pixel_x;
    
    wire pixel_alive;
    
   frame_ram display_ram(
   // Port A: Display (read only)
    .clka(clk),
    .ena(1'b1), // always on
    .wea(1'b0), // never writes from this module
    .addra(read_addr), // where data will be read from
    .dina(1'b0), // data in (unused)
    .douta(pixel_alive), // purpose of this port (1 = alive, 0 = dead)
    
   // Port B: Computing
    .clkb(clk),
    .enb(1'b0),
    .web(1'b0),
    .addrb(13'd0),
    .dinb(1'b0),
    .doutb()
   
   
   );
    // Default values
    initial begin
        render_dc = 1'b1;
        spi_start = 1'b0;
        spi_data = 8'h00;
    end
    
    // States
    localparam STATE_IDLE = 3'd0;
    localparam STATE_READY = 3'd1;
    localparam STATE_PULSE = 3'd2;
    localparam STATE_WAIT = 3'd3;
    localparam STATE_NEXT_BYTE = 3'd4;
      
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
        end
        
        else begin
            case (state)
                STATE_IDLE: begin
                    if (frame_tick) begin
                        state <= STATE_READY;
                        byte_counter <= 0;
                                            
                    end
                    
                    else begin
                        state <= STATE_IDLE;
                    end
       
                end
                    
                STATE_READY: begin
                    render_dc <= 1; // Set dc pin on board on
                    spi_start <= 1;
                    if (byte_counter[0] == 0) begin
                        spi_data <= 8'h00;
                    end else begin
                        spi_data <= 8'h00;
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
                    end
                    
                end
            endcase
        end        
        
    end
    
endmodule
