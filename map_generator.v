module map_generator(
    input wire [7:0] x,
    input wire [6:0] y,
    input wire emergency,

    input wire [7:0] c1_x, c2_x, c3_x, c4_x,
    input wire [6:0] c1_y, c2_y, c3_y, c4_y,

    input wire [1:0] L0, L1, L2, L3, LP,emg,   // Luces de los semaforos
    input wire [11:0] base_color,
	 input wire [3:0] state,   // Estado actual

    output reg [3:0] R,
    output reg [3:0] G,
    output reg [3:0] B
);
	 
    reg [11:0] C;

    // Semaforos grandes (autos)
    wire [11:0] S0, S1, S2, S3;

    traffic_light #(.X0(117), .Y0(53), .W(6), .H(6)) SEM1A (x,y,L0,S0);
    traffic_light #(.X0(135), .Y0(53), .W(6), .H(6)) SEM2A (x,y,L1,S1);
    traffic_light #(.X0(117), .Y0(69), .W(6), .H(6)) SEM3A (x,y,L2,S2);
    traffic_light #(.X0(135), .Y0(69), .W(6), .H(6)) SEM4A (x,y,L3,S3);

    // Semaforos de la rotonda (autos)
    wire [11:0] M0, M1, M2, M3;

    traffic_light #(.X0(24), .Y0(68), .W(3), .H(2)) SEM1B (x,y,L0,M0);
    traffic_light #(.X0(59), .Y0(85), .W(3), .H(2)) SEM2B (x,y,L1,M1);
    traffic_light #(.X0(76), .Y0(50), .W(3), .H(2)) SEM3B (x,y,L2,M2);
    traffic_light #(.X0(41), .Y0(32), .W(3), .H(2)) SEM4B (x,y,L3,M3);

    // Semaforos peatonales de la rotonda
    wire [11:0] PE0, PE1, PE2, PE3;

    traffic_light #(.X0(58), .Y0(32), .W(3), .H(2)) PEA0 (x,y,LP,PE0);
    traffic_light #(.X0(26), .Y0(49), .W(3), .H(2)) PEA1 (x,y,LP,PE1);
    traffic_light #(.X0(76), .Y0(68), .W(3), .H(2)) PEA2 (x,y,LP,PE2);
    traffic_light #(.X0(42), .Y0(85), .W(3), .H(2)) PEA3 (x,y,LP,PE3);

    // Semaforo grande (Peatonol)
    wire [11:0] PEBIG;
    traffic_light #(.X0(126), .Y0(85), .W(6), .H(6)) PEA_BIG (x,y,LP,PEBIG);

    // Semaforo de emergencia	 
    wire [11:0] EMG;
    traffic_light #(.X0(126), .Y0(102), .W(6), .H(6)) SEM_EMG (x,y,emg, EMG);
	
	// Cuadros con el estado actual
	wire [11:0] STATE_NUM;
    state_numbers state_num(
        .x(x),
        .y(y),
        .state(state),
        .color(STATE_NUM)
    );	

		 always @(*) begin
		 	  C = base_color;   // fondo por defecto

			  // Emergencia grande 
			  if (EMG != 12'hFFF) C = EMG;
			  
			  // Semaforos grandes (autos)
			  if (S0 != 12'hFFF) C = S0;
			  if (S1 != 12'hFFF) C = S1;
			  if (S2 != 12'hFFF) C = S2;
			  if (S3 != 12'hFFF) C = S3;

			  // Semaforos de la rotonda (autos)
			  if (M0 != 12'hFFF) C = M0;
			  if (M1 != 12'hFFF) C = M1;
			  if (M2 != 12'hFFF) C = M2;
			  if (M3 != 12'hFFF) C = M3;

			  // Semaforos peatonales de la rotonda
			  if (PE0 != 12'hFFF) C = PE0;
			  if (PE1 != 12'hFFF) C = PE1;
			  if (PE2 != 12'hFFF) C = PE2;
			  if (PE3 != 12'hFFF) C = PE3;

			  // Semaforo grande (Peatonol)
			  if (PEBIG != 12'hFFF) C = PEBIG;
			  
			  // Coches
			  if ((x==c1_x)&&(y==c1_y)) C = 12'hF73;
			  if ((x==c2_x)&&(y==c2_y)) C = 12'hF73;
			  if ((x==c3_x)&&(y==c3_y)) C = 12'hF73;
			  if ((x==c4_x)&&(y==c4_y)) C = 12'hF73;
			  
			  // Cuadros de los estados
              if (STATE_NUM != 12'hFFF) C = STATE_NUM;	

			  // Salida RGB 4:4:4
			  R = C[11:8];
			  G = C[7:4];
			  B = C[3:0];
		 end

endmodule