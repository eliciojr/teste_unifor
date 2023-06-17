create or replace function fn_mesmaregiao_cur_alu(pcd_nu_codcurso in number ,pcd_nu_codregiao  in number
                                         )
  return number is

  vmesmaregiao        Number;

Begin

begin
select 1
	into vmesmaregiao
	from tb_curso r
	where r.nu_codcurso = pcd_nu_codcurso
    and r.nu_codregiao = pcd_nu_codregiao;
exception
	when no_data_found then
	  vmesmaregiao := 0;
end;
  
    Return vmesmaregiao;

Exception
  When Others Then
    Return Null;
End;