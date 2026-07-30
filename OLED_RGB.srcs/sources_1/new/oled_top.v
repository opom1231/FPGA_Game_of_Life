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
    
    wire frame_tick;  
//    wire pixel_state; // Output from RAM to render_engine
    
    // Buffer switch, 0 = RAM 1 (front buffer), RAM 2 (back buffer)
    // 1 = RAM 1 and RAM 2 switch 
    reg buffer_sel = 0;  
    wire [12:0] read_addr;
    wire [12:0] compute_addr;
    wire compute_next_state;
    wire compute_write_en;
   
    // To decouple output
    wire ram1_compute_state, ram2_compute_state;
    wire ram1_read_state, ram2_read_state;
    
    
    // Multiplexers
    // Determine whether we are starting up or rendering screen
    wire spi_start_mux = (init_done) ? render_spi_start : init_spi_start;
    // Determine where the data is coming from
    wire [7:0] data_mux = (init_done) ? render_spi_data : init_spi_data;
    // Who is controlling the data/command pin
    assign oled_dc = (init_done) ? render_dc : 1'b0; // Init only sends commands
    
    // buffer_sel starts at 0, ram 2 controls the current frame state and sends the next
    // state into ram 1
    // On frame tick we swap roles, ram 1 has the current frame and ram 2 will get the next
    
    // Depending on frame tick either front or back buffer controls i/o into render and compute engine
    wire pixel_state = (buffer_sel) ? ram1_read_state : ram2_read_state;
    wire compute_state = (buffer_sel) ? ram1_compute_state : ram2_compute_state;
    
    // Check for a frame tick in render_engine to update buffer_sel
    always @(posedge clk) begin
        if(frame_tick == 1) begin
            buffer_sel <= ~buffer_sel;
        end 
    end
    
   // RAM 1
   // Starts empty
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
   
   // Switches on frame tick
   
   // RAM 2
   // Starts with data from .coe file
   frame_ram front_buffer(
   // Port A: Read Only
        .clka(clk),
        .ena(1'b1), // always on
        .wea(1'b0), 
        .addra(read_addr), // address to be used from render_engine
        .dina(1'b0),
        .douta(ram2_read_state), // into pixel_state mux
        
       // Port B: Computing
       // Will start with WE = 0
        .clkb(clk),
        .enb(1'b1), // always on
        .web(buffer_sel ? compute_write_en : 1'b0), // controlled by compute_engine 
        .addrb(compute_addr),   
        .dinb(compute_next_state), // If WE = 1, update compute address with new state
        .doutb(ram2_compute_state) // into compute_state mux
   );
   
    
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

        // Mux and spi_master connections
        .init_done(init_done), // Input sent by init_engine. Are we done startup sequence?
        .spi_status(spi_status), // Input sent by spi_master. Are we currently sending data?
        .spi_start(render_spi_start),   // Output sent to render_spi_start for start mux
        .spi_data(render_spi_data), // Output for data mux
        
        .render_dc(render_dc), // Output determined by render_engine
        .frame_tick(frame_tick),
        .read_addr(read_addr),
        .pixel_state(pixel_state)
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
    
    // Handles neighbouring cell state logic
    compute_engine compute_engine (
        .clk(clk),
        .rst(rst),
        .render_done(frame_tick),
        .compute_state(compute_state),
        .compute_next_state(compute_next_state),
        .compute_write_en(compute_write_en),
        .compute_addr(compute_addr)
    
    );
    
    
endmodule
