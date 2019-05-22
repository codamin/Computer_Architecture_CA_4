module hazard(id_ex_memRead, id_ex_rt, if_id_rs, if_id_rt,
PCwrite, if_id_write, cancel);
input id_ex_memRead;
input reg[4:0] id_ex_rt, if_id_rs, if_id_rt;
output reg PCwrite = 1, if_id_write = 1, cancel = 0;
reg cond = 0;

always @(id_ex_memRead, id_ex_rt, if_id_rs, if_id_rt)
begin
    cond = id_ex_memRead && (id_ex_rt == if_id_rs || id_ex_rt == if_id_rt);
    if(cond) begin
    PCwrite = 0;
    if_id_write = 0;
    cancel = 1;
    end
end
endmodule
