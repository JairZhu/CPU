`timescale 1ns / 1ps

module RegFile(
    input CLK,
    input RegWre,
    input RST,
    input [4:0] ReadReg1,
    input [4:0] ReadReg2,
    input [4:0] WriteReg,
    input [31:0] WriteData,
    output [31:0] ReadData1,
    output [31:0] ReadData2
    );
    reg [31:0] regFile[1:31]; // �Ĵ������������reg ����
        integer i;
        assign ReadData1 = (ReadReg1 == 0) ? 0 : regFile[ReadReg1]; // ���Ĵ�������
        assign ReadData2 = (ReadReg2 == 0) ? 0 : regFile[ReadReg2];
        initial begin
            for(i=1;i<32;i=i+1) regFile[i] = 0;
        end    
        always @(negedge CLK or negedge RST) begin
            if (RST == 0)
                for(i=1;i<32;i=i+1) 
                    if (i != WriteReg) regFile[i] <= 0;
                    else regFile[WriteReg] <= WriteData;
            else if(RegWre == 1 && WriteReg != 0) // WriteReg != 0��$0 �Ĵ��������޸�
                regFile[WriteReg] <= WriteData; // д�Ĵ���
        end
endmodule
