--tabela Regiao
create table tb_regiao
(
  nu_codregiao         number  not null,
  nm_regiao            VARCHAR2(100) not null
);

alter table tb_regiao add constraint PK_REGIAO primary key (nu_codregiao);

create sequence SQ_REGIAO MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE ORDER NOCYCLE;


--tabela Tutor
create table tb_tutor
(
  nu_codtutor          number  not null,
  nm_tutor             VARCHAR2(100) not null,
  nu_codregiao         number
);

alter table tb_tutor add constraint PK_TUTOR primary key (nu_codtutor);
alter table tb_tutor add constraint FK_REGIAO_TUTOR foreign key (nu_codregiao) references tb_regiao(nu_codregiao);

create sequence SQ_TUTOR MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE ORDER NOCYCLE;

--tabela Curso
create table tb_curso
(
  nu_codcurso          number  not null,
  nm_curso             VARCHAR2(100) not null,
  nu_codregiao         number,
  nu_cota              number
);

alter table tb_curso add constraint PK_CURSO primary key (nu_codcurso);
alter table tb_curso add constraint FK_REGIAO_CURSO foreign key (nu_codregiao) references tb_regiao(nu_codregiao);

create sequence SQ_CURSO MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE ORDER NOCYCLE;

CREATE OR REPLACE TRIGGER TRG_VALIDARCOTA_CURSO
BEFORE INSERT OR UPDATE OF nu_cota
ON tb_curso
FOR EACH ROW
BEGIN
    IF :NEW.nu_cota > 30 THEN
        RAISE_APPLICATION_ERROR(-20000, 'LIMITE DE COTA É DE 30 ALUNOS');
    END IF;
END;

--tabela Disciplina
create table tb_disciplina
(
  nu_coddisciplina     number  not null,
  nm_disciplina        VARCHAR2(100) not null
);

alter table tb_disciplina add constraint PK_DISCIPLINA primary key (nu_coddisciplina);

create sequence SQ_DISCIPLINA MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE ORDER NOCYCLE;

--tabela Curso x Disciplina x Tutor
create table tb_curso_disciplina_tutor
(
  nu_codcurso            number  not null,
  nu_coddisciplina       number  not null,
  nu_codtutor       number  not null
);
--PRECISA FAZER TRIGGER PARA QUE O TUTOR SEJA DA MESMA REGIAO DO CURSO
alter table tb_curso_disciplina_tutor add constraint PK_CURSO_DISCIPLINA_TUTOR primary key (nu_codcurso,nu_coddisciplina,nu_codtutor);
alter table tb_curso_disciplina_tutor add constraint FK_CURSO_CURSO_DISCIPLINA_TUTOR foreign key (nu_codcurso) references tb_curso(nu_codcurso);
alter table tb_curso_disciplina_tutor add constraint FK_DISCIPLINA_CURSO_DISCIPLINA_TUTOR foreign key (nu_coddisciplina) references tb_disciplina(nu_coddisciplina);
alter table tb_curso_disciplina_tutor add constraint FK_TUTOR_CURSO_DISCIPLINA_TUTOR foreign key (nu_codtutor) references tb_tutor(nu_codtutor);


--tabela Aluno
create table tb_aluno
(
  nu_codaluno          number  not null,
  nm_aluno             VARCHAR2(100) not null
  dt_matricula         date    not null,
  nu_codregiao         number  not null,
  nu_codcurso          number  not null
);

alter table tb_aluno add constraint PK_ALUNO primary key (nu_codaluno);
alter table tb_aluno add constraint FK_REGIAO_ALUNO foreign key (nu_codregiao) references tb_regiao(nu_codregiao);
alter table tb_aluno add constraint FK_CURSO_ALUNO  foreign key (nu_codcurso) references tb_curso(nu_codcurso);

create sequence SQ_ALUNO MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE ORDER NOCYCLE;

--Pacote para manter entidades
create or replace package pk_mantem_entidades is

  -- Author  : Elicio Junior
  -- Created : 14/6/2023 20:00:00
  -- Purpose : Manter os dados da aplicação
 

	procedure pr_inclui_regiao(pcd_nm_regiao varchar2);
	procedure pr_altera_regiao(pcd_nu_codregiao number,pcd_nm_regiao varchar2);
	procedure pr_deleta_regiao(pcd_nu_codregiao number);

	procedure pr_inclui_tutor(pcd_nm_tutor varchar2);
	procedure pr_altera_tutor(pcd_nu_codtutor number,pcd_nm_tutor varchar2);
	procedure pr_deleta_tutor(pcd_codtutor number);

	procedure pr_inclui_curso(pcd_nm_curso varchar2);
	procedure pr_altera_curso(pcd_nu_codcurso number,pcd_nm_curso varchar2);
	procedure pr_deleta_curso(pcd_nu_codcurso number);

	procedure pr_inclui_disciplina(pcd_nm_disciplina varchar2);
	procedure pr_altera_disciplina(pcd_coddisciplina number);
	procedure pr_deleta_disciplina(pcd_coddisciplina number);

	procedure pr_inclui_curso_disciplina_tutor(pcd_curso number, pcd_disciplina number, pcd_tutor number);
	procedure pr_altera_curso_disciplina_tutor(pcd_curso number, pcd_disciplina number, pcd_tutor number);
	procedure pr_deleta_curso_disciplina_tutor(pcd_curso number, pcd_disciplina number, pcd_tutor number);

	procedure pr_inclui_aluno(nm_aluno varchar2,pcd_dt_matricula date, pcd_nu_codregiao number, pcd_nu_codcurso number);
	procedure pr_altera_aluno(pcd_nu_codaluno number, pcd_nm_aluno varchar2,pcd_dt_matricula date, pcd_nu_codregiao number, pcd_nu_codcurso number);
	procedure pr_deleta_aluno(pcd_nu_codaluno number);

end pk_mantem_entidades;


create or replace package body pk_mantem_entidades as

procedure pr_inclui_regiao(pcd_nm_regiao varchar2) is
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
          update into tb_regiao set nm_regiao=pcd_nm_regiao where nu_codregiao=pcd_nu_codregiao;
          commit;
		else
		  RAISE_APPLICATION_ERROR(-20000, 'REGIÃO NÃO CADASTRADA');
        end if;
 	  end;
    end;
end;


procedure pr_deleta_regiao(pcd_nu_codregiao number);
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
end;

procedure pr_inclui_tutor(pcd_nm_tutor varchar2) is
	begin
		insert into tb_tutor
		  (nu_codtutor,
		   nm_tutor)
		values
		  (sq_tutor.nextval,
		   pcd_nm_tutor);
		commit;
	end;
 end;

procedure pr_altera_tutor(pcd_nu_codtutor number,pcd_nm_tutor varchar2) is
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
          update into tb_tutor set nm_tutor=pcd_nm_tutor where nu_codtutor=pcd_nu_codtutor;
          commit;
		else
		  RAISE_APPLICATION_ERROR(-20000, 'TUTOR NÃO CADASTRADO');
        end if;
 	  end;
    end;
end;


procedure pr_deleta_tutor(pcd_nu_codtutor number);
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
end;  
 
procedure pr_inclui_curso(pcd_nm_curso varchar2,pcd_nu_codregiao varchar2, pcd_nu_cota) is
	begin
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
	end;
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
          update into tb_curso set nm_curso=pcd_nm_curso,nu_codregiao= where nu_codcurso=pcd_nu_codcurso;
          commit;
		else
		  RAISE_APPLICATION_ERROR(-20000, 'CURSO NÃO CADASTRADO');
        end if;
 	  end;
    end;
end;


procedure pr_deleta_curso(pcd_nu_codcurso number);
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
		  RAISE_APPLICATION_ERROR(-20000, 'TUTOR NÃO CADASTRADO');
        end if;
 	  end;
    end;
end; 

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
          update into tb_disciplina set nm_disciplina=pcd_nm_disciplina where nu_coddisciplina=pcd_nu_coddisciplina;
          commit;
		else
		  RAISE_APPLICATION_ERROR(-20000, 'disciplina NÃO CADASTRADO');
        end if;
 	  end;
    end;
end;


procedure pr_deleta_disciplina(pcd_nu_coddisciplina number);
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
end; 


end pk_app_msf;
/

