depth =256; %存储器的单元数
widths = 8;%数据宽度为8位
%N = 0 :255;
%s =cos(2*pi *N/256);%计算0 ~2*pi之间的sin值
fidc = fopen('sin.mif','wt');
fprintf(fidc , 'depth = %d;\n',depth);
fprintf(fidc, 'width = %d;\n',widths);
fprintf(fidc, 'address_radix = UNS;\n');
fprintf(fidc,'data_radix = DEC;\n');
fprintf(fidc,'content begin\n');
for(x = 1 : depth)
fprintf(fidc,'%d:%d;\n',x-1,round(42*sin(2*pi*(x-1)/depth)));
end
fprintf(fidc, 'end;');
fclose(fidc);