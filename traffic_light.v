module traffic_light #(
    parameter X0 = 0,
    parameter Y0 = 0,
    parameter W  = 5,
    parameter H  = 5
)(
    input  wire [7:0] x,
    input  wire [6:0] y,
    input  wire [1:0] L,
    output reg  [11:0] C
	 
);

    function [11:0] luz;
        input [1:0] L;
        case(L)
            2'b00: luz = 12'hC65;  // rojo
            2'b01: luz = 12'hE95;  // ambar
            2'b10: luz = 12'h7A3;  // verde
            default: luz = 12'hC65;
        endcase
    endfunction

    always @(*) begin
        if (x >= X0 && x < X0+W &&
            y >= Y0 && y < Y0+H)
            C = luz(L);
        else
            C = 12'hFFF;  // transparente
    end
endmodule