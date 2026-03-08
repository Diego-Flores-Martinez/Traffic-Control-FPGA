module Proyectofinal (
    input  wire CLOCK_50,
    input  wire [1:0] SW,
    output wire VGA_HS,
    output wire VGA_VS,
    output wire [3:0] VGA_R,
    output wire [3:0] VGA_G,
    output wire [3:0] VGA_B
);

    wire emergency = SW[1];
	 wire reset = SW[0];
	 
	 wire [7:0] c1_x, c2_x, c3_x, c4_x;
    wire [6:0] c1_y, c2_y, c3_y, c4_y;

	 wire video_on;
    wire [9:0] px, py;
    wire [7:0] img_x = px[9:2];
    wire [6:0] img_y = py[8:2];

    wire [1:0] L0,L1,L2,L3,LP,emg;
    wire [3:0] est;
	 
    wire [11:0] base_color;
    wire [13:0] rom_addr = img_y * 14'd160 + img_x;
	 
	 reg [7:0] idx1, idx2, idx3, idx4;
    reg pix_clk;

    wire [3:0] R, G, B;
	 
    reg [20:0] slow_anim;
    wire tick_anim = (slow_anim == 0);
    always @(posedge CLOCK_50 or posedge reset)
        if (reset) slow_anim <= 0;
        else slow_anim <= slow_anim + 1;
		  
    always @(posedge CLOCK_50 or posedge reset)
        if (reset) begin
            idx1 <= 0; idx2 <= 0; idx3 <= 0; idx4 <= 0;
        end
        else if (!emergency && tick_anim) begin
            if (L0 == 2'b10 || L0 == 2'b01)
                idx1 <= (idx1 == 8'd129) ? 0 : idx1 + 1;
            if (L1 == 2'b10 || L1 == 2'b01)
                idx2 <= (idx2 == 8'd129) ? 0 : idx2 + 1;
            if (L2 == 2'b10 || L2 == 2'b01)
                idx3 <= (idx3 == 8'd129) ? 0 : idx3 + 1;
            if (L3 == 2'b10 || L3 == 2'b01)
                idx4 <= (idx4 == 8'd129) ? 0 : idx4 + 1;
        end
		  
		  

    always @(posedge CLOCK_50 or posedge reset)
        if (reset) pix_clk <= 0;
        else pix_clk <= ~pix_clk;

    vga_sync_640x480 vga(
        .clk(pix_clk),
        .reset(reset),
        .hsync(VGA_HS),
        .vsync(VGA_VS),
        .video_on(video_on),
        .pix_x(px),
        .pix_y(py)
    );

    semaforo FSM(
        .clk(CLOCK_50),
        .reset(reset),
        .emergency(emergency),
        .light0(L0),
        .light1(L1),
        .light2(L2),
        .light3(L3),
        .lightP(LP),
        .state(est),
		  .emg(emg)
    );

    rom_base fondo(
        .clk(pix_clk),
        .addr(rom_addr),
        .data(base_color)
    );

    car1_route R1(.addr(idx1), .x(c1_x), .y(c1_y));
    car2_route R2(.addr(idx2), .x(c2_x), .y(c2_y));
    car3_route R3(.addr(idx3), .x(c3_x), .y(c3_y));
    car4_route R4(.addr(idx4), .x(c4_x), .y(c4_y));

    map_generator Map(
        .x(img_x), .y(img_y), .emergency(emergency),
        .c1_x(c1_x), .c1_y(c1_y),
        .c2_x(c2_x), .c2_y(c2_y),
        .c3_x(c3_x), .c3_y(c3_y),
        .c4_x(c4_x), .c4_y(c4_y),
        .L0(L0), .L1(L1), .L2(L2), .L3(L3), .LP(LP), .emg(emg),
        .base_color(base_color),
        .state(est),       	  
        .R(R), .G(G), .B(B)
    );

    assign VGA_R = video_on ? R : 4'd0;
    assign VGA_G = video_on ? G : 4'd0;
    assign VGA_B = video_on ? B : 4'd0;

endmodule