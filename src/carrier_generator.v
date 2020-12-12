/*
* 载波产生
*/
module carrier_generator(clk,reset_n,sin,cos);
input clk,reset_n;
output signed [7:0] sin;
output signed [7:0] cos;

reg [7:0] address;

//address生成
always @(posedge clk or negedge reset_n) begin
	if (!reset_n) begin
		address <= 8'd0;
	end else begin
		address <= address + 1'b1;
	end
end

//生成sin
sin_generator u_sin(
	.clock(clk),
	.address(address),
	.q(sin)
);

//生成cos
cos_generator u_cos(
	.clock(clk),
	.address(address),
	.q(cos)
);

endmodule 