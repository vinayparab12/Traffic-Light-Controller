`timescale 1ns / 1ps
// Testbench for the traffic light controller 

module tb_trafficlightcontroller();
    reg clk,reset,sensor;
    wire [2:0] light_HW,light_FM;
    

trafficlightcontroller dut(.clk(clk),.reset(reset),.sensor(sensor),.light_HW(light_HW),.light_FM(light_FM));
   
   initial
   clk=0;
   always #1 clk=~clk; // 20ns period
   
   initial begin 
   
   reset=0;sensor=0;
   
   //hold reset for some time
   #1;
   reset=1;
   
   // wait and observe default state
   #2;
   
   // Vehicle arrives at farm road 
   sensor=1;
   #1;
   sensor=0;
   
   // let full trafic cycle complete 
   // eniugh time to see yello + green + yellow
   #45; // 2 seconds
   
   // another vehicle arrives 
   sensor = 1;
   #1;
   sensor =0;
   // run simulation longer 
   #50;
   $stop;
   
   end


    
endmodule
