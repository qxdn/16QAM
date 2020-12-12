/*
* 分频
*/
module freq_div(orgin_clk,reset_n,sys_clk);
input orgin_clk,reset_n;  //输入clk 复位
output reg sys_clk;  //分频输出

localparam DIV = 10;
localparam COUNTER = DIV/2 -1;

reg [3:0] cnt;

// 分频10M
always @(posedge orgin_clk or negedge reset_n) begin
	if (!reset_n) begin
		cnt <= 4'd0;
		sys_clk <= 1'b0;
	end else if (cnt < COUNTER) begin
		cnt <= cnt+1'd1;
		sys_clk <= sys_clk;
	end else begin
		cnt <= 4'd0;
		sys_clk <= sys_clk;
	end
end

endmodule 
