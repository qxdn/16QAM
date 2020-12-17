/*
* 16QAM调制
*/
module mod_16QAM(signal_clk,carrier_clk,reset_n,mod_out);
input signal_clk,carrier_clk,reset_n;
output signed [8:0] mod_out;


//载波
wire signed [7:0] carrier_sin;
wire signed [7:0] carrier_cos;

//调制后载波
wire signed [7:0] carrier_i;
wire signed [7:0] carrier_q;

wire signed [1:0] signal_I; //I 信号
wire signed [1:0] signal_Q; //Q 信号
wire [3:0] p_data; //并行数据
wire serial_data; //串行数据
wire clk_4div; //四分频

assign signal_I = {p_data[3],p_data[1]};
assign signal_Q = {p_data[2],p_data[0]};
//载波输出
assign mod_out = carrier_i + carrier_q;

//四分频
freq_div #(.DIV(4)) u_div4(
	.orgin_clk(signal_clk),
	.reset_n(reset_n),
	.out_clk(clk_4div)
);

//数据源
data_create u_data_create(
	.clk(signal_clk),
	.reset_n(reset_n),
	.out(serial_data)
);

//串并转换
mod_s2p u_mod_s2p(
	.clk_s(signal_clk),
	.clk_p(clk_4div),
	.reset_n(reset_n),
	.signal(serial_data),
	.code(p_data)
);

// 载波生成
carrier_generator u_carrier(
	.clk(carrier_clk),
	.reset_n(reset_n),
	.sin(carrier_sin),
	.cos(carrier_cos)
);


//载波I
mod_mul  mod_mul_i(
	.clk(carrier_clk),
	.signal(signal_I),
	.carrier(carrier_cos),
	.out(carrier_i)
);


//载波Q
mod_mul mod_mul_q(
	.clk(carrier_clk),
	.signal(signal_Q),
	.carrier(carrier_sin),
	.out(carrier_q)
);

endmodule 