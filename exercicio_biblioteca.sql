USE Biblioteca

SELECT * FROM Emprestimos
SELECT * FROM Livros
SELECT * FROM Usuarios

-- Consultas Simples (SELECT, WHERE, ORDER BY)
-- 1 - Selecione o t�tulo e o autor de todos os livros da biblioteca.
	SELECT Livros.Titulo, Livros.Autor FROM Livros

-- 2 -Encontre todos os livros publicados antes do ano 2000.
	SELECT * FROM Livros
	WHERE Livros.AnoPublicacao < '2000';

-- 3 - Liste todos os livros do g�nero 'Fantasia', ordenados pelo AnoPublicacao (do mais antigo para o mais novo).
	SELECT * FROM Livros
	WHERE Genero = 'Fantasia'
	ORDER BY AnoPublicacao;

-- 4 - Quais usu�rios se inscreveram na biblioteca em 2022?
	SELECT Usuarios.Nome_Usuario, Usuarios.DataInscricao FROM Usuarios
	WHERE YEAR(DataInscricao) = 2022;

-- 5 - Quais empr�stimos ainda n�o foram devolvidos? (Dica: a DataDevolucao estar� nula).
	SELECT * FROM Emprestimos WHERE DataDevolucao IS NULL;

-- Fun��es de Agrega��o Simples (COUNT)
-- 6 - Quantos livros do autor 'J.R.R. Tolkien' existem no cat�logo?
	SELECT COUNT(*) AS 'Qtd de Livros'FROM Livros
	WHERE Autor = 'J.R.R. Tolkien';

-- 7 - Quantos empr�stimos foram realizados no total (registrados na tabela Emprestimos)?
	SELECT COUNT(*) AS 'Total Empr�stimo' FROM Emprestimos

--Jun��o de Tabelas (INNER JOIN)
-- 8 - Crie uma consulta que mostre o nome do usu�rio e o t�tulo do livro para cada empr�stimo realizado.
	SELECT U.Nome_Usuario, L.Titulo
	FROM Emprestimos AS E
	INNER JOIN Usuarios AS U ON E.ID_Usuario = U.ID_Usuario
	INNER JOIN Livros AS L ON E.ID_Livro = L.ID_Livro;
-- 9 - Qual usu�rio pegou emprestado o livro com o t�tulo 'Funda��o'? Mostre apenas o nome do usu�rio.
	SELECT U.Nome_Usuario
	FROM Emprestimos AS E
	INNER JOIN Usuarios AS U ON E.ID_Usuario = U.ID_Usuario
	INNER JOIN Livros AS L ON E.ID_Livro = L.ID_Livro
	WHERE L.Titulo = 'Funda��o';
-- Manipula��o de Dados (INSERT, UPDATE)
-- 10 - Um novo usu�rio chamado 'Lucas Martins' se inscreveu na biblioteca hoje. Adicione-o � tabela Usuarios. (Dica: use a fun��o GETDATE() para a data atual).
	INSERT INTO Usuarios (Nome_Usuario, DataInscricao)
	VALUES ('Lucas Martins', GETDATE())

-- 11 - O usu�rio 'Ricardo Mendes' devolveu o livro 'O Hobbit' hoje. Atualize o registro de empr�stimo correspondente na tabela Emprestimos, preenchendo a DataDevolucao com a data atual.
	UPDATE Emprestimos 
	SET DataDevolucao = GETDATE()
	WHERE Emprestimos.ID_Usuario  = 1 AND Emprestimos.ID_Livro = 1;

	/*UPDATE Emprestimos
SET DataDevolucao = GETDATE()
WHERE ID_Livro = (SELECT ID_Livro FROM Livros WHERE Titulo = 'O Hobbit')
  AND ID_Usuario = (SELECT ID_Usuario FROM Usuarios WHERE Nome_Usuario = 'Ricardo Mendes')
  AND DataDevolucao IS NULL; -- Importante para garantir que estamos atualizando o empr�stimo correto (o que est� em aberto)
  */