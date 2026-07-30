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
    
    output [12:0] compute_addr,
    
    output compute_next_state,
    output reg compute_write_en
    
    );
    
    assign compute_addr = (compute_y * 96) + compute_x;
    
    reg [6:0] compute_x; 
    reg [5:0] compute_y; 
   
    
    // States
    localparam STATE_IDLE = 3'd0;
    localparam STATE_CELLSCAN = 3'd1;
    
    reg [2:0] state;
    
    // Default values
    initial begin
        compute_x = 1'b0;
        compute_y = 1'b0;
    end
    
    always @(posedge clk) begin
        if (rst) begin
            state <= 0;
        end
        
        else begin
            case(state)
                STATE_IDLE: begin
                    if (render_done) begin
                        state <= STATE_CELLSCAN;
                    end
                    
                
                end
            
            
            
            endcase
        
        
        end
    end
    
endmodule
