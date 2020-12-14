/*
* 数字信号源
*/
module data_create(clk,reset_n,out);
input clk,reset_n;
output wire out;

localparam CODE = 16'b1001_1111_0101_0110;

reg [3:0] address = 4'b0000;

assign out = CODE[address];

always @(posedge clk or negedge reset_n) begin
	if (!reset_n) begin
		address<=4'b0000;
	end else begin
		address<=address+1'b1;
	end
end

endmodule 