module seq_detector_tb;
reg din,clk,reset;
wire y;
zero_one_detector m1(din, clk,reset, y);
initial
begin
reset=0       ;clk=1;din=1'bx;
$monitor($time, , ,"| clock = %b",clk,,"| output = %b",y,,"| reset = %b",reset,,"| input = %b",din);
#10 din=1;
#10 din=0;
#10 din=1;
#10 din=0;
#10 din=1;
#10 din=0;
#10 din=1;
#10 din=0;
#10 din=1;
//#5 reset=1;
//#5 reset=0;
end
always
#5 clk=~clk;
initial
#100 $finish ;
endmodule
