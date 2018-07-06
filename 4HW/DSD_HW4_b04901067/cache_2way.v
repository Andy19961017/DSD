module cache(
    clk,
    proc_reset,
    proc_read,
    proc_write,
    proc_addr,
    proc_rdata,
    proc_wdata,
    proc_stall,
    mem_read,
    mem_write,
    mem_addr,
    mem_rdata,
    mem_wdata,
    mem_ready
);
    
//==== input/output definition ============================
    input               clk;
    // processor interface
    input               proc_reset;
    input               proc_read, proc_write;
    input   [29:0]      proc_addr;
    input   [31:0]      proc_wdata;
    output reg          proc_stall;
    output reg [31:0]   proc_rdata;
    // memory interface
    input  [127:0]      mem_rdata;
    input               mem_ready;
    output reg          mem_read, mem_write;
    output reg [27:0]   mem_addr;
    output reg [127:0]  mem_wdata;
    
//==== wire/reg definition ================================
    reg         valid[1:0][3:0];
    reg         dirty[1:0][3:0];
    reg [24:0]  tags[1:0][3:0];
    reg [31:0]  data[1:0][3:0][3:0];
    reg [1:0]   state;
    integer     i;

    reg        hit, hit1, hit0, tag_equal1, tag_equal0;
    reg        sel_valid1, sel_valid0;
    reg [25:0] sel_tag1, sel_tag0;

    reg [3:0] LFU;

//==== combinational circuit ==============================
always@(*) begin
    sel_valid0=valid[0][proc_addr[3:2]];
    sel_valid1=valid[1][proc_addr[3:2]];
    sel_tag0=tags[0][proc_addr[3:2]];
    sel_tag1=tags[1][proc_addr[3:2]];

    tag_equal0=sel_tag0==proc_addr[29:4];
    tag_equal1=sel_tag1==proc_addr[29:4];
    hit0=tag_equal0 && sel_valid0;
    hit1=tag_equal1 && sel_valid1;
    hit=hit0 || hit1;
    
    proc_stall=~hit;
    proc_rdata<=hit0 ? data[0][proc_addr[3:2]][proc_addr[1:0]] : data[1][proc_addr[3:2]][proc_addr[1:0]];
end

//==== sequential circuit =================================
always@( posedge clk or posedge proc_reset ) begin
    if( proc_reset ) begin
        for (i=0; i<8; i=i+1) begin
            valid[0][i]<=1'b0;
            valid[1][i]<=1'b0;
            dirty[0][i]<=1'b0;
            dirty[1][i]<=1'b0;
            tags[0][i]<=25'b0;
            tags[1][i]<=25'b0;
            data[0][i][0]<=32'b0;
            data[0][i][1]<=32'b0;
            data[0][i][2]<=32'b0;
            data[0][i][3]<=32'b0;
            data[1][i][0]<=32'b0;
            data[1][i][1]<=32'b0;
            data[1][i][2]<=32'b0;
            data[1][i][3]<=32'b0;

            state<=2'b0;
            mem_read<=1'b0;
            mem_write<=1'b0;

            LFU<=4'b0;
        end
    end
    else begin
        if (state==2'b00) begin
            if (proc_read) begin
                if (hit) begin
                    LFU[proc_addr[3:2]]<=hit0 ? 1'b1 : 1'b0;
                end
                else begin
                    if (dirty[LFU[proc_addr[3:2]]][proc_addr[3:2]]==1'b1) begin
                        state<=2'b01;
                        mem_addr<={tags[LFU[proc_addr[3:2]]][proc_addr[3:2]], proc_addr[3:2]};
                        mem_read<=1'b0;
                        mem_write<=1'b1;
                        mem_wdata<={data[LFU[proc_addr[3:2]]][proc_addr[3:2]][3], data[LFU[proc_addr[3:2]]][proc_addr[3:2]][2], data[LFU[proc_addr[3:2]]][proc_addr[3:2]][1], data[LFU[proc_addr[3:2]]][proc_addr[3:2]][0]};
                    end
                    else begin
                        state<=2'b10;
                        dirty[LFU[proc_addr[3:2]]][proc_addr[3:2]]<=1'b0;
                        mem_read<=1'b1;
                        mem_write<=1'b0;
                        mem_addr<=proc_addr[29:2];
                    end
                end
            end
            else if (proc_write) begin
                if (hit) begin
                    if (hit0) begin
                        dirty[0][proc_addr[3:2]]<=1'b1;
                        data[0][proc_addr[3:2]][proc_addr[1:0]]<=proc_wdata;
                    end
                    else begin
                        dirty[1][proc_addr[3:2]]<=1'b1;
                        data[1][proc_addr[3:2]][proc_addr[1:0]]<=proc_wdata;
                    end
                    LFU[proc_addr[3:2]]<=hit0 ? 1'b1 : 1'b0;
                end
                else begin
                    if (dirty[LFU[proc_addr[3:2]]][proc_addr[3:2]]==1'b1) begin
                        state<=2'b01;
                        mem_addr<={tags[LFU[proc_addr[3:2]]][proc_addr[3:2]], proc_addr[3:2]};
                        mem_read<=1'b0;
                        mem_write<=1'b1;
                        mem_wdata<={data[LFU[proc_addr[3:2]]][proc_addr[3:2]][3], data[LFU[proc_addr[3:2]]][proc_addr[3:2]][2], data[LFU[proc_addr[3:2]]][proc_addr[3:2]][1], data[LFU[proc_addr[3:2]]][proc_addr[3:2]][0]};
                    end
                    else begin
                        state<=2'b10;
                        dirty[LFU[proc_addr[3:2]]][proc_addr[3:2]]<=1'b0;
                        mem_read<=1'b1;
                        mem_write<=1'b0;
                        mem_addr<=proc_addr[29:2];
                    end
                end
            end
        end
        else if (state==2'b01) begin //cache to mem
            if (mem_ready) begin
                state<=2'b10;
                dirty[LFU[proc_addr[3:2]]][proc_addr[3:2]]<=1'b0;
                mem_read<=1'b1;
                mem_write<=1'b0;
                mem_addr<=proc_addr[29:2];
            end
        end
        else if (state==2'b10) begin // mem to cache
            if (mem_ready) begin
                {data[LFU[proc_addr[3:2]]][proc_addr[3:2]][3], data[LFU[proc_addr[3:2]]][proc_addr[3:2]][2], data[LFU[proc_addr[3:2]]][proc_addr[3:2]][1], data[LFU[proc_addr[3:2]]][proc_addr[3:2]][0]}<=mem_rdata;
                tags[LFU[proc_addr[3:2]]][proc_addr[3:2]]<=proc_addr[29:4];
                valid[LFU[proc_addr[3:2]]][proc_addr[3:2]]<=1'b1;
                state<=2'b00;
                mem_read<=1'b0;
                mem_write<=1'b0;
            end
        end
    end
end

endmodule
