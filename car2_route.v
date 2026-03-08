module car2_route(
    input      [7:0] addr,
    output reg [7:0] x,
    output reg [6:0] y
);
    always @(*) begin
        case(addr)
			  8'd0:  begin x=52; y=81;    end
			  8'd1:  begin x=52; y=80;    end
			  8'd2:  begin x=52; y=79;    end
			  8'd3:  begin x=52; y=78;    end
			  8'd4:  begin x=52; y=77;    end
			  8'd5:  begin x=53; y=76;    end
			  8'd6:  begin x=54; y=76;    end
			  8'd7:  begin x=55; y=75;    end
			  8'd8:  begin x=56; y=75;    end
			  8'd9:  begin x=57; y=75;    end
			  8'd10: begin x=58; y=75;    end
			  8'd11: begin x=59; y=74;    end
			  8'd12: begin x=60; y=74;    end
			  8'd13: begin x=61; y=73;    end
			  8'd14: begin x=62; y=72;    end
			  8'd15: begin x=63; y=71;    end
			  8'd16: begin x=64; y=70;    end
			  8'd17: begin x=64; y=69;    end
			  8'd18: begin x=65; y=68;    end
			  8'd19: begin x=65; y=67;    end
			  8'd20: begin x=66; y=66;    end
			  8'd21: begin x=66; y=65;    end
			  8'd22: begin x=67; y=64;    end
			  8'd23: begin x=67; y=63;    end
			  8'd24: begin x=67; y=62;    end
			  8'd25: begin x=67; y=61;    end
			  8'd26: begin x=67; y=60;    end
			  8'd27: begin x=67; y=59;    end
			  8'd28: begin x=67; y=58;    end
			  8'd29: begin x=67; y=57;    end
			  8'd30: begin x=67; y=56;    end
			  8'd31: begin x=66; y=55;    end
			  8'd32: begin x=66; y=54;    end
			  8'd33: begin x=66; y=53;    end
			  8'd34: begin x=65; y=52;    end
			  8'd35: begin x=65; y=51;    end
			  8'd36: begin x=64; y=50;    end
			  8'd37: begin x=64; y=49;    end
			  8'd38: begin x=63; y=48;    end
			  8'd39: begin x=62; y=47;    end
			  8'd40: begin x=61; y=46;    end
			  8'd41: begin x=60; y=46;    end
			  8'd42: begin x=59; y=45;    end
			  8'd43: begin x=58; y=45;    end
			  8'd44: begin x=57; y=44;    end
			  8'd45: begin x=56; y=44;    end
			  8'd46: begin x=55; y=44;    end
			  8'd47: begin x=54; y=43;    end
			  8'd48: begin x=53; y=43;    end
			  8'd49: begin x=52; y=43;    end
			  8'd50: begin x=51; y=43;    end
			  8'd51: begin x=50; y=43;    end
			  8'd52: begin x=49; y=43;    end
			  8'd53: begin x=48; y=43;    end
			  8'd54: begin x=47; y=43;    end
			  8'd55: begin x=46; y=43;    end
			  8'd56: begin x=45; y=43;    end
			  8'd57: begin x=44; y=44;    end
			  8'd58: begin x=43; y=44;    end
			  8'd59: begin x=42; y=45;    end
			  8'd60: begin x=41; y=45;    end
			  8'd61: begin x=40; y=46;    end
			  8'd62: begin x=39; y=47;    end
			  8'd63: begin x=38; y=48;    end
			  8'd64: begin x=37; y=49;    end
			  8'd65: begin x=37; y=50;    end
			  8'd66: begin x=36; y=51;    end
			  8'd67: begin x=36; y=52;    end
			  8'd68: begin x=35; y=53;    end
			  8'd69: begin x=35; y=54;    end
			  8'd70: begin x=35; y=55;    end
			  8'd71: begin x=34; y=56;    end
			  8'd72: begin x=34; y=57;    end
			  8'd73: begin x=33; y=58;    end
			  8'd74: begin x=32; y=58;    end
			  8'd75: begin x=31; y=58;    end
			  8'd76: begin x=30; y=58;    end
			  8'd77: begin x=29; y=58;    end
			  8'd78: begin x=28; y=58;    end
			  8'd79: begin x=27; y=58;    end
			  8'd80: begin x=26; y=58;    end
			  8'd81: begin x=25; y=58;    end
			  8'd82: begin x=24; y=58;    end
			  8'd83: begin x=23; y=58;    end
			  8'd84: begin x=22; y=58;    end
			  8'd85: begin x=21; y=58;    end
			  8'd86: begin x=20; y=58;    end
			  8'd87: begin x=19; y=58;    end
			  8'd88: begin x=18; y=58;    end
			  8'd89: begin x=17; y=58;    end
			  8'd90: begin x=16; y=58;    end
			  8'd91: begin x=15; y=58;    end
			  8'd92: begin x=14; y=58;    end
			  8'd93: begin x=13; y=58;    end
			  8'd94: begin x=12; y=58;    end
			  8'd95: begin x=11; y=58;    end
			  8'd96: begin x=10; y=58;    end
			  8'd97: begin x=9;  y=58;    end
			  8'd98: begin x=8;  y=58;    end
			  8'd99: begin x=7;  y=58;    end
			  8'd100:begin x=6;  y=58;    end
			  8'd101:begin x=5;  y=58;    end
			  8'd102:begin x=4;  y=58;    end
			  8'd103:begin x=3;  y=58;    end
			  8'd104:begin x=52; y=107;   end
			  8'd105:begin x=52; y=106;   end
			  8'd106:begin x=52; y=105;   end
			  8'd107:begin x=52; y=104;   end
			  8'd108:begin x=52; y=103;   end
			  8'd109:begin x=52; y=102;   end
			  8'd110:begin x=52; y=101;   end
			  8'd111:begin x=52; y=100;   end
			  8'd112:begin x=52; y=99;    end
			  8'd113:begin x=52; y=98;    end
			  8'd114:begin x=52; y=97;    end
			  8'd115:begin x=52; y=96;    end
			  8'd116:begin x=52; y=95;    end
			  8'd117:begin x=52; y=94;    end
			  8'd118:begin x=52; y=93;    end
			  8'd119:begin x=52; y=92;    end
			  8'd120:begin x=52; y=91;    end
			  8'd121:begin x=52; y=90;    end
			  8'd122:begin x=52; y=89;    end
			  8'd123:begin x=52; y=88;    end
			  8'd124:begin x=52; y=87;    end
			  8'd125:begin x=52; y=86;    end
			  8'd126:begin x=52; y=85;    end
			  8'd127:begin x=52; y=84;    end
			  8'd128:begin x=52; y=83;    end
			  
			  
            default: begin x=52; y=81; end
        endcase
		 end

endmodule