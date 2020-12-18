/*
*  并转串
*/
module demod_p2s(serial_clk,signal_clk,reset_n,signal,serial);
input serial_clk,signal_clk,reset_n;
input [3:0] signal;
output reg serial;

reg [3:0] buffer [0:3];
reg [3:0] cbuffer = 4'b0;
reg [1:0] address = 2'b0;
reg [1:0] counter = 2'd0;


always @(posedge signal_clk ) begin
	buffer[address+1'b1] <= signal;
end

always @(posedge serial_clk or negedge reset_n) begin
	if(!reset_n) begin
		cbuffer<=4'b0;
		counter<=2'b11;
		address<=2'b0;
		serial<=1'b0;
	end else begin
		counter = counter -1'b1;
		if (counter == 2'b11) begin
			cbuffer = buffer[address+1'b1];
			address = address +1'b1;
		end
		serial = cbuffer[counter];
	end
end


endmodule 