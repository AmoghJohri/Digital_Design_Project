module zero_one_detector(input A,clk,rst,
                         output reg Y);

    reg [2:0] current_state, next_state;
    parameter S0=3'b000,S1=3'b001,S2=3'b010;
    //next state logic
    always @(posedge clk, posedge rst)
    begin
        if(rst==1'b1)
        current_state<=S0;
    else
        current_state<=next_state;
    end
    
    always @(current_state, A)
    begin
    case(current_state)
    S0: begin 
    if(A==1)
        next_state<=S0;
    else
        next_state<=S1;
        end
    S1: begin 
    if(A==1)
        next_state<=S2;
    else
        next_state<=S1;
        end
    S2: begin 
    if(A==1)
        next_state<=S0;
    else
        next_state<=S1;
        end
    default: next_state<=S0;
    endcase
    end



    //output logic
    always @(next_state)
    begin
    case(next_state)
    S0: 
        Y<=0;
    S1:
        Y<=0;
    S2:
        Y<=1;
    default: Y<=0;
    endcase
    end
endmodule