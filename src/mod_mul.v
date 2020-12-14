/*
* 调制乘法
*/
module mod_mul(clk,signal,carrier,out);
input clk;
input [1:0] signal;
input signed [7:0] carrier;
output reg signed [7:0] out;

always @(posedge clk) begin
	case(signal)
		2'b00: out<= carrier*3'd1;
		2'b01: out<= carrier*3'd3;
		2'b10: out<= carrier*-3'd1;
		2'b11: out<= carrier*-3'd1;
		default:;
	endcase
end


endmodule 