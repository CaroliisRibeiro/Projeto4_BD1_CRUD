INSERT INTO E_book (Editora, Autor, Edicao, ID_book, Status, Genero, Area) 
VALUES ('Editora Y', 'Autor 2', '2nd Edition', 1, 1, 'Ficção', 'Aventura');

INSERT INTO Devolucao (id, idLivro, quantidade, IdUsuario, datadevolução) 
VALUES (1, 1, 1, 1, '2024-04-23');

INSERT INTO Espaco (local, disponibilidade, id-evento) 
VALUES ('Sala de Aula 101', 30, NULL);

INSERT INTO Aluno (data-nascimento, endereço, mesnalidade-id, aluno-id, serie, telefone, email, cpf) 
VALUES ('2000-05-15', 'Rua D, 123', NULL, '2024001', NULL, '987654321', 'maria@email.com', NULL);

INSERT INTO Professor (prof-id, email, data-nascimento, telefone, salario) 
VALUES ('P2024', 'carlos@email.com', '1980-02-10', '999888777', NULL);

INSERT INTO Devolucao (ID_Devolucao, ID_Livro, Quant_Exemplares, Data_Dev, ID_Func, ID_Usuario) 
VALUES (1, 1, 1, '2024-04-23', 1, 1);

INSERT INTO Midia (ID_Func, Mundo, Tema, Area, Local, E_mail_Biblioteca, Midia_TIPO) 
VALUES (1, 'Digital', 'Tecnologia', 'Informática', 'Online', 'biblioteca@email.com', 1);

INSERT INTO Aluno (Nome, Matricula, Data_Nascimento, Endereco, Telefone, Email, Curso)
VALUES ('Maria Silva', '2024001', '2000-05-15', 'Rua D, 123', '987654321', 'maria@email.com', 'Engenharia Civil');

INSERT INTO Professor (Nome, Matricula, Data_Nascimento, Endereco, Telefone, Email, Disciplina)
VALUES ('Carlos Oliveira', 'P2024', '1980-02-10', 'Av. Principal, 456', '999888777', 'carlos@email.com', 'Matemática');

INSERT INTO Espaco (Nome, Capacidade, Tipo, Localizacao)
VALUES ('Sala de Aula 101', 30, 'Sala de Aula', 'Bloco A, 1º Andar');

INSERT INTO Mensalidade (ID_Aluno, Valor, Data_Vencimento, Status_Pagamento)
VALUES (1, 500.00, '2024-04-30', 'Pendente');
