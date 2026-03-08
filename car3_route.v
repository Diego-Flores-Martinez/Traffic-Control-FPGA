module car3_route(
    input      [7:0] addr,
    output reg [7:0] x,
    output reg [6:0] y
);
    always @(*) begin
        case(addr) 
			  8'd0:  begin x=74; y=58;  end
			  8'd1:  begin x=73; y=58;  end
			  8'd2:  begin x=72; y=58;  end
			  8'd3:  begin x=71; y=58;  end
			  8'd4:  begin x=70; y=58;  end
			  8'd5:  begin x=69; y=58;  end
			  8'd6:  begin x=68; y=58;  end
			  8'd7:  begin x=67; y=58;  end
			  8'd8:  begin x=67; y=57;  end
			  8'd9:  begin x=67; y=56;  end
			  8'd10: begin x=66; y=55;  end
			  8'd11: begin x=66; y=54;  end
			  8'd12: begin x=66; y=53;  end
			  8'd13: begin x=65; y=52;  end
			  8'd14: begin x=65; y=51;  end
			  8'd15: begin x=64; y=50;  end
			  8'd16: begin x=64; y=49;  end
			  8'd17: begin x=63; y=48;  end
			  8'd18: begin x=62; y=47;  end
			  8'd19: begin x=61; y=46;  end
			  8'd20: begin x=60; y=46;  end
			  8'd21: begin x=59; y=45;  end
			  8'd22: begin x=58; y=45;  end
			  8'd23: begin x=57; y=44;  end
			  8'd24: begin x=56; y=44;  end
			  8'd25: begin x=55; y=44;  end
			  8'd26: begin x=54; y=43;  end
			  8'd27: begin x=53; y=43;  end
			  8'd28: begin x=52; y=43;  end
			  8'd29: begin x=52; y=42;  end
			  8'd30: begin x=52; y=41;  end
			  8'd31: begin x=52; y=40;  end
			  8'd32: begin x=52; y=39;  end
			  8'd33: begin x=52; y=38;  end
			  8'd34: begin x=52; y=37;  end
			  8'd35: begin x=52; y=36;  end
			  8'd36: begin x=52; y=35;  end
			  8'd37: begin x=52; y=34;  end
			  8'd38: begin x=52; y=33;  end
			  8'd39: begin x=52; y=32;  end
			  8'd40: begin x=52; y=31;  end
			  8'd41: begin x=52; y=30;  end
			  8'd42: begin x=52; y=29;  end
			  8'd43: begin x=52; y=28;  end
			  8'd44: begin x=52; y=27;  end
			  8'd45: begin x=52; y=26;  end
			  8'd46: begin x=52; y=25;  end
			  8'd47: begin x=52; y=24;  end
			  8'd48: begin x=52; y=23;  end
			  8'd49: begin x=52; y=22;  end
			  8'd50: begin x=52; y=21;  end
			  8'd51: begin x=52; y=20;  end
			  8'd52: begin x=52; y=19;  end
			  8'd53: begin x=52; y=18;  end
			  8'd54: begin x=52; y=17;  end
			  8'd55: begin x=52; y=16;  end
			  8'd56: begin x=52; y=15;  end
			  8'd57: begin x=52; y=14;  end
			  8'd58: begin x=52; y=13;  end
			  8'd59: begin x=52; y=12;  end
			  8'd61: begin x=98; y=58;  end
			  8'd62: begin x=97; y=58;  end
			  8'd63: begin x=96; y=58;  end
			  8'd64: begin x=95; y=58;  end
			  8'd65: begin x=94; y=58;  end
			  8'd66: begin x=93; y=58;  end
			  8'd67: begin x=92; y=58;  end
			  8'd68: begin x=91; y=58;  end
			  8'd69: begin x=90; y=58;  end
			  8'd70: begin x=89; y=58;  end
			  8'd71: begin x=88; y=58;  end
			  8'd72: begin x=87; y=58;  end
			  8'd73: begin x=86; y=58;  end
			  8'd74: begin x=85; y=58;  end
			  8'd75: begin x=84; y=58;  end
			  8'd76: begin x=83; y=58;  end
			  8'd77: begin x=82; y=58;  end
			  8'd78: begin x=81; y=58;  end
			  8'd79: begin x=80; y=58;  end
			  8'd80: begin x=79; y=58;  end
			  8'd81: begin x=78; y=58;  end
			  8'd82: begin x=77; y=58;  end
			  8'd83: begin x=76; y=58;  end
			  8'd84: begin x=75; y=58;  end
			  
			  
           default: begin x=74; y=58; end
        endcase
		 end

endmodule