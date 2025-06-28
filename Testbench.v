// Code your testbench here
// or browse Examples
`timescale 1ns / 1ps

module smart_parking_lot_tb;

  // Inputs
  reg clk;
  reg reset;
  reg entry_button;
  reg exit_button;

  // Outputs
  wire [3:0] car_count;
  wire full_led;
  wire available_led;

  // Instantiate the Design Under Test (DUT)
  smart_parking_lot dut (
    .clk(clk),
    .reset(reset),
    .entry_button(entry_button),
    .exit_button(exit_button),
    .car_count(car_count),
    .full_led(full_led),
    .available_led(available_led)
  );

  // Clock generation
  initial clk = 0;
  always #5 clk = ~clk; // 10ns clock period

  // Simulation sequence
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    $display("Starting Smart Parking Lot Simulation...");
    $monitor("Time: %0t | Cars: %d | Full: %b | Available: %b",
              $time, car_count, full_led, available_led);

    // Initial state
    reset = 1; entry_button = 0; exit_button = 0;
    #10;
    reset = 0;

    // 3 cars enter
    repeat (3) begin
      entry_button = 1;
      #10;
      entry_button = 0;
      #10;
    end

    // 1 car exits
    exit_button = 1;
    #10;
    exit_button = 0;
    #10;

    // Fill up remaining 6 slots to reach 8
    repeat (6) begin
      entry_button = 1;
      #10;
      entry_button = 0;
      #10;
    end

    // Try to overfill (should stay at 8)
    entry_button = 1;
    #10;
    entry_button = 0;
    #10;

    // 2 cars exit
    repeat (2) begin
      exit_button = 1;
      #10;
      exit_button = 0;
      #10;
    end

    // End simulation
    #20;
    $finish;
  end

endmodule
