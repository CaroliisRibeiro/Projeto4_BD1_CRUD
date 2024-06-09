SELECT * FROM Livro WHERE Autor = 'Nome do Autor';

SELECT * FROM Emprestimo WHERE ID_Usuario = ID_DO_USUARIO;

SELECT * FROM Livro WHERE Status = true;

SELECT * FROM Funcionario WHERE Funcao = 'Nome da Função';

SELECT * FROM Usuario u
JOIN Multa m ON u.ID_Usuario = m.ID_Usuario;

SELECT * FROM Promocoes WHERE ID_Livro = ID_DO_LIVRO;


INSERT INTO Funcionario (Id_Func, Nome, Sobrenome, Endereco, Cidade, Estado, CEP, Telefone) 
VALUES ('F1001', 'João', 'Silva', 'Rua A, 123', 'São Paulo', 'SP', '12345-678', '(11) 1234-5678');


UPDATE Funcionario 
SET Nome = 'José', Sobrenome = 'Pereira' 
WHERE Id_Func = 'F1001';


DELETE FROM Aluno 
WHERE ID_Aluno = 'A2024001';


CREATE TABLE Editora (
    ID_Editora INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100),
    Endereco VARCHAR(255),
    Telefone VARCHAR(20)
);

ALTER TABLE Livro
ADD COLUMN Ano_Publicacao YEAR;


DROP TABLE Editora;
