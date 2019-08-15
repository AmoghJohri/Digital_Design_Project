module traffic_light_controller(input TA,TB, clk, rst, 
                                output reg RA,GA,YA,RB,GB,YB);
    
             reg [2:0] current_state, next_state;
             parameter S0=3'b000,S1=3'b001,S2=3'b010,S3=3'b011;
    
    //next state logic
    always @(posedge clk, posedge rst)
    begin
        if(rst==1'b1)
            current_state<=S0;
        else
            current_state<=next_state;
    end
    
    always @(current_state, TA, TB)
    begin
        case(current_state)
        S0: begin 
        if(TA==1)
            next_state<=S0;
        else
            next_state<=S1;
    end
    
    S1: begin 
            next_state<=S2;
        end
    
    S2: begin 
        if(TB==1)
            next_state<=S2;
        else
            next_state<=S3;
        end
    
    S3: begin
        next_state<=S0;
            end
    
            default: next_state<=S0;
        endcase
    end



    //output logic
    always @(next_state)
    begin
        case(next_state)
    
    S0: begin
            RA<=0;
            GA<=1;
            YA<=0;

            RB<=1;
            GB<=0;
            YB<=0;
        end
    
    S1: begin
            RA<=0;
            GA<=0;
            YA<=1;

            RB<=1;
            GB<=0;
            YB<=0;
        end
    
    S2: begin
            RA<=1;
            GA<=0;
            YA<=0;

            RB<=0;
            GB<=1;
            YB<=0;
        end
    
    S3: begin
            RA<=1;
            GA<=0;
            YA<=0;

            RB<=0;
            GB<=0;
            YB<=1;
        end
    
    default: begin
            RA<=0;
            GA<=0;
            YA<=0;

            RB<=0;
            GB<=0;
            YB<=0;
            end
        endcase
    end

endmodule
    //Random traffic
module traffic_sensor(input clk, input reset, output reg T);
  output reg [4:0] Q;
  wire feed_back;

  assign feed_back = ~(Q[2] ^ Q[4]);

  always @ (posedge clk, posedge reset)
    begin
      if (reset)
        begin
          Q = 5'b00000;
          T = 1'b0;
        end
      else
        begin
          T = Q[1];
          Q = {Q[3:0], feed_back};
        end
    end
endmodule
