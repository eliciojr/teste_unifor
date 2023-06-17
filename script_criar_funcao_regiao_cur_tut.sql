create or replace function fn_mesmaregiao_cur_tut(pcd_nu_codcurso in number ,pcd_nu_codtutor  in number
                                         )
  return number is

  vmesmaregiao        Number;

Begin

	begin
	select 1
		into vmesmaregiao
		from tb_curso r,tb_tutor t
		where r.nu_codcurso = pcd_nu_codcurso
		and t.nu_codtutor = pcd_nu_codtutor
		and t.nu_codregiao = r.nu_codregiao;
	exception
		when no_data_found then
		  vmesmaregiao := 0;
	end;
  
    Return vmesmaregiao;

Exception
  When Others Then
    Return Null;
End;