CREATE OR replace VIEW vw_dados_aluno
AS
  SELECT a.nu_codaluno        CODIGO_ALUNO,
         a.nm_aluno           NOME_ALUNO,
         a.nu_codcurso        CODIGO_CURSO,
         c.nm_curso           NOME_CURSO,
         a.nu_codregiao       CODIGO_REGIAO,
         r.nm_regiao          NOME_REGIAO,
         cdt.nu_coddisciplina CODIGO_DISCIPLINA,
         d.nm_disciplina      NOME_DISCUPLINA,
         cdt.nu_codtutor      CODIGO_TUTOR,
         t.nm_tutor           NOME_TUTOR
  FROM   tb_aluno a,
         tb_curso c,
         tb_regiao r,
         tb_curso_disciplina_tutor cdt,
         tb_disciplina d,
         tb_tutor t
  WHERE  a.nu_codcurso = c.nu_codcurso
         AND a.nu_codregiao = r.nu_codregiao
         AND cdt.nu_codcurso = c.nu_codcurso
         AND d.nu_coddisciplina = cdt.nu_coddisciplina
         AND cdt.nu_codtutor = t.nu_codtutor
  ORDER  BY a.nu_codregiao,
            a.nu_codaluno,
            a.nu_codcurso,
            cdt.nu_coddisciplina; 