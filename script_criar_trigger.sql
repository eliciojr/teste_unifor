create or replace trigger tg_curso_disciplina_tutor
  before insert or delete on tb_curso_disciplina_tutor
  for each row
declare
  vexistetutor      number;
  vexistecurso      number;
  vexistedisciplina number;
  vmesmaregiao      number;
  vexistecdt        number;
begin

  if INSERTING then
    begin
      select 1
        into vexistetutor
        from tb_tutor r
       where r.nu_codtutor = :new.nu_codtutor;
    exception
      when no_data_found then
        vexistetutor := 0;
    end;
  
    begin
      select 1
        into vexistecurso
        from tb_curso r
       where r.nu_codcurso = :new.nu_codcurso;
    exception
      when no_data_found then
        vexistecurso := 0;
    end;
  
    begin
      select 1
        into vexistedisciplina
        from tb_disciplina r
       where r.nu_coddisciplina = :new.nu_coddisciplina;
    exception
      when no_data_found then
        vexistedisciplina := 0;
    end;
  
    begin
      select 1
        into vmesmaregiao
        from tb_curso r, tb_tutor t
       where r.nu_codcurso = :new.nu_codcurso
         and t.nu_codtutor = :new.nu_codtutor
         and t.nu_codregiao = r.nu_codregiao;
    exception
      when no_data_found then
        vmesmaregiao := 0;
    end;
  
    if vexistetutor = 1 and vexistecurso = 1 and vexistedisciplina = 1 and
       vmesmaregiao = 1 then
       null;
       /*
      begin
      
        insert into tb_curso_disciplina_tutor
          (nu_codcurso, nu_coddisciplina, nu_codtutor)
        values
          (:new.nu_codcurso, :new.nu_coddisciplina, :new.nu_codtutor);
        commit;
      end;
      */
    else
      if vexistetutor = 0 then
        RAISE_APPLICATION_ERROR(-20000, 'TUTOR NÃO CADASTRADA');
      end if;
    
      if vexistecurso = 0 then
        RAISE_APPLICATION_ERROR(-20000, 'CURSO NÃO CADASTRADO');
      end if;
    
      if vmesmaregiao = 0 then
        RAISE_APPLICATION_ERROR(-20000,
                                'REGIAO DO ALUNO DIFERENTE DA REGIAO DO CURSO/TUTOR');
      end if;
    
    end if;
  
  elsif DELETING then
    begin
      select 1
        into vexistecdt
        from tb_curso_disciplina_tutor r
       where nu_codcurso = :new.nu_codcurso
         and nu_coddisciplina = :new.nu_coddisciplina
         and nu_codtutor = :new.nu_codtutor;
    exception
      when no_data_found then
        vexistecdt := 0;
    end;
  
    begin
      if vexistecdt = 1 then
        delete tb_curso_disciplina_tutor
         where nu_codcurso = :new.nu_codcurso
           and nu_coddisciplina = :new.nu_coddisciplina
           and nu_codtutor = :new.nu_codtutor;
        commit;
      else
        RAISE_APPLICATION_ERROR(-20000, 'DADOS NÃO CADASTRADO');
      end if;
    end;
  end if;

end tg_curso_disciplina_tutor;
