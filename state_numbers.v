module state_numbers(
    input  wire [14:0] x,       // Eje x del panel
    input  wire [13:0] y,       // Eje y del panel
    input  wire [3:0] state,    // Estado actual
    output reg  [11:0] color    // Color final del pixel
);

	//Parametros de los cuadros
    parameter NUM_WIDTH  = 17;
    parameter NUM_HEIGHT = 9;
    parameter NUM_X      = 121;
    parameter NUM_Y      = 22;
    parameter TOTAL_PIXELS = NUM_WIDTH * NUM_HEIGHT;  // 153
 
    // Memorias de los numeros por estado
	reg [11:0] mem_state0 [0:TOTAL_PIXELS-1]; 
    reg [11:0] mem_state1 [0:TOTAL_PIXELS-1];
    reg [11:0] mem_state2 [0:TOTAL_PIXELS-1];
    reg [11:0] mem_state3 [0:TOTAL_PIXELS-1];
    reg [11:0] mem_state4 [0:TOTAL_PIXELS-1];
    reg [11:0] mem_state5 [0:TOTAL_PIXELS-1];
    reg [11:0] mem_state6 [0:TOTAL_PIXELS-1];
    reg [11:0] mem_state7 [0:TOTAL_PIXELS-1];
    reg [11:0] mem_state8 [0:TOTAL_PIXELS-1];
    reg [11:0] mem_state9 [0:TOTAL_PIXELS-1];

    initial begin
        $readmemh("Palabras_Estado0.hex", mem_state0);
        $readmemh("Palabras_Estado1.hex", mem_state1);
        $readmemh("Palabras_Estado2.hex", mem_state2);
        $readmemh("Palabras_Estado3.hex", mem_state3);
        $readmemh("Palabras_Estado4.hex", mem_state4);
        $readmemh("Palabras_Estado5.hex", mem_state5);
        $readmemh("Palabras_Estado6.hex", mem_state6);
        $readmemh("Palabras_Estado7.hex", mem_state7);
        $readmemh("Palabras_Estado8.hex", mem_state8);
        $readmemh("Palabras_Estado9.hex", mem_state9);
    end

    // Calcular direccion del pixel dentro del cuadro
    wire [7:0] local_x = x - NUM_X;
    wire [7:0] local_y = y - NUM_Y;
    wire [7:0] pixel_addr = local_y * NUM_WIDTH + local_x;

    // Logica combinacional
	always @(*) begin
        // Por defecto no dibuja nada (transparente)
        color = 12'hFFF;  

        if (x >= NUM_X && x < NUM_X + NUM_WIDTH &&
            y >= NUM_Y && y < NUM_Y + NUM_HEIGHT) begin
            case(state)
                4'd0: color = mem_state0[pixel_addr];
                4'd1: color = mem_state1[pixel_addr];
                4'd2: color = mem_state2[pixel_addr];
                4'd3: color = mem_state3[pixel_addr];
                4'd4: color = mem_state4[pixel_addr];
                4'd5: color = mem_state5[pixel_addr];
                4'd6: color = mem_state6[pixel_addr];
                4'd7: color = mem_state7[pixel_addr];
                4'd8: color = mem_state8[pixel_addr];
                4'd9: color = mem_state9[pixel_addr];
                default: color = 12'hFFF;
            endcase
        end
    end

endmodule
