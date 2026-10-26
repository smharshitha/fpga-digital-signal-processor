module tb_moving_average;
    logic clk=0, rst_n=0, in_valid=0;
    logic signed [15:0] in_data=0, out_data;
    logic out_valid;
    always #5 clk=~clk;
    moving_average #(.DATA_W(16),.LOG2_TAPS(2)) dut(.*);
    initial begin
        repeat (3) @(posedge clk);
        rst_n <= 1;
        @(posedge clk); in_valid <= 1; in_data <= 4;
        @(posedge clk); in_data <= 8;
        @(posedge clk); in_data <= 12;
        @(posedge clk); in_data <= 16;
        @(posedge clk); in_data <= 20;
        @(posedge clk); in_valid <= 0;
        repeat (3) @(posedge clk);
        $finish;
    end
endmodule
