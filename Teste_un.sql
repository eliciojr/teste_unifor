
1 - Demosntrar o entendimento do negocio
2 - Demosntrar a criação das tabelas com pk e fk e TRIGGER
3 - Demonstrar Modelo DER com seus respectivos relacionamentos xx
3 - Demosntrar a criação do pacote e pacote BODY
4 - Demonstrar a carga das tabelas via uso do pacote
5 - Fazer testes com os dados (Incluir, deletar, excluir)
	pk_mantem_entidades.pr_inclui_aluno('ALUNO 8 CRATEUS CURSO 13',SYSDATE, 3, 13); --erro
	pk_mantem_entidades.pr_inclui_aluno('ALUNO 8 TAUA CURSO 13',SYSDATE, 4, 17); --erro
	pk_mantem_entidades.pr_altera_aluno(38,'ALUNO 10 TAUA CURSO 14',SYSDATE, 4, 14);	
	pk_mantem_entidades.pr_inclui_curso_disciplina_tutor(3, 1, 2); --curso 2 crato diciplina 1 tutor 1 --ERRO
	pk_mantem_entidades.pr_deleta_curso_disciplina_tutor(14, 4, 12);  
	pk_mantem_entidades.pr_inclui_curso_disciplina_tutor(14, 4, 12);  
	
6 - Demonstrar a criação da view
7 - Executar a view
8 - Mostar a criação da trigger grande xx
9 - Executar a trigger
   insert into tb_curso_disciplina_tutor
          (nu_codcurso, nu_coddisciplina, nu_codtutor)	value (3,1,2);
10 - Subir os artefatos para o git/github	xx
11 - Mostrar os objeto no git	  







