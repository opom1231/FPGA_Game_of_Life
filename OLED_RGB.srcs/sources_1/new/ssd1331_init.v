`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/15/2026 04:29:21 PM
// Design Name: 
// Module Name: ssd1331_init
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


module ssd1331_init(
    input clk,
    input rst,
    
    // OLED Pins

    output reg oled_res,
    output reg oled_vccen,
    output reg oled_pmoden,
       
    // Ports for top level mux switch
    input spi_status,
    output reg spi_start,
    output reg init_done,
    output [7:0] spi_data_in
    
    
    );
    // For testing
    parameter POWER_UP_MAX = 22'd2000000;
    parameter VCC_WAIT_MAX = 22'd2500000;
    parameter RESET_MAX = 300;
    
    
    // Instruction ROM
    reg [7:0] init_rom [0:44];
    
    // Internal control signals
    reg [5:0] rom_index; // Track 0 - 44 instruction bytes
    reg [2:0] state; // Current FSM state
    
    // spi_master interface
    reg [21:0] delay_cnt;
    
    
    // SPI Data Input
    assign spi_data_in = init_rom[rom_index];
      
    initial begin
        // Step 7: Unlock
        init_rom[0] = 8'hFD; init_rom[1] = 8'h12;
        // Step 8: Display Off
        init_rom[2] = 8'hAE;
        // Step 9: Remap & Color Depth
        init_rom[3] = 8'hA0; init_rom[4] = 8'h72;
        // Step 10: Start Line
        init_rom[5] = 8'hA1; init_rom[6] = 8'h00;
        // Step 11: Offset
        init_rom[7] = 8'hA2; init_rom[8] = 8'h00;
        // Step 12: Normal Display
        init_rom[9] = 8'hA4;
        // Step 13: Multiplex Ratio
        init_rom[10]= 8'hA8; init_rom[11]= 8'h3F;
        // Step 14: Master Config
        init_rom[12]= 8'hAD; init_rom[13]= 8'h8E;
        // Step 15: Power Saving
        init_rom[14]= 8'hB0; init_rom[15]= 8'h0B;
        // Step 16: Phase Length
        init_rom[16]= 8'hB1; init_rom[17]= 8'h31;
        // Step 17: Clock / Osc Freq
        init_rom[18]= 8'hB3; init_rom[19]= 8'hF0;
        // Steps 18-20: Pre-charge Speeds (A, B, C)
        init_rom[20]= 8'h8A; init_rom[21]= 8'h64;
        init_rom[22]= 8'h8B; init_rom[23]= 8'h78;
        init_rom[24]= 8'h8C; init_rom[25]= 8'h64;
        // Step 21: Pre-charge Voltage
        init_rom[26]= 8'hBB; init_rom[27]= 8'h3A;
        // Step 22: VCOMH Deselect
        init_rom[28]= 8'hBE; init_rom[29]= 8'h3E;
        // Step 23: Master Current
        init_rom[30]= 8'h87; init_rom[31]= 8'h06;
        // Step 24-26: Contrast (A, B, C)
        init_rom[32]= 8'h81; init_rom[33]= 8'h91;
        init_rom[34]= 8'h82; init_rom[35]= 8'h50;
        init_rom[36]= 8'h83; init_rom[37]= 8'h7D;
        // Step 27: Disable Scroll
        init_rom[38]= 8'h2E;
        // Step 28: Clear Screen (5 byte command)
        init_rom[39]= 8'h25; init_rom[40]= 8'h00; init_rom[41]= 8'h00; 
        init_rom[42]= 8'h5F; init_rom[43]= 8'h3F;
        // Step 30: Display ON
        init_rom[44]= 8'hAF;
        
    end

    // States 
    localparam STATE_POWER_UP = 3'd0; 
    localparam STATE_RESET_LOW = 3'd1;
    localparam STATE_RESET_HIGH = 3'd2;
    localparam STATE_SEND_BYTE = 3'd3;
    localparam STATE_WAIT_SPI = 3'd4;
    localparam STATE_SPI_BUFFER = 3'd5;
    localparam STATE_WAIT_VCC = 3'd6;
    localparam STATE_DONE = 3'd7;
    
    always @(posedge clk) begin
           // Entry point
           if (rst) begin
             state <= STATE_POWER_UP;
             rom_index <= 0;
             spi_start <= 0;
             delay_cnt <= 0;
             init_done <= 0;
             
             // Default pin values
             oled_res <= 1;
             oled_vccen <= 0;
             oled_pmoden <= 0;
           end
           
           else begin
                case (state)
                     STATE_POWER_UP: begin // 0
                        oled_pmoden <= 1;
                        
                        if (delay_cnt == POWER_UP_MAX) begin // 20ms @ 100 MHz
                            state <= STATE_RESET_LOW;
                            delay_cnt <= 0;
                        end else begin 
                            delay_cnt <= delay_cnt + 1;
                        end
                     end
                     
                     STATE_RESET_LOW: begin // 1
                        oled_res <= 0;
                        
                        if (delay_cnt == RESET_MAX) begin
                            state <= STATE_RESET_HIGH;
                            delay_cnt <= 0;
                        end else begin
                            delay_cnt <= delay_cnt + 1;
                        end
                     end
                     
                     STATE_RESET_HIGH: begin // 2
                        oled_res <= 1;
                        
                        if (delay_cnt == RESET_MAX) begin
                            state <= STATE_SEND_BYTE;
                            delay_cnt <= 0;
                        end else begin
                            delay_cnt <= delay_cnt + 1;
                        end
                     end
                     
                     // Instruction loading
                     
                     STATE_SEND_BYTE: begin // 3
                        // Check if ready
                        if(spi_status == 0) begin
                            spi_start <= 1; // Allows spi to process first byte
                            state <= STATE_SPI_BUFFER;
                        end
                     end
                     
                     STATE_SPI_BUFFER: begin // 4
                        // Hold spi_start at 1 cycle so master can stabilize 
                        spi_start <= 1;
                        state <= STATE_WAIT_SPI;
                     end
                     
                     STATE_WAIT_SPI: begin // 5
                        spi_start <= 0; // // spi_master is processing the byte
                        
                        if(spi_status == 0) begin // Poll until entire byte is sent
                            
                            if (rom_index == 43) begin
                                state <= STATE_WAIT_VCC;
                                rom_index <= rom_index + 1; // Prepare for last instruction (display on)
                            end
                            
                            else if (rom_index == 44) begin
                                state <= STATE_DONE;
                            end
                            
                            else begin
                                state <= STATE_SEND_BYTE;
                                rom_index <= rom_index + 1;
                            end
                            
                        end else begin 
                            state <= STATE_WAIT_SPI;
                        end
                     end
                     
                     STATE_WAIT_VCC: begin // 6
                        oled_vccen <= 1;
                        if (delay_cnt == VCC_WAIT_MAX) begin
                            state <= STATE_SEND_BYTE;
                            delay_cnt <= 0;
                        end else begin
                            delay_cnt <= delay_cnt + 1;
                        end
                     end
                     
                     STATE_DONE: begin // 7
                        spi_start <= 0;
                        init_done <= 1; // Finished startup sequence 
                     end 
                endcase
           end
        
        end
    
    
     
endmodule
