module vga_sync_640x480(
    input wire clk,
    input wire reset,
    output reg hsync,
    output reg vsync,
    output wire video_on,
    output reg [9:0] pix_x,
    output reg [9:0] pix_y
);

    localparam HD=640, HF=16, HS=96, HB=48;
    localparam HMAX=HD+HF+HS+HB-1;

    localparam VD=480, VF=10, VS=2, VB=33;
    localparam VMAX=VD+VF+VS+VB-1;

    reg [9:0] hcount=0, vcount=0;

    always @(posedge clk or posedge reset)
        if(reset) begin hcount<=0; vcount<=0; end
        else begin
            if(hcount==HMAX) begin
                hcount<=0;
                vcount <= (vcount==VMAX)?0:vcount+1;
            end
            else hcount<=hcount+1;
        end

    assign video_on = (hcount<HD)&&(vcount<VD);
    always @(*) begin pix_x=hcount; pix_y=vcount; end

    always @(*) begin
        hsync = ~((hcount>=HD+HF)&&(hcount<HD+HF+HS));
        vsync = ~((vcount>=VD+VF)&&(vcount<VD+VF+VS));
    end

endmodule