# exercicios-sql-server
Meus exercícios de SQL para iniciantes e intermediários

# Projeto de Exercícios SQL - Gestão de Biblioteca

Este repositório contém um conjunto de exercícios de nível iniciante, desenvolvidos para praticar e solidificar os conhecimentos fundamentais em T-SQL (a versão do SQL para o Microsoft SQL Server).

O objetivo deste projeto é simular um ambiente de banco de dados real, mas simplificado, para treinar as operações mais comuns do dia a dia de um desenvolvedor ou analista de dados.

##  cenário do Projeto

O banco de dados simula o sistema de gerenciamento de uma pequena biblioteca pública, contendo as seguintes entidades:

* **Livros**: O catálogo com informações sobre cada livro.
* **Usuarios**: Um registro dos membros cadastrados na biblioteca.
* **Emprestimos**: Um histórico de quais livros foram emprestados para quais usuários, incluindo as datas.

## 📂 Estrutura do Repositório

* `Setup_Biblioteca.sql`: Script principal que contém os comandos DDL (`CREATE TABLE`) para criar toda a estrutura do banco de dados e os comandos DML (`INSERT INTO`) para popular as tabelas com dados de exemplo. O script foi projetado para ser reutilizável.
* `Exercicios_Biblioteca.sql`: Arquivo contendo uma lista de problemas e desafios a serem resolvidos. As perguntas são apresentadas como comentários, seguidas pelas soluções em código SQL.

## 🚀 Como Utilizar

Para recriar o ambiente e praticar os exercícios, siga os passos abaixo:

1.  Certifique-se de que você tem uma instância do **Microsoft SQL Server** instalada e em execução.
2.  Conecte-se à sua instância através do **SQL Server Management Studio (SSMS)**.
3.  Abra o arquivo `Setup_Biblioteca.sql` no SSMS.
4.  Execute o script inteiro (pressionando F5 ou clicando em "Execute"). Isso criará as tabelas e inserirá os dados de exemplo.
5.  Abra o arquivo `Exercicios_Biblioteca.sql`.
6.  Leia cada exercício (comentado no código) e tente escrever sua própria solução antes de olhar o gabarito fornecido logo abaixo da pergunta.

## 💡 Conceitos Praticados

Este conjunto de exercícios foca nos seguintes conceitos fundamentais do SQL:

* **DDL (Data Definition Language)**: `CREATE TABLE`, `DROP TABLE`.
* **DML (Data Manipulation Language)**: `INSERT`, `UPDATE`, `DELETE`.
* **DQL (Data Query Language)**:
    * Consultas com `SELECT` e `FROM`.
    * Filtragem de dados com `WHERE` e operadores (`=`, `<`, `>`, `LIKE`, `IS NULL`).
    * Ordenação de resultados com `ORDER BY`.
    * Funções de agregação simples como `COUNT()`.
    * Junção de tabelas com `INNER JOIN`.
* **Funções Nativas do T-SQL**: `GETDATE()`, `YEAR()`.

## ✍️ Autor

* **[Osny Meneses]**

