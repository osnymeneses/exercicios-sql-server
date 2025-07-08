USE Biblioteca

-- Cria��o das Tabelas
CREATE TABLE Livros (
    ID_Livro INT PRIMARY KEY IDENTITY(1,1),
    Titulo VARCHAR(100) NOT NULL,
    Autor VARCHAR(100),
    AnoPublicacao INT,
    Genero VARCHAR(50)
);

CREATE TABLE Usuarios (
    ID_Usuario INT PRIMARY KEY IDENTITY(1,1),
    Nome_Usuario VARCHAR(100) NOT NULL,
    DataInscricao DATE
);

CREATE TABLE Emprestimos (
    ID_Emprestimo INT PRIMARY KEY IDENTITY(1,1),
    ID_Livro INT,
    ID_Usuario INT,
    DataEmprestimo DATE,
    DataDevolucao DATE, -- Pode ser NULO se o livro ainda n�o foi devolvido
    FOREIGN KEY (ID_Livro) REFERENCES Livros(ID_Livro),
    FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID_Usuario)
);
GO

-- Inser��o de Dados de Exemplo
INSERT INTO Livros (Titulo, Autor, AnoPublicacao, Genero) VALUES
('O Hobbit', 'J.R.R. Tolkien', 1937, 'Fantasia'),
('A Revolu��o dos Bichos', 'George Orwell', 1945, 'S�tira Pol�tica'),
('Funda��o', 'Isaac Asimov', 1951, 'Fic��o Cient�fica'),
('O Guia do Mochileiro das Gal�xias', 'Douglas Adams', 1979, 'Fic��o Cient�fica'),
('O Nome do Vento', 'Patrick Rothfuss', 2007, 'Fantasia'),
('O Pequeno Pr�ncipe', 'Antoine de Saint-Exup�ry', 1943, 'Infantil');

INSERT INTO Usuarios (Nome_Usuario, DataInscricao) VALUES
('Ricardo Mendes', '2022-01-15'),
('Beatriz Almeida', '2022-03-22'),
('Thiago Costa', '2023-05-30'),
('Larissa Ferreira', '2023-09-01');

INSERT INTO Emprestimos (ID_Livro, ID_Usuario, DataEmprestimo, DataDevolucao) VALUES
(1, 2, '2024-05-10', '2024-06-08'), -- Beatriz pegou O Hobbit
(3, 1, '2024-06-01', '2024-06-29'), -- Ricardo pegou Funda��o
(2, 2, '2024-06-15', '2024-07-05'), -- Beatriz pegou A Revolu��o dos Bichos
(4, 3, '2024-06-20', NULL),          -- Thiago pegou O Guia... (e ainda n�o devolveu)
(1, 1, '2024-07-01', NULL);          -- Ricardo pegou O Hobbit (e ainda n�o devolveu)
GO

-- Verifica se os dados foram inseridos
SELECT * FROM Livros;
SELECT * FROM Usuarios;
SELECT * FROM Emprestimos;
GO