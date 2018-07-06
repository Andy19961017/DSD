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
    reg         valid[7:0];
    reg         dirty[7:0];
    reg [24:0]  tags[7:0];
    reg [31:0]  data[7:0][3:0];
    reg [1:0]   state;
    integer     i;
    
    reg        hit, tag_equal, sel_valid, sel_dirty;
    reg [24:0] sel_tag;

//==== combinational circuit ==============================
always@(*) begin
    sel_valid=valid[proc_addr[4:2]];
    sel_dirty=dirty[proc_addr[4:2]];
    sel_tag=tags[proc_addr[4:2]];

    tag_equal=sel_tag==proc_addr[29:5];
    hit=tag_equal && sel_valid;
    
    proc_stall=~hit;
    proc_rdata<=data[proc_addr[4:2]][proc_addr[1:0]];
end

//==== sequential circuit =================================
always@( posedge clk or posedge proc_reset ) begin
    if( proc_reset ) begin
        for (i=0; i<8; i=i+1) begin
            valid[i]<=1'b0;
            dirty[i]<=1'b0;
            tags[i]<=25'b0;
            data[i][0]<=32'b0;
            data[i][1]<=32'b0;
            data[i][2]<=32'b0;
            data[i][3]<=32'b0;
            state<=2'b0;
            mem_read<=1'b0;
            mem_write<=1'b0;
        end
    end
    else begin
        if (state==2'b00) begin
            if (proc_read) begin
                if (hit) begin
                end
                else begin
                    if (dirty[proc_addr[4:2]]==1'b1) begin
                        state<=2'b01;
                        mem_addr<={sel_tag, proc_addr[4:2]};
                        mem_read<=1'b0;
                        mem_write<=1'b1;
                        mem_wdata<={data[proc_addr[4:2]][3], data[proc_addr[4:2]][2], data[proc_addr[4:2]][1], data[proc_addr[4:2]][0]};
                    end
                    else begin
                        state<=2'b10;
                        dirty[proc_addr[4:2]]<=1'b0;
                        mem_read<=1'b1;
                        mem_write<=1'b0;
                        mem_addr<=proc_addr[29:2];
                    end
                end
            end
            else if (proc_write) begin
                if (hit) begin
                    dirty[proc_addr[4:2]]<=1'b1;
                    data[proc_addr[4:2]][proc_addr[1:0]]<=proc_wdata;
                end
                else begin
                    if (dirty[proc_addr[4:2]]==1'b1) begin
                        state<=2'b01;
                        mem_addr<={sel_tag, proc_addr[4:2]};
                        mem_read<=1'b0;
                        mem_write<=1'b1;
                        mem_wdata<={data[proc_addr[4:2]][3], data[proc_addr[4:2]][2], data[proc_addr[4:2]][1], data[proc_addr[4:2]][0]};
                    end
                    else begin
                        state<=2'b10;
                        dirty[proc_addr[4:2]]<=1'b0;
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
                dirty[proc_addr[4:2]]<=1'b0;
                mem_read<=1'b1;
                mem_write<=1'b0;
                mem_addr<=proc_addr[29:2];
            end
        end
        else if (state==2'b10) begin // mem to cache
            if (mem_ready) begin
                {data[proc_addr[4:2]][3], data[proc_addr[4:2]][2], data[proc_addr[4:2]][1], data[proc_addr[4:2]][0]}<=mem_rdata;
                tags[proc_addr[4:2]]<=proc_addr[29:5];
                valid[proc_addr[4:2]]<=1'b1;
                state<=2'b00;
                mem_read<=1'b0;
                mem_write<=1'b0;
            end
        end
    end
end

endmodule
