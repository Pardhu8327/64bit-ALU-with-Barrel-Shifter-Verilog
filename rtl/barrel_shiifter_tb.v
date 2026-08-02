`timescale 1ns/1ps

module barrel_shifter_tb;

reg  [63:0] din;
reg  [5:0]  shift;
reg         dir;
reg         arth_shift;
wire [63:0] dout;

// Instantiate Barrel Shifter
barrel_shifter uut (
    .din(din),
    .shift(shift),
    .dir(dir),
    .arth_shift(arth_shift),
    .dout(dout)
);

initial begin
    // Display format
    $display("time\t din\t\t\t shift dir arth dout");
    $monitor("%0t\t %h\t %d\t %b\t %b\t %h",
              $time, din, shift, dir, arth_shift, dout);

    // -------- Test 1: Left Shift --------
    din = 64'h123456789ABCDEF0; shift = 0; dir = 0; arth_shift = 0;
    #5 shift = 6'd4;
    #5 shift = 6'd8;
    #10;

    // -------- Test 2: Logical Right Shift --------
    din = 64'h123456789ABCDEF0; dir = 1; arth_shift = 0;
    shift = 6'd2;
    #5 shift = 6'd6;
    #5 shift = 6'd10;
    #10;

    // -------- Test 3: Arithmetic Right Shift --------
    din = 64'hF23456789ABCDEF0; dir = 1; arth_shift = 1;
    shift = 6'd1;
    #5 shift = 6'd4;
    #5 shift = 6'd12;
    #10;

    // -------- Test 4: Edge Case (Sign Bit) --------
    din = 64'h8000000000000001; dir = 1; arth_shift = 1;
    shift = 6'd1;
    #5 shift = 6'd3;
    #10;

    // -------- Test 5: All Ones --------
    din = 64'hFFFFFFFFFFFFFFFF; dir = 1; arth_shift = 1;
    shift = 6'd8;
    #5 shift = 6'd16;
    #10;

    // -------- Test 6: Alternating Pattern --------
    din = 64'hAAAAAAAAAAAAAAAA; dir = 0; arth_shift = 0;
    shift = 6'd1;
    #5 shift = 6'd5;
    #5 shift = 6'd20;
    #10;

    $finish;
end

endmodule
