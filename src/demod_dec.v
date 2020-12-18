/*
* 判决
*/
module demod_dec(fir_data,reset_n,carrier_clk,signal_clk,signal);
input signed [19:0] fir_data;
input reset_n,carrier_clk,signal_clk;
output reg [1:0] signal;

localparam N = 16'd5000;
reg [1:0] buffer;
reg signed [19:0] fir_buffer;

always @(posedge carrier_clk or negedge reset_n) begin
	if(!reset_n) begin
		buffer <= 2'd0;
	end else begin
		buffer[1] <= (fir_data>0?1'b0:1'b1); //赋值
		if(fir_data < 0) begin
			fir_buffer <= -fir_data;
		end else begin
			fir_buffer <= fir_data;
		end
		buffer[0] <= (fir_buffer>N? 1'b1:1'b0); //赋值
	end
end

always @(posedge signal_clk or negedge reset_n) begin
	if(!reset_n) begin
		signal<=2'b0;
	end else begin
		signal<=buffer;
	end
end

endmodule 

