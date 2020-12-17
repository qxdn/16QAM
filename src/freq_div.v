/*
* 分频
*/
module freq_div #(parameter DIV = 4)  (orgin_clk,reset_n,out_clk);
input orgin_clk,reset_n;  //输入clk 复位
output reg out_clk;  //分频输出


localparam COUNTER = DIV/2-1;

reg [$clog2(COUNTER)-1:0] cnt;

// 分频
always @(posedge orgin_clk or negedge reset_n) begin
	if (!reset_n) begin
		cnt <= 0;
		out_clk <= 1'b0;
	end else if (cnt < COUNTER) begin
		cnt <= cnt+1'd1;
		out_clk <= out_clk;
	end else begin
		cnt <= 0;
		out_clk <= ~out_clk;
	end
end

endmodule 
