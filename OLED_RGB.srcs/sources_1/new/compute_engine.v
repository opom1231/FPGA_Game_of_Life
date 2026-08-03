`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/24/2026 04:00:36 PM
// Design Name: 
// Module Name: compute_engine
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


module compute_engine(
    input clk,
    input rst,
    input render_done, 
    input compute_state,
    
    output reg [12:0] compute_addr,
    
    output reg compute_next_state,
    output reg compute_write_en
    
    );
    
    reg [6:0] compute_x; 
    reg [5:0] compute_y; 
    
    reg [4:0] state;
    
    reg [3:0] neighbour_count;

    reg center_cell_state;
    
    // We need to wait a full clock cycle to register incoming address into ram
    reg read_wait;
   
    
    // States
    localparam STATE_IDLE = 3'd0;
    localparam STATE_CELLSCAN = 3'd1;
    localparam STATE_EVAL = 3'd2;
    localparam STATE_FETCH_TL = 3'd3;
    localparam STATE_FETCH_T = 3'd4;
    localparam STATE_FETCH_TR = 3'd5;
    localparam STATE_FETCH_L = 3'd6;
    localparam STATE_FETCH_R = 3'd7;
    localparam STATE_FETCH_BL = 4'd8;
    localparam STATE_FETCH_B = 4'd9;
    localparam STATE_FETCH_BR = 4'd10;
    localparam STATE_WRITE = 4'd11;
    localparam STATE_MOVE = 4'd12;
    localparam STATE_FETCH_CENTER = 4'd13;
    
    
    always @(posedge clk) begin
        if (rst) begin
            state <= 0;
            compute_write_en <= 0;
            read_wait <= 0;
        end
        
        else begin
            case(state)
                STATE_IDLE: begin
                    if (render_done) begin
                        state <= STATE_EVAL;
                        compute_x <= 0;
                        compute_y <= 0;
                    end
                end
                
                // At x, y begin checking surrounding cells
                STATE_EVAL: begin
                    neighbour_count <= 0; // Reset neighbour count
                    // Check top left
                    if (compute_x > 0 && compute_y > 0) begin 
                        compute_addr <= (((compute_y - 1) * 96) + (compute_x - 1));
                    end
                    state <= STATE_FETCH_TL;
                end 
                
                STATE_FETCH_TL: begin
                    if (!read_wait) begin
                        read_wait <= 1; // Cycle to let BRAM fetch data
                    end else begin
                        read_wait <= 0; 
                        // Double check boundary before added neighbour state 
                        // Requested from the last clock cycle
                        if (compute_x > 0 && compute_y > 0) begin
                            neighbour_count <= neighbour_count + compute_state;
                        end 
                        
                        if (compute_y > 0) begin
                            compute_addr <= (((compute_y - 1) * 96) + (compute_x)); 
                        end
                        state <= STATE_FETCH_T;
                    end    
                   
                end
                
                STATE_FETCH_T: begin
                    if (!read_wait) begin
                            read_wait <= 1; // Cycle to let BRAM fetch data
                    end else begin
                        read_wait <= 0;                    
                        if (compute_y > 0) begin
                            neighbour_count <= neighbour_count + compute_state;
                        end
                        
                        if (compute_y > 0 && compute_x < 95) begin
                            compute_addr <= (((compute_y - 1) * 96) + (compute_x + 1)); 
                        end
                        state <= STATE_FETCH_TR;
                    end
                end
                
                STATE_FETCH_TR: begin
                    if (!read_wait) begin
                        read_wait <= 1; // Cycle to let BRAM fetch data
                    end else begin
                        read_wait <= 0;                    
                        if (compute_y > 0 && compute_x < 95) begin
                            neighbour_count <= neighbour_count + compute_state;
                        end
                        
                        if (compute_x > 0) begin
                            compute_addr <= (((compute_y) * 96) + (compute_x - 1));
                        end
                        state <= STATE_FETCH_L;
                    end
                end
                
                STATE_FETCH_L: begin
                    if (!read_wait) begin
                        read_wait <= 1; // Cycle to let BRAM fetch data
                    end else begin
                        read_wait <= 0;             
                        if (compute_x > 0) begin
                            neighbour_count <= neighbour_count + compute_state;
                        end
                        
                        if (compute_x < 95) begin
                            compute_addr <= (((compute_y) * 96) + (compute_x + 1));
                        end
                        
                        state <= STATE_FETCH_R;
                    end    
                end
                
                STATE_FETCH_R: begin
                    if (!read_wait) begin
                        read_wait <= 1; // Cycle to let BRAM fetch data
                    end else begin
                        read_wait <= 0;                    
                        if (compute_x < 95) begin
                            neighbour_count <= neighbour_count + compute_state;
                        end
                        
                        if (compute_x > 0 && compute_y < 63) begin
                            compute_addr <= (((compute_y + 1) * 96) + (compute_x - 1));
                        end
                        state <= STATE_FETCH_BL;
                    end
                end
                
                STATE_FETCH_BL: begin
                    if (!read_wait) begin
                        read_wait <= 1; // Cycle to let BRAM fetch data
                    end else begin  
                        read_wait <= 0;                   
                        if (compute_x > 0 && compute_y < 63) begin
                            neighbour_count <= neighbour_count + compute_state;
                        end
                        
                        if (compute_y < 63) begin
                            compute_addr <= (((compute_y + 1) * 96) + (compute_x));
                        end
                        state <= STATE_FETCH_B;
                    end
                end
                
                STATE_FETCH_B: begin
                    if (!read_wait) begin
                        read_wait <= 1; // Cycle to let BRAM fetch data
                    end else begin
                        read_wait <= 0;             
                        if (compute_y < 63) begin
                            neighbour_count <= neighbour_count + compute_state;
                        end
                        
                        if (compute_x < 95 && compute_y < 63) begin
                            compute_addr <= (((compute_y + 1) * 96) + (compute_x + 1));
                        end 
                        state <= STATE_FETCH_BR;
                    end    
                        
                end
                
                STATE_FETCH_BR: begin
                    if (!read_wait) begin
                        read_wait <= 1; // Cycle to let BRAM fetch data
                    end else begin
                        read_wait <= 0;                 
                        if (compute_x < 95 && compute_y < 63) begin
                            neighbour_count <= neighbour_count + compute_state;
                        end
                        
                        // Now check original cell state
                        compute_addr <= (((compute_y) * 96) + (compute_x));
                        state <= STATE_FETCH_CENTER;
                    end    
                        
                end
                
                STATE_FETCH_CENTER: begin
                    if (!read_wait) begin
                        read_wait <= 1; // Cycle to let BRAM fetch data
                    end else begin 
                        read_wait <= 0;         
                        center_cell_state <= compute_state;
                        state <= STATE_WRITE;
                    end
                end
                
                STATE_WRITE: begin
                // Birth: A cell with 3 neighbours becomes alive
                // Surival: An alive cell with 2 or 3 neighbours stays alive
                // Death: All other cases
                    if (neighbour_count == 3 || (center_cell_state == 1 && neighbour_count == 2)) begin
                        compute_next_state <= 1;
                    end else begin
                        compute_next_state <= 0;
                    end
                    
                    compute_write_en <= 1;
                    
                    state <= STATE_MOVE;
                end
                
                // Increment x, y of cell to be evaluated
                STATE_MOVE: begin
                    
                    // Stop writing and prepare for the next cell
                    compute_write_en <= 0;
                    
                    if (compute_x == 95) begin
                        compute_x <= 0;
                        compute_y <= compute_y + 1;
                    end else begin
                        compute_x <= compute_x + 1;
                    end
                    
                    // Check if were at the very bottom right of the screen
                    if (compute_x == 95 && compute_y == 63) begin
                        state <= STATE_IDLE; // Finished game logic for current frame wait for the next
                    end else begin
                        state <= STATE_EVAL; // Continue cell evaluation of current frame
                    end
                   
                end
                
            
            
            
            endcase
        
        
        end
    end
    
endmodule
