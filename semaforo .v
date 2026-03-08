module semaforo (
    input  wire clk,
    input  wire reset,
    input  wire emergency,
    output reg  [1:0] light0, light1, light2, light3, lightP, emg,
    output reg  [3:0] state
);

    // Estados 
    localparam [3:0] e0 = 4'b0000;  // light0 Verde
    localparam [3:0] e1 = 4'b0001;  // light0 Ambar
    localparam [3:0] e2 = 4'b0010;  // light1 Verde
    localparam [3:0] e3 = 4'b0011;  // light1 Ambar
    localparam [3:0] e4 = 4'b0100;  // light2 Verde
    localparam [3:0] e5 = 4'b0101;  // light2 Ambar
    localparam [3:0] e6 = 4'b0110;  // light3 Verde
    localparam [3:0] e7 = 4'b0111;  // light3 Ambar
    localparam [3:0] e8 = 4'b1000;  // lightP Verde
    localparam [3:0] e9 = 4'b1001;  // lightP Ambar

    // Colores
    localparam [1:0] RED   = 2'b00;
    localparam [1:0] AMBER = 2'b01;
    localparam [1:0] GREEN = 2'b10;

    // Registros internos
    reg [31:0] counter;
    reg [31:0] timeout_value;
    reg [3:0]  next_state;

    // Logica secuencial con RESET
	always @(posedge clk or posedge reset) begin
		 if (reset) begin
			  state <= e0;
			  counter <= 0;
		 end else if (emergency) begin
			  state <= state;
			  counter <= counter;
		 end else if (counter >= timeout_value) begin
			  state <= next_state;
			  counter <= 0;
		 end else begin
			  counter <= counter + 1;
		 end
	end

    // Duraciones por estado 
    always @(*) begin
        case (state)
            e0: timeout_value = 32'd350000000; // 7 segundos Verde
            e1: timeout_value = 32'd150000000; // 3 segundos Ambar
            e2: timeout_value = 32'd350000000; // 7 segundos Verde
            e3: timeout_value = 32'd150000000; // 3 segundos Ambar
            e4: timeout_value = 32'd350000000; // 7 segundos Verde
            e5: timeout_value = 32'd150000000; // 3 segundos Ambar
            e6: timeout_value = 32'd350000000; // 7 segundos Verde
            e7: timeout_value = 32'd150000000; // 3 segundos Ambar
            e8: timeout_value = 32'd500000000; // 10 segundos Verde
            e9: timeout_value = 32'd150000000; // 3 segundos Ambar
            default: timeout_value = 32'd25000000;
        endcase
    end

    // Transiciones
    always @(*) begin
        case (state)
            e0: next_state = e1;
            e1: next_state = e2;
            e2: next_state = e3;
            e3: next_state = e4;
            e4: next_state = e5;
            e5: next_state = e6;
            e6: next_state = e7;
            e7: next_state = e8;
            e8: next_state = e9;
            e9: next_state = e0;
            default: next_state = e0;
        endcase
    end

    // Salidas de luces
always @(*) begin
    // Valores por defecto (RED)
    light0 = RED;
    light1 = RED;
    light2 = RED;
    light3 = RED;
    lightP = RED;
	emg    = RED;

    if (emergency) begin
	    emg = GREEN;
    end else begin
        case(state)
            e0: light0 = GREEN;
            e1: light0 = AMBER;
            e2: light1 = GREEN;
            e3: light1 = AMBER;
            e4: light2 = GREEN;
            e5: light2 = AMBER;
            e6: light3 = GREEN;
            e7: light3 = AMBER;
            e8: lightP = GREEN;
            e9: lightP = AMBER;
        endcase
    end
end


endmodule