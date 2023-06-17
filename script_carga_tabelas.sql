BEGIN
--CARGA DA TABELA DE REGIAO
	 pk_mantem_entidades.pr_inclui_regiao('CRATO'); --1
	 pk_mantem_entidades.pr_inclui_regiao('SOBRAL'); --2
	 pk_mantem_entidades.pr_inclui_regiao('CRATEUS'); --3
	 pk_mantem_entidades.pr_inclui_regiao('TAUA'); --4

--CARGA DA TABELA DE TUTOR

	pk_mantem_entidades.pr_inclui_tutor('TUTOR 1 CRATO',1); --1
	pk_mantem_entidades.pr_inclui_tutor('TUTOR 2 CRATO',1); --2
	pk_mantem_entidades.pr_inclui_tutor('TUTOR 3 CRATO',1); --3

	pk_mantem_entidades.pr_inclui_tutor('TUTOR 1 SOBRAL',2); --4
	pk_mantem_entidades.pr_inclui_tutor('TUTOR 2 SOBRAL',2); --5
	pk_mantem_entidades.pr_inclui_tutor('TUTOR 3 SOBRAL',2); --6

	pk_mantem_entidades.pr_inclui_tutor('TUTOR 1 CRATEUS',3); --7
	pk_mantem_entidades.pr_inclui_tutor('TUTOR 2 CRATEUS',3); --8
	pk_mantem_entidades.pr_inclui_tutor('TUTOR 3 CRATEUS',3); --9
	
	pk_mantem_entidades.pr_inclui_tutor('TUTOR 1 TAUA',4); --10
	pk_mantem_entidades.pr_inclui_tutor('TUTOR 2 TAUA',4); --11
	pk_mantem_entidades.pr_inclui_tutor('TUTOR 3 TAUA',4); --12

--CARGA DA TABELA DE DISCIPLINA


	pk_mantem_entidades.pr_inclui_disciplina('DISCIPLINA 1'); --1
	pk_mantem_entidades.pr_inclui_disciplina('DISCIPLINA 2'); --2
	pk_mantem_entidades.pr_inclui_disciplina('DISCIPLINA 3'); --3
	pk_mantem_entidades.pr_inclui_disciplina('DISCIPLINA 4'); --4

--CARGA DA TABELA DE CURSO


	pk_mantem_entidades.pr_inclui_curso('CURSO 1 CRATO',1, 30); --2
	pk_mantem_entidades.pr_inclui_curso('CURSO 2 CRATO',1, 24); --3
	pk_mantem_entidades.pr_inclui_curso('CURSO 3 CRATO',1, 27); --4
	pk_mantem_entidades.pr_inclui_curso('CURSO 4 CRATO',1, 30); --5

	pk_mantem_entidades.pr_inclui_curso('CURSO 1 SOBRAL',2, 30); --6
	pk_mantem_entidades.pr_inclui_curso('CURSO 2 SOBRAL',2, 25); --7
	pk_mantem_entidades.pr_inclui_curso('CURSO 3 SOBRAL',2, 27); --8
	pk_mantem_entidades.pr_inclui_curso('CURSO 4 SOBRAL',2, 29); --9

	pk_mantem_entidades.pr_inclui_curso('CURSO 1 CRATEUS',3, 5); --10
	pk_mantem_entidades.pr_inclui_curso('CURSO 2 CRATEUS',3, 3); --11
	pk_mantem_entidades.pr_inclui_curso('CURSO 3 CRATEUS',3, 2); --12
	pk_mantem_entidades.pr_inclui_curso('CURSO 4 CRATEUS',3, 1); --13
	
	pk_mantem_entidades.pr_inclui_curso('CURSO 1 TAUA',4, 5); --14
	pk_mantem_entidades.pr_inclui_curso('CURSO 2 TAUA',4, 3); --15
	pk_mantem_entidades.pr_inclui_curso('CURSO 3 TAUA',4, 2); --16
	pk_mantem_entidades.pr_inclui_curso('CURSO 4 TAUA',4, 1); --17

--CARGA DA TABELA DE ALUNO

	
    pk_mantem_entidades.pr_inclui_aluno('ALUNO 1 CRATO CURSO 2',SYSDATE, 1, 2);
	pk_mantem_entidades.pr_inclui_aluno('ALUNO 2 CRATO CURSO 2',SYSDATE, 1, 2);
	pk_mantem_entidades.pr_inclui_aluno('ALUNO 3 CRATO CURSO 3',SYSDATE, 1, 3);
	pk_mantem_entidades.pr_inclui_aluno('ALUNO 4 CRATO CURSO 3',SYSDATE, 1, 3);
	pk_mantem_entidades.pr_inclui_aluno('ALUNO 5 CRATO CURSO 4',SYSDATE, 1, 4);
	pk_mantem_entidades.pr_inclui_aluno('ALUNO 6 CRATO CURSO 4',SYSDATE, 1, 4);
	pk_mantem_entidades.pr_inclui_aluno('ALUNO 7 CRATO CURSO 5',SYSDATE, 1, 5);
	pk_mantem_entidades.pr_inclui_aluno('ALUNO 8 CRATO CURSO 5',SYSDATE, 1, 5);
	pk_mantem_entidades.pr_inclui_aluno('ALUNO 9 CRATO CURSO 2',SYSDATE, 1, 2);
	pk_mantem_entidades.pr_inclui_aluno('ALUNO 10 CRATO CURSO 2',SYSDATE, 1, 2);

	pk_mantem_entidades.pr_inclui_aluno('ALUNO 1 SOBRAL CURSO 6',SYSDATE, 2, 6);
	pk_mantem_entidades.pr_inclui_aluno('ALUNO 2 SOBRAL CURSO 6',SYSDATE, 2, 6);
	pk_mantem_entidades.pr_inclui_aluno('ALUNO 3 SOBRAL CURSO 7',SYSDATE, 2, 7);
	pk_mantem_entidades.pr_inclui_aluno('ALUNO 4 SOBRAL CURSO 7',SYSDATE, 2, 7);
	pk_mantem_entidades.pr_inclui_aluno('ALUNO 5 SOBRAL CURSO 8',SYSDATE, 2, 8);
	pk_mantem_entidades.pr_inclui_aluno('ALUNO 6 SOBRAL CURSO 8',SYSDATE, 2, 8);
	pk_mantem_entidades.pr_inclui_aluno('ALUNO 7 SOBRAL CURSO 9',SYSDATE, 2, 9);
	pk_mantem_entidades.pr_inclui_aluno('ALUNO 8 SOBRAL CURSO 9',SYSDATE, 2, 9);
	pk_mantem_entidades.pr_inclui_aluno('ALUNO 9 SOBRAL CURSO 6',SYSDATE, 2, 6);
	pk_mantem_entidades.pr_inclui_aluno('ALUNO 10 SOBRAL2 CURSO 6',SYSDATE, 2, 6);

	pk_mantem_entidades.pr_inclui_aluno('ALUNO 1 CRATEUS CURSO 10',SYSDATE, 3, 10);
	pk_mantem_entidades.pr_inclui_aluno('ALUNO 2 CRATEUS CURSO 10',SYSDATE, 3, 10);
	pk_mantem_entidades.pr_inclui_aluno('ALUNO 3 CRATEUS CURSO 11',SYSDATE, 3, 11);
	pk_mantem_entidades.pr_inclui_aluno('ALUNO 4 CRATEUS CURSO 11',SYSDATE, 3, 11);
	pk_mantem_entidades.pr_inclui_aluno('ALUNO 5 CRATEUS CURSO 12',SYSDATE, 3, 12);
	pk_mantem_entidades.pr_inclui_aluno('ALUNO 6 CRATEUS CURSO 12',SYSDATE, 3, 12);
	pk_mantem_entidades.pr_inclui_aluno('ALUNO 7 CRATEUS CURSO 13',SYSDATE, 3, 13);
	pk_mantem_entidades.pr_inclui_aluno('ALUNO 9 CRATEUS CURSO 10',SYSDATE, 3, 10);
	pk_mantem_entidades.pr_inclui_aluno('ALUNO 10 CRATEUS CURSO 10',SYSDATE, 3, 10);
  
	pk_mantem_entidades.pr_inclui_aluno('ALUNO 1 TAUA CURSO 14',SYSDATE, 4, 14);
	pk_mantem_entidades.pr_inclui_aluno('ALUNO 2 TAUA CURSO 14',SYSDATE, 4, 14);
	pk_mantem_entidades.pr_inclui_aluno('ALUNO 3 TAUA CURSO 15',SYSDATE, 4, 15);
	pk_mantem_entidades.pr_inclui_aluno('ALUNO 4 TAUA CURSO 15',SYSDATE, 4, 15);
	pk_mantem_entidades.pr_inclui_aluno('ALUNO 5 TAUA CURSO 16',SYSDATE, 4, 16);
	pk_mantem_entidades.pr_inclui_aluno('ALUNO 6 TAUA CURSO 16',SYSDATE, 4, 16);
	pk_mantem_entidades.pr_inclui_aluno('ALUNO 7 TAUA CURSO 17',SYSDATE, 4, 17);
	pk_mantem_entidades.pr_inclui_aluno('ALUNO 9 TAUA CURSO 14',SYSDATE, 4, 14);
	pk_mantem_entidades.pr_inclui_aluno('ALUNO 10 TAUA CURSO 14',SYSDATE, 4, 14);    

--CARGA DE TUTORES E DISCIPLINAS DO CURSO 2 DO CRATO
pk_mantem_entidades.pr_inclui_curso_disciplina_tutor(2, 1, 1); 
pk_mantem_entidades.pr_inclui_curso_disciplina_tutor(2, 2, 2); 
pk_mantem_entidades.pr_inclui_curso_disciplina_tutor(2, 3, 3); 
pk_mantem_entidades.pr_inclui_curso_disciplina_tutor(2, 4, 3); 
  

--CARGA DE TUTORES E DISCIPLINAS DO CURSO 3 DO CRATO 
pk_mantem_entidades.pr_inclui_curso_disciplina_tutor(3, 1, 1); 
pk_mantem_entidades.pr_inclui_curso_disciplina_tutor(3, 2, 2); 
pk_mantem_entidades.pr_inclui_curso_disciplina_tutor(3, 3, 2); 
pk_mantem_entidades.pr_inclui_curso_disciplina_tutor(3, 4, 3);  

--CARGA DE TUTORES E DISCIPLINAS DO CURSO 1 DE SOBRAL
pk_mantem_entidades.pr_inclui_curso_disciplina_tutor(6, 1, 4); 
pk_mantem_entidades.pr_inclui_curso_disciplina_tutor(6, 2, 4); 
pk_mantem_entidades.pr_inclui_curso_disciplina_tutor(6, 3, 5); 
pk_mantem_entidades.pr_inclui_curso_disciplina_tutor(6, 4, 6);   

--CARGA DE TUTORES E DISCIPLINAS DO CURSO 1 DE CRATEUS
pk_mantem_entidades.pr_inclui_curso_disciplina_tutor(10, 1, 7); 
pk_mantem_entidades.pr_inclui_curso_disciplina_tutor(10, 2, 7); 
pk_mantem_entidades.pr_inclui_curso_disciplina_tutor(10, 3, 8); 
pk_mantem_entidades.pr_inclui_curso_disciplina_tutor(10, 4, 9);  

--CARGA DE TUTORES E DISCIPLINAS DO CURSO 1 DE TAUA
pk_mantem_entidades.pr_inclui_curso_disciplina_tutor(14, 1, 10); 
pk_mantem_entidades.pr_inclui_curso_disciplina_tutor(14, 2, 11); 
pk_mantem_entidades.pr_inclui_curso_disciplina_tutor(14, 3, 12); 
pk_mantem_entidades.pr_inclui_curso_disciplina_tutor(14, 4, 12);  

END;
