module rom_base(
    input  wire clk,
    input  wire [14:0] addr,         // 19200 = 2^14
    output reg  [11:0] data          // 4:4:4 RGB
);

    reg [11:0] mem [0:19199];

    initial begin
        $readmemh("Base1.hex", mem);
    end

    always @(posedge clk) begin
        data <= mem[addr];
    end

endmodule