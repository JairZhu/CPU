`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/15 21:17:29
// Design Name: 
// Module Name: avoidshake
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module avoidshake(
    input BJ_CLK, //�ɼ�ʱ�ӣ�40Hz
    input BUTTON_IN, //���������ź�
    output BUTTON_OUT //�����������ź�
    );
   reg BUTTON_IN_Q, BUTTON_IN_2Q, BUTTON_IN_3Q;
    always @(posedge BJ_CLK)begin
         begin
            BUTTON_IN_Q <= BUTTON_IN;
            BUTTON_IN_2Q <= BUTTON_IN_Q;
            BUTTON_IN_3Q <= BUTTON_IN_2Q;
         end
    end
    assign BUTTON_OUT = BUTTON_IN_2Q | BUTTON_IN_3Q;
endmodule
