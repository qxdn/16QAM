depth =256; %�洢���ĵ�Ԫ��
widths = 8;%���ݿ��Ϊ8λ
%N = 0 :255;
%s =cos(2*pi *N/256);%����0 ~2*pi֮���sinֵ
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