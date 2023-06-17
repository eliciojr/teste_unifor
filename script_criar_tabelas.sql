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