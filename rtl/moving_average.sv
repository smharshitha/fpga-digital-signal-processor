module moving_average #(
    parameter int DATA_W = 16,
    parameter int LOG2_TAPS = 3
) (
    input logic clk, rst_n, in_valid,
    input logic signed [DATA_W-1:0] in_data,
    output logic out_valid,
    output logic signed [DATA_W-1:0] out_data
);
    localparam int TAPS = 1 << LOG2_TAPS;
    localparam int ACC_W = DATA_W + LOG2_TAPS;
    logic signed [DATA_W-1:0] delay_line [0:TAPS-1];
    logic signed [ACC_W-1:0] running_sum, next_sum;
    logic [$clog2(TAPS)-1:0] wr_ptr;
    logic [$clog2(TAPS+1)-1:0] count;
    integer i;
    always_comb next_sum = running_sum + in_data - delay_line[wr_ptr];
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            running_sum <= '0; wr_ptr <= '0; count <= '0;
            out_valid <= 1'b0; out_data <= '0;
            for (i=0;i<TAPS;i=i+1) delay_line[i] <= '0;
        end else begin
            out_valid <= 1'b0;
            if (in_valid) begin
                delay_line[wr_ptr] <= in_data;
                running_sum <= next_sum;
                wr_ptr <= wr_ptr + 1'b1;
                if (count < TAPS) count <= count + 1'b1;
                if (count == TAPS-1) begin
                    out_data <= next_sum >>> LOG2_TAPS;
                    out_valid <= 1'b1;
                end
            end
        end
    end
endmodule
