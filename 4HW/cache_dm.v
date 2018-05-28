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
    reg [31:0]  data[7:0][1:0];
    reg [1:0]   state;
    integer     i;

    wire        hit, tag_equal, sel_valid, sel_dirty;
    wire [24:0] sel_tag;

    wire            next_proc_stall;
    wire [31:0]     next_proc_rdata;
    wire            next_mem_read, mem_write;
    wire [27:0]     next_mem_addr;
    wire [127:0]    next_mem_wdata;
    wire            next_valid[7:0];
    wire            next_dirty[7:0];
    wire [24:0]     next_tags[7:0];
    wire [31:0]     next_data[7:0][1:0];
    wire [1:0]      next_state;
//==== combinational circuit ==============================
always@(*) begin
    sel_valid=valid[proc_addr[4:2]]
    sel_dirty=dirty[proc_addr[4:2]];
    sel_tag=tags[proc_addr[4:2]];

    tag_equal=sel_tag==proc_addr[29:5];
    hit=tag_equal && sel_valid;

    next_proc_stall=proc_stall;
    next_proc_rdata=proc_rdata;
    next_mem_read=mem_read;
    next_mem_write=mem_write;
    next_mem_addr=mem_addr;
    next_mem_wdata=mem_wdata;
    next_state=state;
    for (i=0; i<8; i=i+1) begin
        next_valid[i]=valid[i];
        next_dirty[i]=dirty[i];
        next_tags[i]=tags[i];
        next_data[i]=data[i];
    end
end

//==== sequential circuit =================================
always@( posedge clk or posedge proc_reset ) begin
    if( proc_reset ) begin
        for (i=0; i<8; i=i+1) begin
            valid[i]<=1'b0;
            dirty[i]<=1'b0;
            tags[i]<=25'b0;
            data[i]<=128'b0;
            state<=2'b0;
            proc_stall<=1'b0;
            mem_read<=1'b0;
            mem_write<=1'b0;
        end
    end
    else begin
        if (state=2'b00) begin
            if (proc_read) begin
                if (hit) begin
                    proc_rdata<=data[proc_addr[4:2]][proc_addr[1:0]];
                end
                else begin
                    proc_stall<=1'b1;
                    if (dirty[proc_addr[4:2]]==1'b1) begin
                        state<=2'b01;
                        mem_addr<={sel_tag, proc_addr[4:2]};
                        mem_read<=1'b0;
                        mem_write<=1'b1;
                        mem_wdata<=data[proc_addr[4:2]];
                    end
                    else begin
                        state<=2'b10;
                        dirty[proc_addr[4:2]]<=1'b0;
                        mem_read<=1'b1;
                        mem_write<=1'b0;
                        mem_addr<=proc_addr[29:2]
                    end
                end
            end
            else if (proc_write) begin
                if (hit) begin
                    dirty[proc_addr[4:2]]<=1'b1;
                    data[proc_addr[4:2]][proc_addr[1:0]]<=proc_wdata;
                end
                else begin
                    proc_stall<=1'b1;
                    if (dirty[proc_addr[4:2]]==1'b1) begin
                        state<=2'b01;
                        mem_addr<={sel_tag, proc_addr[4:2]};
                        mem_read<=1'b0;
                        mem_write<=1'b1;
                        mem_wdata<=data[proc_addr[4:2]];
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
                data[proc_addr[4:2]]<=mem_rdata;
                tags[proc_addr[4:2]]<=proc_addr[29:5];
                valid[proc_addr[4:2]]<=1'b1;
                proc_stall<=1'b0;
                state<=2'b00;
                mem_read<=1'b0;
                mem_write<=1'b0;
            end
        end
    end
end

endmodule