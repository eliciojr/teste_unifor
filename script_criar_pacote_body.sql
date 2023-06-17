create or replace package body pk_mantem_entidades as

--Manuetenção da tabela de região
procedure pr_inclui_regiao(pcd_nm_regiao varchar2) is
begin
begin
insert into tb_regiao
  (nu_codregiao,
   nm_regiao)
values
  (sq_regiao.nextval,
   pcd_nm_regiao);
commit;
end;
end;

procedure pr_altera_regiao(pcd_nu_codregiao number,pcd_nm_regiao varchar2) is
vexisteRegiao number;
begin
begin
select 1
	into vexisteRegiao
	from tb_regiao r
	where r.nu_codregiao = pcd_nu_codregiao;
exception
	when no_data_found then
	  vexisteRegiao := 0;
end;

begin
if vexisteRegiao = 1 then
  update tb_regiao set nm_regiao=pcd_nm_regiao where nu_codregiao=pcd_nu_codregiao;
  commit;
else
  RAISE_APPLICATION_ERROR(-20000, 'REGIÃO NÃO CADASTRADA');
end if;
end;
end;

procedure pr_deleta_regiao(pcd_nu_codregiao number) is
vexisteRegiao number;
begin
begin
select 1
	into vexisteRegiao
	from tb_regiao r
	where r.nu_codregiao = pcd_nu_codregiao;
exception
	when no_data_found then
	  vexisteRegiao := 0;
end;

begin
if vexisteRegiao = 1 then
  delete tb_regiao where nu_codregiao=pcd_nu_codregiao;
  commit;
else
  RAISE_APPLICATION_ERROR(-20000, 'REGIÃO NÃO CADASTRADA');
end if;
end;
end;


--Manuetenção da tabela de tutor
procedure pr_inclui_tutor(pcd_nm_tutor varchar2,pcd_nu_codregiao number) is
begin
insert into tb_tutor
(nu_codtutor,
nm_tutor,
nu_codregiao)
values
(sq_tutor.nextval,
pcd_nm_tutor,
pcd_nu_codregiao);
commit;
end;

procedure pr_altera_tutor(pcd_nu_codtutor number,pcd_nm_tutor varchar2,pcd_nu_codregiao number) is
vexistetutor number;
begin
begin
select 1
	into vexistetutor
	from tb_tutor r
	where r.nu_codtutor = pcd_nu_codtutor;
exception
	when no_data_found then
	  vexistetutor := 0;
end;

begin
if vexistetutor = 1 then
  update tb_tutor set nm_tutor=pcd_nm_tutor,nu_codregiao=pcd_nu_codregiao where nu_codtutor=pcd_nu_codtutor;
  commit;
else
  RAISE_APPLICATION_ERROR(-20000, 'TUTOR NÃO CADASTRADO');
end if;
end;
end;

procedure pr_deleta_tutor(pcd_nu_codtutor number) is
vexistetutor number;
begin
begin
select 1
	into vexistetutor
	from tb_tutor r
	where r.nu_codtutor = pcd_nu_codtutor;
exception
	when no_data_found then
	  vexistetutor := 0;
end;

begin
if vexistetutor = 1 then
  delete tb_tutor where nu_codtutor=pcd_nu_codtutor;
  commit;
else
  RAISE_APPLICATION_ERROR(-20000, 'TUROR NÃO CADASTRADO');
end if;
end;
end;  

--Manuetenção da tabela de curso
procedure pr_inclui_curso(pcd_nm_curso varchar2,pcd_nu_codregiao varchar2, pcd_nu_cota number) is
vexisteregiao number;
begin
begin
select 1
	into vexisteregiao
	from tb_regiao r
	where r.nu_codregiao = pcd_nu_codregiao;
exception
	when no_data_found then
	  vexisteregiao := 0;
end;
if  vexisteregiao = 1 then

insert into tb_curso
  (nu_codcurso,
   nm_curso,
   nu_codregiao,
   nu_cota)
values
  (sq_curso.nextval,
   pcd_nm_curso,
   pcd_nu_codregiao,
   pcd_nu_cota);
commit;
end if;
end;

procedure pr_altera_curso(pcd_nu_codcurso number,pcd_nm_curso varchar2,pcd_nu_codregiao number, pcd_nu_cota number) is
vexistecurso number;
vexisteregiao number;
vlimitecota number;
begin
begin
select 1
	into vexistecurso
	from tb_curso r
	where r.nu_codcurso = pcd_nu_codcurso;
exception
	when no_data_found then
	  vexistecurso := 0;
end;

begin
select 1
	into vexisteregiao
	from tb_regiao r
	where r.nu_codregiao = pcd_nu_codregiao;
exception
	when no_data_found then
	  vexisteregiao := 0;
end;

vlimitecota:=1;	  
if   pcd_nu_cota >30 then
vlimitecota:=0;
RAISE_APPLICATION_ERROR(-20000, 'LIMITE DE COTA É 30');
end if;	  

begin
if vexistecurso = 1 and vexisteregiao = 1 and vlimitecota = 1 then
  update tb_curso set nm_curso=pcd_nm_curso,nu_codregiao=pcd_nu_codregiao where nu_codcurso=pcd_nu_codcurso;
  commit;
else
  RAISE_APPLICATION_ERROR(-20000, 'CURSO NÃO CADASTRADO');
end if;
end;
end;


procedure pr_deleta_curso(pcd_nu_codcurso number) is
vexistecurso number;
begin
begin
select 1
	into vexistecurso
	from tb_curso r
	where r.nu_codcurso = pcd_nu_codcurso;
exception
	when no_data_found then
	  vexistecurso := 0;
end;

begin
if vexistecurso = 1 then
  delete tb_curso where nu_codcurso=pcd_nu_codcurso;
  commit;
else
  RAISE_APPLICATION_ERROR(-20000, 'CURSO NÃO CADASTRADO');
end if;
end;
end; 

--Manuetenção da tabela de disciplina
procedure pr_inclui_disciplina(pcd_nm_disciplina varchar2) is
begin
insert into tb_disciplina
  (nu_coddisciplina,
   nm_disciplina)
values
  (sq_disciplina.nextval,
   pcd_nm_disciplina);
commit;
end;

procedure pr_altera_disciplina(pcd_nu_coddisciplina number,pcd_nm_disciplina varchar2) is
vexistedisciplina number;
begin
begin
select 1
	into vexistedisciplina
	from tb_disciplina r
	where r.nu_coddisciplina = pcd_nu_coddisciplina;
exception
	when no_data_found then
	  vexistedisciplina := 0;
end;

begin
if vexistedisciplina = 1 then
  update tb_disciplina set nm_disciplina=pcd_nm_disciplina where nu_coddisciplina=pcd_nu_coddisciplina;
  commit;
else
  RAISE_APPLICATION_ERROR(-20000, 'DISCIPLINA NÃO CADASTRADO');
end if;
end;
end;


procedure pr_deleta_disciplina(pcd_nu_coddisciplina number) is
vexistedisciplina number;
begin
begin
select 1
	into vexistedisciplina
	from tb_disciplina r
	where r.nu_coddisciplina = pcd_nu_coddisciplina;
exception
	when no_data_found then
	  vexistedisciplina := 0;
end;

begin
if vexistedisciplina = 1 then
  delete tb_disciplina where nu_coddisciplina=pcd_nu_coddisciplina;
  commit;
else
  RAISE_APPLICATION_ERROR(-20000, 'DISCIPLINA NÃO CADASTRADO');
end if;
end;
end; 

--Manuetenção da tabela de aluno
procedure pr_inclui_aluno(pcd_nm_aluno varchar2,pcd_dt_matricula date, pcd_nu_codregiao number, pcd_nu_codcurso number) is
vexisteregiao number;
vexistecurso number;
vqtcota number;
vlimitecota number;
vmesmaregiao number;
begin

begin
select 1
	into vexisteregiao
	from tb_regiao r
	where r.nu_codregiao = pcd_nu_codregiao;
exception
	when no_data_found then
	  vexisteregiao:= 0;
end;

begin
select 1
	into vexistecurso 
	from tb_curso r
	where r.nu_codcurso = pcd_nu_codcurso;
exception
	when no_data_found then
	  vexistecurso:= 0;
end;

begin
select r.nu_cota
	into vqtcota 
	from tb_curso r
	where r.nu_codcurso = pcd_nu_codcurso;
exception
	when no_data_found then
	  vqtcota:= 0;
end;

begin
select count(*)
	into vlimitecota 
	from tb_aluno r
	where r.nu_codcurso = pcd_nu_codcurso;
exception
	when no_data_found then
	  vlimitecota:= 0;
end;

vmesmaregiao:=fn_mesmaregiao_cur_alu(pcd_nu_codcurso,pcd_nu_codregiao);

if vexisteregiao = 1 and vexistecurso = 1 and (vlimitecota+1) <= vqtcota  and vmesmaregiao = 1 then

begin
insert into tb_aluno
  (nu_codaluno,
   nm_aluno,
   dt_matricula,
   nu_codregiao,
   nu_codcurso)
values
  (sq_aluno.nextval,
   pcd_nm_aluno,
   pcd_dt_matricula,
   pcd_nu_codregiao,
   pcd_nu_codcurso);
commit;
end;
else
if vexisteregiao = 0  then
RAISE_APPLICATION_ERROR(-20000, 'REGIÃO NÃO CADASTRADA');
end if;
if vexistecurso = 0  then
RAISE_APPLICATION_ERROR(-20000, 'CURSO NÃO CADASTRADO');
end if;
if (vlimitecota+1) >= vqtcota   then
RAISE_APPLICATION_ERROR(-20000, 'COTA MAXIMA ATINGIDA');
end if;
if  vmesmaregiao = 0 then
RAISE_APPLICATION_ERROR(-20000, 'REGIAO DO ALUNO DIFERENTE DA REGIAO DO CURSO');
end if;

end if;
end;

procedure pr_altera_aluno(pcd_nu_codaluno number, pcd_nm_aluno varchar2,pcd_dt_matricula date, pcd_nu_codregiao number, pcd_nu_codcurso number) is
vexisteregiao number;
vexistecurso number;
vlimitecota number;
vmesmaregiao number;
begin

begin
select 1
	into vexisteregiao
	from tb_regiao r
	where r.nu_codregiao = pcd_nu_codregiao;
exception
	when no_data_found then
	  vexisteregiao:= 0;
end;

begin
select 1
	into vexistecurso 
	from tb_curso r
	where r.nu_codcurso = pcd_nu_codcurso;
exception
	when no_data_found then
	  vexistecurso:= 0;
end;

vmesmaregiao:=fn_mesmaregiao_cur_alu(pcd_nu_codcurso,pcd_nu_codregiao);


if vexisteregiao = 1 and vexistecurso = 1 and vmesmaregiao = 1 then
  update tb_aluno set nm_aluno=pcd_nm_aluno,nu_codregiao=pcd_nu_codregiao,nu_codcurso=pcd_nu_codcurso where nu_codaluno=pcd_nu_codaluno;
  commit;
else

    if vexisteregiao = 0  then
        RAISE_APPLICATION_ERROR(-20000, 'REGIÃO NÃO CADASTRADA');
    end if;
    
    if vexistecurso = 0  then
        RAISE_APPLICATION_ERROR(-20000, 'CURSO NÃO CADASTRADO');
    end if;
    
    if  vmesmaregiao = 0 then
        RAISE_APPLICATION_ERROR(-20000, 'REGIAO DO ALUNO DIFERENTE DA REGIAO DO CURSO');
    end if;

end if;
end;


procedure pr_deleta_aluno(pcd_nu_codaluno number) is
vexistealuno number;
begin
begin
select 1
	into vexistealuno
	from tb_aluno r
	where r.nu_codaluno = pcd_nu_codaluno;
exception
	when no_data_found then
	  vexistealuno := 0;
end;

begin
if vexistealuno = 1 then
  delete tb_aluno where nu_codaluno=pcd_nu_codaluno;
  commit;
else
  RAISE_APPLICATION_ERROR(-20000, 'TUTOR NÃO CADASTRADO');
end if;
end;
end;  

--Manuetenção da tabela de curso x tutor x disciplina

procedure pr_inclui_curso_disciplina_tutor(pcd_nu_codcurso number, pcd_nu_coddisciplina number, pcd_nu_codtutor number) is
vexistetutor number;
vexistecurso number;
vexistedisciplina number;
vmesmaregiao number;
begin

begin
select 1
	into vexistetutor
	from tb_tutor r
	where r.nu_codtutor = pcd_nu_codtutor;
exception
	when no_data_found then
	  vexistetutor:= 0;
end;

begin
select 1
	into vexistecurso 
	from tb_curso r
	where r.nu_codcurso = pcd_nu_codcurso;
exception
	when no_data_found then
	  vexistecurso:= 0;
end;

begin
select 1
	into vexistedisciplina
	from tb_disciplina r
	where r.nu_coddisciplina = pcd_nu_coddisciplina;
exception
	when no_data_found then
	  vexistedisciplina:= 0;
end;

vmesmaregiao:=fn_mesmaregiao_cur_tut(pcd_nu_codcurso,pcd_nu_codtutor);

if vexistetutor = 1 and vexistecurso = 1 and vexistedisciplina = 1 and vmesmaregiao = 1 then
begin

insert into tb_curso_disciplina_tutor
  (nu_codcurso,
   nu_coddisciplina,
   nu_codtutor)
values
  (pcd_nu_codcurso,
  pcd_nu_coddisciplina,
  pcd_nu_codtutor);
commit;
end;
else
    if vexistetutor = 0  then
        RAISE_APPLICATION_ERROR(-20000, 'TUTOR NÃO CADASTRADA');
    end if;
	
   
    if vexistecurso = 0  then
        RAISE_APPLICATION_ERROR(-20000, 'CURSO NÃO CADASTRADO');
    end if;
    
    if  vmesmaregiao = 0 then
        RAISE_APPLICATION_ERROR(-20000, 'REGIAO DO ALUNO DIFERENTE DA REGIAO DO CURSO/TUTOR');
    end if;

end if;
end;


procedure pr_deleta_curso_disciplina_tutor(pcd_nu_codcurso number, pcd_nu_coddisciplina number, pcd_nu_codtutor number) is
vexistecdt number;
begin
begin
select 1
	into vexistecdt
	from tb_curso_disciplina_tutor r
	where nu_codcurso=pcd_nu_codcurso and nu_coddisciplina=pcd_nu_coddisciplina and nu_codtutor=pcd_nu_codtutor;
exception
	when no_data_found then
	  vexistecdt := 0;
end;

begin
if vexistecdt = 1 then
  delete tb_curso_disciplina_tutor where nu_codcurso=pcd_nu_codcurso and nu_coddisciplina=pcd_nu_coddisciplina and nu_codtutor=pcd_nu_codtutor;
  commit;
else
  RAISE_APPLICATION_ERROR(-20000, 'TUTOR NÃO CADASTRADO'); 
end if;
end;
end;  

end pk_mantem_entidades;