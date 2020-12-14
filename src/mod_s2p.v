/*
* 调制 串并转换
*/
module mod_s2p(clk_s,clk_p,reset_n,signal,code);
input clk_s,clk_p,reset_n,signal;
output reg [3:0] code;

reg [3:0] buffer;

always @(posedge clk_s or negedge reset_n) begin
	if(!reset_n) begin
		buffer <= 4'b0000;
	end else begin
		buffer <= {buffer[2:0],signal};
	end
end

always @(posedge clk_p or negedge reset_n) begin
	if(!reset_n) begin
		code <= 4'b0000;
	end else begin
		code <= buffer;
	end
end

endmodule 