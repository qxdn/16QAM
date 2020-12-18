
module top(signal_clk,carrier_clk,reset_n,in_data,out_data);
input signal_clk,carrier_clk,reset_n;
output wire in_data,out_data;

wire signed [8:0] mod_data;

mod_16QAM mod(
	.signal_clk(signal_clk),
	.carrier_clk(carrier_clk),
	.reset_n(reset_n),
	.mod_out(mod_data),
	.serial_data(in_data)
);

demod_16QAM demod(
	.carrier_clk(carrier_clk),
	.orgin_clk(signal_clk),
	.reset_n(reset_n),
	.signal(mod_data),
	.demod_out(out_data)
);

endmodule 