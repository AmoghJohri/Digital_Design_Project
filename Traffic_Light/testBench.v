module traffic_light_controller_tb;
    reg TA,TB,clk,reset;
    wire RA,GA,YA,RB,GB,YB;
    integer i;
    traffic_light_controller m1(TA,TB, clk, rst, RA,GA,YA,RB,GB,YB);
    traffic_sensor LFSR(clk,reset,T);

  always
    begin
      clk = 1; #5;
      clk = 0; #5;
    end

  initial
    begin
      reset = 1; #10;
      reset = 0;
    end

  initial
    begin
      $dumpfile ("dump.vcd");
      $dumpvars (0,m1);
      for (i = 0; i < 20; i = i + 1)
      begin
        TA = LFSR.Q[0];
        TB = LFSR.Q[1]; #10;
        $monitor($time, , ,"| clock = %b",clk,,"| Lane A = %b%b%b",RA,YA,GA,,"| Lane B = %b%b%b",RB,YB,GB,,"| reset = %b",reset,,"| input = %b%b",TA,TB);    
      end
      $finish;
    end
endmodule
