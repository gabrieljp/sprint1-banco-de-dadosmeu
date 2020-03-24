-- Cria um banco de dados
CREATE DATABASE Tipos_Join;
GO

-- Define o uso do banco de dados
USE Tipos_Join;
GO

-- Cria as tabelas
CREATE TABLE TiposUsuario(
	IdTipoUsuario	INT PRIMARY KEY IDENTITY,
	Titulo			VARCHAR (150) UNIQUE NOT NULL
);
GO

CREATE TABLE Usuarios(
	IdUsuario		INT PRIMARY KEY IDENTITY,
	Nome			VARCHAR (150) NOT NULL,
	TipoUsuario		INT FOREIGN KEY REFERENCES TiposUsuario(IdTipoUsuario)
);
GO

-- Insere dois tipos de usu�rio
INSERT INTO TiposUsuario (Titulo)
VALUES					 ('Administrador'), ('Comum'), ('Moderador');
GO

-- Insere dois usu�rios
INSERT INTO Usuarios (Nome, TipoUsuario)
VALUES				 ('Usu�rio A', 1), ('Usu�rio B', 2);
GO

-- Insere um usu�rio sem definir o tipo de usu�rio
INSERT INTO Usuarios (Nome)
VALUES				 ('Usu�rio C');
GO

-- Lista todos os tipos de usu�rio
SELECT IdTipoUsuario, Titulo FROM TiposUsuario;

-- Lista todos os usu�rios
SELECT IdUsuario, Nome, TipoUsuario FROM Usuarios;

-- Lista todos os usu�rios mostrando as informa��es do tipo de usu�rio
SELECT IdUsuario, Nome, Titulo FROM Usuarios
-- JOIN TiposUsuario OU
INNER JOIN TiposUsuario
--			NULL		=				1, 2 OU 3 ? X
ON Usuarios.TipoUsuario = TiposUsuario.IdTipoUsuario;

-- Lista todos os usu�rios mostrando as informa��es do tipo de usu�rio
-- mesmo que um usu�rio n�o tenha tipo definido
SELECT IdUsuario, Nome, Titulo FROM Usuarios
LEFT JOIN TiposUsuario
ON Usuarios.TipoUsuario = TiposUsuario.IdTipoUsuario;

-- Lista os usu�rios mostrando as informa��es do tipo de usu�rio
-- e todos os tipos de usu�rio, mesmo que n�o tenha um usu�rio pra este tipo
SELECT IdUsuario, Nome, Titulo FROM Usuarios
RIGHT JOIN TiposUsuario
ON Usuarios.TipoUsuario = TiposUsuario.IdTipoUsuario;