module G_func(inp, round, g_out);
	
	input logic [31:0] inp;
	input logic [3:0] round;
	output logic [31:0] g_out;
	
	reg [31:0] temp;
	reg [7:0]a;
	reg [31:0] A;
	
	assign temp[31:0] = {inp[23:0], inp[31:24]};
	mem subKey1(temp[31:24], A[31:24]);
	mem subKey2(temp[23:16], A[23:16]);
	mem subKey3(temp[15:8], A[15:8]);
	mem subKey4(temp[7:0], A[7:0]);
	
	always @(round)
	begin
		/*if (round < 1001)
			a[7:0] = 2 ** (round - 1);
	
		else*/
			case (round)
                                4'b0001 : a = 8'b00000001;
                                4'b0010 : a = 8'b00000010;
                                4'b0011 : a = 8'b00000100;
                                4'b0100 : a = 8'b00001000;
                                4'b0101 : a = 8'b00010000;
                                4'b0110 : a = 8'b00100000;
                                4'b0111 : a = 8'b01000000;
                                4'b1000 : a = 8'b10000000;
				4'b1001 : a = 8'b00011011;
				4'b1010 : a = 8'b00110110;
				default : a = 8'b00000000;
			endcase
	end
     
	assign g_out[31:24] = A[31:24] ^ a[7:0];
	assign g_out[23:0] = A[23:0];
        
endmodule	
