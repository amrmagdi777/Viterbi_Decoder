module veterbi_fsm(

 input   wire                  CLK,
 input   wire                  RST,
 input   wire                  Data_Valid, 
 output  reg                   branch_enable,
 output  reg                   path_enable,
 output  reg                   memory_enable,
 output reg                    trace_enable,
 output reg                    memory_read_enable
);


// gray state encoding
parameter   [2:0]      IDLE   = 3'b000,
                       branch_metric  = 3'b001,
					   path_metric   = 3'b010,
					   memory_write = 3'b011,
             trace_back = 3'b100,
             memory_read=3'b101;
parameter seq_num = 64;  // need to be taken from upper layer 

reg         [2:0]      current_state , next_state ;
			

wire                   seq_done ;
reg 	    [5:0]      seq_counter;	
//state transiton 
always @ (posedge CLK or negedge RST)
 begin
  if(!RST)
   begin
    current_state <= IDLE ;
   end
  else
   begin
    current_state <= next_state ;
   end
 end

//seq counter 

always @ (posedge CLK or negedge RST)
 begin
  if(!RST)
   begin
    seq_counter  <= 6'b0 ;
   end
  else if (memory_enable || memory_read_enable )
   begin
    if (!seq_done)
    seq_counter <= seq_counter+1 ;
    else
    seq_counter <=6'b0;
   end
 end

 //
 
 

// next state logic
always @ (*)
 begin
  case(current_state)
  IDLE   : begin
            if(Data_Valid)
			 next_state = branch_metric ;
			else
			 next_state = IDLE ; 			
           end
  branch_metric  : begin

			 next_state = path_metric ;  

           end
  path_metric   : begin

			   next_state = memory_write ;
	  			
           end

  memory_write : begin
            if(seq_done)
			 next_state = memory_read ; 
             else
             next_state = branch_metric;
           end

  memory_read: begin
    //condition for going to idle
    if(seq_done)
    next_state = IDLE;
    else
    next_state = trace_back;
  end

  trace_back: begin
            next_state = memory_read;
  end

  default: begin
			 next_state = IDLE ; 
           end	
  endcase                 	   
 end 

 
// output logic
always @ (*)
 begin
     branch_enable = 1'b0 ;
     path_enable = 1'b0 ;	
     memory_enable = 1'b0 ;	
     trace_enable = 1'b0;
     memory_read_enable = 1'b0;


  case(current_state)
  IDLE   : begin
            branch_enable = 1'b0 ;
            path_enable = 1'b0 ;	
            memory_enable = 1'b0 ;	
            trace_enable = 1'b0;
     memory_read_enable = 1'b0;


         end
  branch_metric  : begin
            branch_enable = 1'b1 ;
            path_enable = 1'b0 ;	
            memory_enable = 1'b0 ;	
            trace_enable = 1'b0;
     memory_read_enable = 1'b0;
       
           end

  path_metric   : begin 
          			 
            branch_enable = 1'b0 ;
            path_enable = 1'b1 ;	
            memory_enable = 1'b0 ;	
            trace_enable = 1'b0;
     memory_read_enable = 1'b0;

           end
  memory_write : begin
            branch_enable = 1'b0 ;
            path_enable = 1'b0 ;	
            memory_enable = 1'b1 ;	
            trace_enable = 1'b0;
     memory_read_enable = 1'b0;

  end
  trace_back:begin
            branch_enable = 1'b0 ;
            path_enable = 1'b0 ;	
            memory_enable = 1'b0 ;	
            trace_enable = 1'b1;
     memory_read_enable = 1'b0;
  end
  memory_read:begin
                branch_enable = 1'b0 ;
            path_enable = 1'b0 ;	
            memory_enable = 1'b0 ;	
            trace_enable = 1'b0;
     memory_read_enable = 1'b1;
  end

           
           
	
  endcase         	              
 end 
 
assign seq_done = (seq_counter == seq_num-1) ? 1:0;
  

endmodule