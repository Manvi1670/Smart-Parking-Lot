// Code your design here
`timescale 1ns / 1ps

module smart_parking_lot (
    input wire clk,
    input wire reset,
    input wire entry_button,
    input wire exit_button,
    output reg [3:0] car_count,     // 0–8 count
    output reg full_led,
    output reg available_led
);

// FSM States (optional, could be used for expansion)
typedef enum logic [1:0] {
    IDLE = 2'b00,
    CAR_IN = 2'b01,
    CAR_OUT = 2'b10
} state_t;

state_t current_state, next_state;

// Default: synchronous logic
always @(posedge clk or posedge reset) begin
    if (reset) begin
        car_count <= 4'd0;
        current_state <= IDLE;
    end else begin
        current_state <= next_state;

        case (current_state)
            CAR_IN: begin
                if (car_count < 4'd8)
                    car_count <= car_count + 1;
            end
            CAR_OUT: begin
                if (car_count > 4'd0)
                    car_count <= car_count - 1;
            end
        endcase
    end
end

// Next state logic
always @(*) begin
    case (current_state)
        IDLE: begin
            if (entry_button && car_count < 4'd8)
                next_state = CAR_IN;
            else if (exit_button && car_count > 0)
                next_state = CAR_OUT;
            else
                next_state = IDLE;
        end
        CAR_IN, CAR_OUT: next_state = IDLE;
        default: next_state = IDLE;
    endcase
end

// LED outputs
always @(*) begin
    full_led = (car_count == 4'd8);
    available_led = (car_count < 4'd8);
end

endmodule
