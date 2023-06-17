
create or replace package pk_mantem_entidades is

  -- Author  : Elicio Junior
  -- Created : 14/6/2023 20:00:00
  -- Purpose : Manter os dados da aplicação
 

create or replace package pk_mantem_entidades is

  -- Author  : Elicio Junior
  -- Created : 14/6/2023 20:00:00
  -- Purpose : Manter os dados da aplicação
 

	procedure pr_inclui_regiao(pcd_nm_regiao varchar2);
	procedure pr_altera_regiao(pcd_nu_codregiao number,pcd_nm_regiao varchar2);
	procedure pr_deleta_regiao(pcd_nu_codregiao number);

	procedure pr_inclui_tutor(pcd_nm_tutor varchar2);
	procedure pr_altera_tutor(pcd_nu_codtutor number,pcd_nm_tutor varchar2);
	procedure pr_deleta_tutor(pcd_nu_codtutor number);
  
	procedure pr_inclui_curso(pcd_nm_curso varchar2,pcd_nu_codregiao varchar2, pcd_nu_cota number);
	procedure pr_altera_curso(pcd_nu_codcurso number,pcd_nm_curso varchar2,pcd_nu_codregiao number, pcd_nu_cota number);
	procedure pr_deleta_curso(pcd_nu_codcurso number);

	procedure pr_inclui_disciplina(pcd_nm_disciplina varchar2);
	procedure pr_altera_disciplina(pcd_nu_coddisciplina number,pcd_nm_disciplina varchar2);
	procedure pr_deleta_disciplina(pcd_nu_coddisciplina number);
    
	procedure pr_inclui_aluno(pcd_nm_aluno varchar2,pcd_dt_matricula date, pcd_nu_codregiao number, pcd_nu_codcurso number);
	procedure pr_altera_aluno(pcd_nu_codaluno number, pcd_nm_aluno varchar2,pcd_dt_matricula date, pcd_nu_codregiao number, pcd_nu_codcurso number);
	procedure pr_deleta_aluno(pcd_nu_codaluno number);    

	procedure pr_inclui_curso_disciplina_tutor(pcd_nu_codcurso number, pcd_nu_coddisciplina number, pcd_nu_codtutor number);
	procedure pr_deleta_curso_disciplina_tutor(pcd_nu_codcurso number, pcd_nu_coddisciplina number, pcd_nu_codtutor number);

end pk_mantem_entidades;

end pk_mantem_entidades;
