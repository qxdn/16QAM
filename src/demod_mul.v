/*
* 解调乘法
*/
module demod_mul(clk,carrier_cos,carrier_sin,signal,out_i,out_q);
input clk;
input signed [7:0] carrier_cos;
input signed [7:0] carrier_sin;
input signed [8:0] signal;
output signed [7:0] out_i;
output signed [7:0] out_q;

reg signed [15:0] mul_i;
reg signed [15:0] mul_q;

assign out_i = mul_i[15:8];
assign out_q = mul_q[15:8];

always @(posedge clk) begin
	mul_i <= carrier_cos * signal;
	mul_q <= carrier_sin * signal;
end


endmodule 