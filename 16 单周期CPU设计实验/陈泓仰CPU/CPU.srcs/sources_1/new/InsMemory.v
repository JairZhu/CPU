`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/10 17:54:01
// Design Name: 
// Module Name: InsMemory
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


module InsMemory(
    input [31:0] IAddress,
    input InsMemRW,
    output [5:0] op,
    output [4:0] rs,
    output [4:0] rt,
    output [4:0] rd,
    output [15:0] immediate,
    output [25:0] AJshift,
    output [4:0] sa
    );
    reg [31:0] InsDataOut;
    reg [7:0] rom [99:0]; // �洢�����������reg���ͣ��洢���洢��Ԫ8λ���ȣ���100���洢��Ԫ
    initial begin // �������ݵ��洢��rom��ע�⣺����ʹ�þ���·�����磺E:/Xlinx/VivadoProject/ROM/���Լ�����
           $readmemb ("C:/rom_data.txt", rom); // �����ļ�rom_data��.coe��.txt����δָ�����ʹ�0��ַ��ʼ��š�
     end
    always @( InsMemRW or IAddress ) begin
        if (InsMemRW == 1) // Ϊ0�����洢����������ݴ洢ģʽ
             InsDataOut[31:24] = rom[IAddress];
             InsDataOut[23:16] = rom[IAddress + 1];
             InsDataOut[15:8] = rom[IAddress + 2];
             InsDataOut[7:0] = rom[IAddress + 3];
    end
       assign op =  InsDataOut[31:26];  
       assign rs = InsDataOut[25:21];  
       assign rt = InsDataOut[20:16];  
       assign rd = InsDataOut[15:11];  
       assign immediate = InsDataOut[15:0];
       assign sa = InsDataOut[10:6];
       assign AJshift = InsDataOut[25:0];
endmodule
