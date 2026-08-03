`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2026 04:16:32 PM
// Design Name: 
// Module Name: tb_compute_engine
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


module tb_compute_engine();
    logic clk;
    logic rst;
    logic render_done;
    logic compute_state;
    logic [12:0] compute_addr;
    logic compute_next_state;
    logic compute_write_en;
    logic frame_tick;
    logic [12:0] read_addr;
    logic ram1_read_state;
    logic buffer_sel;
    logic ram1_compute_state;
    
    
    compute_engine uut (
        .clk(clk),
        .rst(rst),
        .render_done(frame_tick),
        .compute_state(ram1_compute_state),
        .compute_next_state(compute_next_state),
        .compute_write_en(compute_write_en),
        .compute_addr(compute_addr)
    );
    
    frame_ram back_buffer(
   // Port A: Read Only
        .clka(clk),
        .ena(1'b1), // always on
        .wea(1'b0),
        .addra(read_addr), // address to be used from render_engine
        .dina(1'b0), 
        .douta(ram1_read_state), 
        
       // Port B: Computing
       // Will start with WE input from compute_engine
        .clkb(clk),
        .enb(1'b1), // always on
        .web(buffer_sel ?  1'b0 : compute_write_en), 
        .addrb(compute_addr),   
        .dinb(compute_next_state), // Begins by storing updated cell states from compute_engine
        .doutb(ram1_compute_state)
    );
    
    // 100 MHz clock
    always #5 clk = ~clk;
    
    initial begin
        clk = 0;
        rst = 0;
        frame_tick = 0;
        buffer_sel = 0;
        
        #20;
        rst = 1;
        
        #20;
        rst = 0;
        frame_tick = 1;
        #10;
        frame_tick = 0;
        #1000000;
        
        
       
    
        $finish;
    end


endmodule
