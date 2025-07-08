USE Biblioteca

SELECT * FROM Emprestimos
SELECT * FROM Livros
SELECT * FROM Usuarios

-- Consultas Simples (SELECT, WHERE, ORDER BY)
-- 1 - Selecione o título e o autor de todos os livros da biblioteca.
	SELECT Livros.Titulo, Livros.Autor FROM Livros

-- 2 -Encontre todos os livros publicados antes do ano 2000.
	SELECT * FROM Livros
	WHERE Livros.AnoPublicacao < '2000';

-- 3 - Liste todos os livros do gênero 'Fantasia', ordenados pelo AnoPublicacao (do mais antigo para o mais novo).
	SELECT * FROM Livros
	WHERE Genero = 'Fantasia'
	ORDER BY AnoPublicacao;

-- 4 - Quais usuários se inscreveram na biblioteca em 2022?
	SELECT Usuarios.Nome_Usuario, Usuarios.DataInscricao FROM Usuarios
	WHERE YEAR(DataInscricao) = 2022;

-- 5 - Quais empréstimos ainda não foram devolvidos? (Dica: a DataDevolucao estará nula).
	SELECT * FROM Emprestimos WHERE DataDevolucao IS NULL;

-- Funções de Agregação Simples (COUNT)
-- 6 - Quantos livros do autor 'J.R.R. Tolkien' existem no catálogo?
	SELECT COUNT(*) AS 'Qtd de Livros'FROM Livros
	WHERE Autor = 'J.R.R. Tolkien';

-- 7 - Quantos empréstimos foram realizados no total (registrados na tabela Emprestimos)?
	SELECT COUNT(*) AS 'Total Empréstimo' FROM Emprestimos

--Junção de Tabelas (INNER JOIN)
-- 8 - Crie uma consulta que mostre o nome do usuário e o título do livro para cada empréstimo realizado.
	SELECT U.Nome_Usuario, L.Titulo
	FROM Emprestimos AS E
	INNER JOIN Usuarios AS U ON E.ID_Usuario = U.ID_Usuario
	INNER JOIN Livros AS L ON E.ID_Livro = L.ID_Livro;
-- 9 - Qual usuário pegou emprestado o livro com o título 'Fundação'? Mostre apenas o nome do usuário.
	SELECT U.Nome_Usuario
	FROM Emprestimos AS E
	INNER JOIN Usuarios AS U ON E.ID_Usuario = U.ID_Usuario
	INNER JOIN Livros AS L ON E.ID_Livro = L.ID_Livro
	WHERE L.Titulo = 'Fundação';
-- Manipulação de Dados (INSERT, UPDATE)
-- 10 - Um novo usuário chamado 'Lucas Martins' se inscreveu na biblioteca hoje. Adicione-o à tabela Usuarios. (Dica: use a função GETDATE() para a data atual).
	INSERT INTO Usuarios (Nome_Usuario, DataInscricao)
	VALUES ('Lucas Martins', GETDATE())

-- 11 - O usuário 'Ricardo Mendes' devolveu o livro 'O Hobbit' hoje. Atualize o registro de empréstimo correspondente na tabela Emprestimos, preenchendo a DataDevolucao com a data atual.
	UPDATE Emprestimos 
	SET DataDevolucao = GETDATE()
	WHERE Emprestimos.ID_Usuario  = 1 AND Emprestimos.ID_Livro = 1;

	/*UPDATE Emprestimos
SET DataDevolucao = GETDATE()
WHERE ID_Livro = (SELECT ID_Livro FROM Livros WHERE Titulo = 'O Hobbit')
  AND ID_Usuario = (SELECT ID_Usuario FROM Usuarios WHERE Nome_Usuario = 'Ricardo Mendes')
  AND DataDevolucao IS NULL; -- Importante para garantir que estamos atualizando o empréstimo correto (o que está em aberto)
  */