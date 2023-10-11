module RegFile #(parameter WIDTH = 8, DEPTH = 64, ADDR = 6 )

(
input    wire                CLK,
input    wire                RST,
input    wire                WrEn,
input    wire                RdEn,
input    wire   [ADDR-1:0]   Address,
input    wire   [WIDTH-1:0]  WrData,
output   reg    [WIDTH-1:0]  RdData
//output   reg                 RdData_VLD


);

integer I ; 


reg [WIDTH-1:0] regArr [DEPTH-1:0] ;

always @(posedge CLK or negedge RST)
 begin
   if(!RST)  // Asynchronous active low reset 
    begin
     //RdData_VLD <= 1'b0 ;
     RdData     <= 1'b0 ;
      for (I=0 ; I < DEPTH ; I = I +1)
        begin
          regArr[I] <= 'b0 ;
        end
     end
   else if (WrEn && !RdEn) // Register Write Operation
     begin
      regArr[Address] <= WrData ;
     end
   else if (RdEn && !WrEn) // Register Read Operation
     begin
       RdData <= regArr[Address] ;
       //RdData_VLD <= 1'b1 ;
     end
   else
     begin
       //RdData_VLD <= 1'b0 ;
     end
  end


     

endmodule