/* Normalização 3NF:

tabela Bibliotecario: 
criação de referências

tabela Multa: 
criação de uma chave primária ID_MULTA, substituindo antiga chave primária composta

tabela Implica_Emprestimo_Devolucao_Multa: 
criação de chave primária, criação de referências

tabela Entrada_de_dinheiro_Taxas_Escola_Aluguel_de_Espaco_Cantina_Venda_de_produtos_Financas_E_comerce_Mensalidade_Multa:
	dividida em tabelas menores para normalização

tabela Aplica_Midia_E_comerce_Promocoes: 
dividida em tabelas menores para normalização

tabela Efetua_Emprestimo_E_book_Livro_Usuario_Devolucao_Bibliotecario: 
criação de referências

tabela Coordena_Doacao_Midia_E_comerce_Bibliotecario_Estoque:
	dividida em tabelas menores para normalização, criação de referências conforme 3NF

tabela Possui_Bibliotecario_E_book_Usuario_Biblioteca_Estoque 
	dividida em tabelas menores para normalização, criação de referências conforme 3NF

tabela E_commerce: 
criação de chave primária única

tabela Biblioteca:
criação de referências

tabela Escola:
criação de referências

tabela Aluno:
criação de referências
 */

CREATE TABLE Funcionario (
    Id_Func INT PRIMARY KEY,
    Mat_Funcionario VARCHAR,
    Data_Nasc DATE,
    E_mail VARCHAR,
    Funcao VARCHAR,
    Salario FLOAT,
    CPF VARCHAR(11),
    Telefone VARCHAR(15),
    Nome VARCHAR
);

CREATE TABLE Bibliotecario (
    Id_Bibliotecario INT PRIMARY KEY,
    Login_biblioteca VARCHAR,
    Senha VARCHAR,
    fk_Funcionario_ID_Func INT,
    FOREIGN KEY (fk_Funcionario_ID_Func) REFERENCES Funcionario(Id_Func)
);

CREATE TABLE Emprestimo (
    Tempo_Permanencia TIME,
    ID_Usuario INT,
    Data_Emprest DATE,
    ID_Emprest INT PRIMARY KEY,
    fk_Funcionario_ID_Func INT,
    FOREIGN KEY (fk_Funcionario_ID_Func) REFERENCES Funcionario(Id_Func)
);

CREATE TABLE Devolucao (
    ID_Devolucao INT,
    ID_Livro INT PRIMARY KEY,
    Quant_Exemplares INT,
    ID_Usuario INT,
    Data_Dev DATE,
    fk_Funcionario_ID_Func INT,
    FOREIGN KEY (fk_Funcionario_ID_Func) REFERENCES Funcionario(Id_Func)
);

CREATE TABLE Multa (
    ID_Multa INT PRIMARY KEY,
    Data_Emprest DATE,
    Data_Dev DATE,
    Tempo_Permanencia TIME,
    Livro_Danificado BOOLEAN,
    ID_Livro INT,
    ID_Usuario INT
);

CREATE TABLE Implica_Emprestimo_Devolucao_Multa (
    ID_Implicacao INT PRIMARY KEY,
    fk_Devolucao_ID INT,
    fk_Multa_ID INT,
    FOREIGN KEY (fk_Devolucao_ID) REFERENCES Devolucao(ID_Devolucao),
    FOREIGN KEY (fk_Multa_ID) REFERENCES Multa(ID_Multa)
);

CREATE TABLE Entrada_de_dinheiro_Taxas (
    ID INT PRIMARY KEY,
    fk_Taxa_Id INT,
    fk_Escola_ID_Matricula INT,
    FOREIGN KEY (fk_Taxa_Id) REFERENCES Taxas(Taxa_Id),
    FOREIGN KEY (fk_Escola_ID_Matricula) REFERENCES Escola(ID_Matricula)
);

CREATE TABLE Entrada_de_dinheiro_Aluguel_de_Espaco (
    ID INT PRIMARY KEY,
    fk_Espaco_Id INT,
    FOREIGN KEY (fk_Espaco_Id) REFERENCES Aluguel_de_Espaco(Espaco_Id)
);

CREATE TABLE Entrada_de_dinheiro_Venda_de_produtos (
    ID INT PRIMARY KEY,
    fk_Loja_Id INT,
    FOREIGN KEY (fk_Loja_Id) REFERENCES Venda_de_produtos(Loja_Id)
);

CREATE TABLE Entrada_de_dinheiro_Financas (
    ID INT PRIMARY KEY,
    fk_Fin_Id INT,
    FOREIGN KEY (fk_Fin_Id) REFERENCES Financas(Fin_Id)
);

CREATE TABLE Entrada_de_dinheiro_E_comerce (
    ID INT PRIMARY KEY,
    fk_Livro_Id INT,
    fk_Vendedor_Id INT,
    fk_Cliente_Id INT,
    FOREIGN KEY (fk_Livro_Id) REFERENCES E_comerce(ID_Livro),
    FOREIGN KEY (fk_Vendedor_Id) REFERENCES E_comerce(ID_Vendedor),
    FOREIGN KEY (fk_Cliente_Id) REFERENCES E_comerce(ID_Cliente)
);

CREATE TABLE Entrada_de_dinheiro_Mensalidade (
    ID INT PRIMARY KEY,
    fk_Mens_Id INT,
    FOREIGN KEY (fk_Mens_Id) REFERENCES Mensalidade(Mens_Id)
);

CREATE TABLE Entrada_de_dinheiro_Multa (
    ID INT PRIMARY KEY,
    fk_Multa_Id INT,
    FOREIGN KEY (fk_Multa_Id) REFERENCES Multa(ID_Multa)
);

CREATE TABLE Aplica_Midia (
    ID INT PRIMARY KEY,
    fk_Midia_E_mail_Biblioteca VARCHAR,
    fk_Funcionario_ID_Func INT,
    FOREIGN KEY (fk_Funcionario_ID_Func) REFERENCES Funcionario(Id_Func),
    FOREIGN KEY (fk_Midia_E_mail_Biblioteca) REFERENCES Midia(E_mail_Biblioteca)
);

CREATE TABLE Aplica_E_comerce (
    ID INT PRIMARY KEY,
    fk_Livro_ID INT,
    fk_Vendedor_ID INT,
    fk_Cliente_ID INT,
    FOREIGN KEY (fk_Livro_ID, fk_Vendedor_ID, fk_Cliente_ID) REFERENCES E_comerce(ID_Livro, ID_Vendedor, ID_Cliente)
);

CREATE TABLE Aplica_Promocoes (
    ID INT PRIMARY KEY,
    fk_Livro_ID INT,
    fk_Usuario_ID INT,
    fk_Funcionario_ID_Func INT,
    FOREIGN KEY (fk_Funcionario_ID_Func) REFERENCES Funcionario(Id_Func),
    FOREIGN KEY (fk_Livro_ID) REFERENCES Promocoes(ID_Livro)
);


CREATE TABLE Livro (
    Autor VARCHAR,
    Ano DATE,
    Edicao VARCHAR,
    Titulo VARCHAR,
    Editora VARCHAR,
    Livro_Status BOOLEAN,
    ID_Livro INT PRIMARY KEY,
    Area VARCHAR,
    Genero VARCHAR
);

CREATE TABLE E_book (
    Editora VARCHAR,
    Autor VARCHAR,
    Edicao VARCHAR,
    ID_book INT PRIMARY KEY,
    E_book_Status BOOLEAN,
    Link VARCHAR,
    Genero VARCHAR,
    Area VARCHAR
);


CREATE TABLE Midia (
    ID_Midia INT PRIMARY KEY,
    Mundo VARCHAR,
    Tema VARCHAR,
    Area VARCHAR,
    localizacao VARCHAR,
    E_mail_Biblioteca VARCHAR,
    Midia_TIPO INT,
    fk_Funcionario_ID_Func INT,
    FOREIGN KEY (fk_Funcionario_ID_Func) REFERENCES Funcionario(Id_Func)
    
);

CREATE TABLE Promocoes (
    ID_Promocoes INT PRIMARY KEY
    ID_Livro INT,
    Promocoes_TIPO VARCHAR,
    fk_Funcionario_ID_Func INT,
    FOREIGN KEY (fk_Funcionario_ID_Func) REFERENCES Funcionario(Id_Func)
    
);


CREATE TABLE Doacao (
    ID_Doacao INT PRIMARY KEY,
    ID_Livro INT,
    Genero VARCHAR,
    Titulo VARCHAR,
    Autor VARCHAR,
    Editora VARCHAR,
    Area VARCHAR
);

CREATE TABLE E_comerce (
    ID_Ecomerce INT PRIMARY KEY,
    Titulo VARCHAR,
    Genero VARCHAR,
    Editora VARCHAR,
    Autor VARCHAR,
    Area VARCHAR,
    ID_Livro INT,
    ID_Vendedor INT,
    Cel INT,
    E_mail VARCHAR,
    ID_Cliente INT,
    E_comerce_TIPO INT,
    CNPJ INT
);

CREATE TABLE Biblioteca (
    idSala INT PRIMARY KEY,
    ID_Livro INT,
    ID_book INT,
    ID_Vendedor INT,
    ID_Cliente INT,
    E_mail_Biblioteca VARCHAR,
    fk_Bibliotecario_ID_Func INT,
    FOREIGN KEY (fk_Funcionario_ID_Func) REFERENCES Funcionario(Id_Func)
    FOREIGN KEY (ID_Livro) REFERENCES Livro(ID_Livro),
    FOREIGN KEY (ID_book) REFERENCES E_book(ID_book),
    FOREIGN KEY (ID_Func) REFERENCES Funcionario(Id_Func),
    FOREIGN KEY (ID_Vendedor) REFERENCES E_comerce(ID_Vendedor),
    FOREIGN KEY (ID_Cliente) REFERENCES E_comerce(ID_Cliente)
);

CREATE TABLE Escola (
    ID_Matricula INT PRIMARY KEY,
    Evento_Id INT,
    Cardapio_Id INT,
    Fin_Id INT,
    Func_Id INT,
    Disc_Id INT,
    Prof_Id INT,
    Lab_Id INT,
    Id_Depart INT,
    Aluno_Id INT,
    Nota_Id INT,
    Espaco_Id INT,
    Taxa_Id INT,
    Loja_Id INT,
    fk_Biblioteca_idSala INT,
    FOREIGN KEY (Evento_Id) REFERENCES Eventos(Evento_Id),
    FOREIGN KEY (Cardapio_Id) REFERENCES Cantina(Cardapio_Id),
    FOREIGN KEY (Fin_Id) REFERENCES Financas(Fin_Id),
    FOREIGN KEY (Func_Id) REFERENCES Funcionario(Id_Func),
    FOREIGN KEY (Disc_Id) REFERENCES Disciplina(DisC_Id),
    FOREIGN KEY (Prof_Id) REFERENCES Professor(Prof_Id),
    FOREIGN KEY (Lab_Id) REFERENCES Sala_Lab(id_sala_lab),
    FOREIGN KEY (Id_Depart) REFERENCES Departamento(Id_Depart),
    FOREIGN KEY (Aluno_Id) REFERENCES Aluno(Aluno_Id),
    FOREIGN KEY (Nota_Id) REFERENCES Disciplina(Nota_Id),
    FOREIGN KEY (Espaco_Id) REFERENCES Espacos(Evento_Id),
    FOREIGN KEY (Taxa_Id) REFERENCES Taxas(Taxa_Id),
    FOREIGN KEY (Loja_Id) REFERENCES Venda_de_produtos(Loja_Id),
    FOREIGN KEY (fk_Biblioteca_idSala) REFERENCES Biblioteca(idSala)
);

CREATE TABLE Aluno (
    Aluno_Id INT PRIMARY KEY,
    Data_Nasc DATE,
    Endereco VARCHAR,
    Mens_Id INT,
    Matricula_Id INT,
    Nota_Id INT,
    Ano_Serie SMALLINT,
    Telefone VARCHAR(15),
    E_mail VARCHAR(100),
    CPF VARCHAR(11),
    FOREIGN KEY (Mens_Id) REFERENCES Mensalidade(Mens_Id),
    FOREIGN KEY (Matricula_Id) REFERENCES Escola(ID_Matricula),
    FOREIGN KEY (Nota_Id) REFERENCES Disciplina(Nota_Id)
);

CREATE TABLE Extracurricular (
    Extra_Id INT PRIMARY KEY,
    Descricao VARCHAR,
    Carga_horaria INT,
    Alunos_inscritos INT,
    Horario TIMESTAMP
);

CREATE TABLE Mensalidade (
    Metodos_de_pagamento_aceito VARCHAR,
    Mens_Id INT PRIMARY KEY,
    Valor FLOAT,
    Vencimento DATE
);

CREATE TABLE Taxas (
    Tipo VARCHAR,
    Taxa_Id INT PRIMARY KEY,
    Metodos_de_pagamento_aceito VARCHAR
);

CREATE TABLE Financas (
    Movimentacao_dinheiro FLOAT,
    Fin_Id INT PRIMARY KEY,
    Despesas FLOAT,
    Saldo FLOAT
);

CREATE TABLE Disciplina (
    DisC_Id INT,
    Carga_horaria INT,
    Tipo VARCHAR,
    Nota_Id INT,
    PRIMARY KEY (DisC_Id, Nota_Id)
);

CREATE TABLE Professor (
    Prof_Id INT PRIMARY KEY,
    E_mail VARCHAR,
    Data_Nasc DATE,
    Telefone VARCHAR,
    Salario FLOAT
);

CREATE TABLE Sala_Lab (
    Localizacao VARCHAR,
    Disponibilidade BOOLEAN,
    id_sala_lab INT PRIMARY KEY
);

CREATE TABLE Departamento (
    AreaDepart VARCHAR,
    Id_Depart INT PRIMARY KEY
);


CREATE TABLE Parcerias (
    Beneficios VARCHAR,
    Tipo VARCHAR,
    Parceria_Id INT PRIMARY KEY,
    Data_de_inicio DATE
);

CREATE TABLE Eventos (
    Evento_Id INT PRIMARY KEY,
    Tipo VARCHAR,
    Duracao TIME
);

CREATE TABLE Espacos (
    Localizacao VARCHAR,
    Disponibilidade DATE,
    Evento_Id INT PRIMARY KEY
);

CREATE TABLE Aluguel_de_Espaco (
    Disponibilidade DATE,
    Espaco_Id INT PRIMARY KEY,
    Capacidade INT,
    Localizacao VARCHAR
);

CREATE TABLE Cantina (
    Metodos_de_pagamento_aceito VARCHAR,
    Cardapio_Id INT,
    Vendas_Anteriores INT,
    Preco FLOAT
);

CREATE TABLE Venda_de_produtos (
    Variedade VARCHAR,
    Vendas_anteriores INT,
    Estoque INT,
    Metodos_de_pagamento_aceito VARCHAR,
    Loja_Id INT PRIMARY KEY,
    Horario_de_funcionamento TIME
);

CREATE TABLE Estoque (
    Qtd_Exemplares INT,
    ID_Livro INT
);

CREATE TABLE Efetua_Emprestimo (
    ID INT PRIMARY KEY,
    fk_E_book_ID INT,
    fk_Livro_ID INT,
    fk_Devolucao_ID INT,
    fk_Bibliotecario_ID INT,
    FOREIGN KEY (fk_E_book_ID) REFERENCES E_book(ID_book),
    FOREIGN KEY (fk_Livro_ID) REFERENCES Livro(ID_Livro),
    FOREIGN KEY (fk_Devolucao_ID) REFERENCES Devolucao(ID_Devolucao),
    FOREIGN KEY (fk_Bibliotecario_ID) REFERENCES Bibliotecario(fk_Funcionario_ID_Func)
);

CREATE TABLE Cadastra_E_book_Bibliotecario (
    fk_E_book_ID_book INT,
    fk_Bibliotecario_ID_Func INT
);

CREATE TABLE Reserva_E_book (
    fk_E_book_ID_book INT
);

CREATE TABLE Coordena_Doacao (
    ID INT PRIMARY KEY,
    fk_Doacao_ID_Usuario INT,
    FOREIGN KEY (fk_Doacao_ID_Usuario) REFERENCES Usuario(ID_Usuario)
);

CREATE TABLE Coordena_Midia (
    ID INT PRIMARY KEY,
    fk_Midia_ID_Func INT,
    fk_Midia_E_mail_Biblioteca VARCHAR,
    FOREIGN KEY (fk_Midia_ID_Func, fk_Midia_E_mail_Biblioteca) REFERENCES Midia(ID_Func, E_mail_Biblioteca)
);

CREATE TABLE Coordena_E_comerce (
    ID INT PRIMARY KEY,
    fk_Livro_ID INT,
    fk_Vendedor_ID INT,
    fk_Cliente_ID INT,
    FOREIGN KEY (fk_Livro_ID, fk_Vendedor_ID, fk_Cliente_ID) REFERENCES E_comerce(ID_Livro, ID_Vendedor, ID_Cliente)
);

CREATE TABLE Coordena_Bibliotecario (
    ID INT PRIMARY KEY,
    fk_Bibliotecario_ID INT,
    FOREIGN KEY (fk_Bibliotecario_ID) REFERENCES Bibliotecario(fk_Funcionario_ID_Func)
);

CREATE TABLE Coordena_Estoque (
    ID INT PRIMARY KEY,
    fk_Retirada_ID_compra INT,
    FOREIGN KEY (fk_Retirada_ID_compra) REFERENCES Compra(ID_compra)
);


CREATE TABLE Possui_Bibliotecario (
    ID INT PRIMARY KEY,
    fk_Bibliotecario_ID INT,
    FOREIGN KEY (fk_Bibliotecario_ID) REFERENCES Bibliotecario(fk_Funcionario_ID_Func)
);

CREATE TABLE Possui_E_book (
    ID INT PRIMARY KEY,
    fk_E_book_ID INT,
    FOREIGN KEY (fk_E_book_ID) REFERENCES E_book(ID_book)
);

CREATE TABLE Possui_Biblioteca (
    ID INT PRIMARY KEY,
    fk_Biblioteca_idSala INT,
    FOREIGN KEY (fk_Biblioteca_idSala) REFERENCES Biblioteca(idSala)
);

CREATE TABLE Estuda (
    fk_Aluno_Aluno_Id INT,
    fk_Escola_ID_Matricula INT
);

CREATE TABLE Cursa_Extracurricular_Disciplina_Aluno (
    fk_Extracurricular_Extra_Id INT,
    fk_Disciplina_DisC_Id INT,
    fk_Disciplina_Nota_Id INT,
    fk_Aluno_Aluno_Id INT
);

CREATE TABLE Paga_Aluno_Taxas_Mensalidade (
    fk_Aluno_Aluno_Id INT,
    fk_Taxas_Taxa_Id INT,
    fk_Mensalidade_Mens_Id INT
);


CREATE TABLE Ensina (
    fk_Disciplina_DisC_Id INT,
    fk_Disciplina_Nota_Id INT,
    fk_Professor_Prof_Id INT
);

CREATE TABLE Reserva (
    fk_Sala_Lab_id_sala_lab INT,
    fk_Professor_Prof_Id INT
);

CREATE TABLE Trabalha_em_Departamento_Professor_Funcionario (
    fk_Departamento_Id_Depart INT,
    fk_Professor_Prof_Id INT,
    fk_Funcionario_Id_Func INT
);

CREATE TABLE Faz_parte (
    fk_Departamento_Id_Depart INT,
    fk_Escola_ID_Matricula INT
);

CREATE TABLE Tem (
    fk_Escola_ID_Matricula INT
);

CREATE TABLE Oragniza (
    fk_Eventos_Evento_Id INT,
    fk_Escola_ID_Matricula INT
);

CREATE TABLE Reserva (
    fk_Espacos_Evento_Id INT,
    fk_Eventos_Evento_Id INT
);

CREATE TABLE Contem (
    fk_Livro_ID_Livro INT
);


CREATE TABLE Adiciona (
    fk_Doacao_ID_Usuraio INT
);

CREATE TABLE Compra (
    ID_compra INT PRIMARY KEY,
    fk_E_commerce_ID_Livro INT,
    fk_E_commerce_ID_Cliente INT
);

CREATE TABLE Reserva_Livro (
    fk_Livro_ID_Livro INT
);

CREATE TABLE Cadastra_Livro_Bibliotecario (
    fk_Livro_ID_Livro INT,
    fk_Bibliotecario_ID_Func INT
);

CREATE TABLE Terceiros (
    fk_E_commerce_ID_Cliente INT PRIMARY KEY,
    Telefone INT,
    Nome VARCHAR,
    CPF INT,
    Endereco VARCHAR
);

ALTER TABLE Aplica_Midia_E_comerce_Promocoes ADD CONSTRAINT FK_Aplica_Midia_E_comerce_Promocoes_3
    FOREIGN KEY (fk_Promocoes_ID_Livro, fk_Promocoes_ID_Usuario???, fk_Promocoes_ID_Func)
    REFERENCES Promocoes (ID_Livro, ???, ID_Func)
    ON DELETE NO ACTION;
    
ALTER TABLE Entrada_de_dinheiro_Taxas_Escola_Aluguel_de_Espaco_Cantina_Venda_de_produtos_Financas_E_comerce_Mensalidade_Multa ADD CONSTRAINT FK_Entrada_de_dinheiro_Taxas_Escola_Aluguel_de_Espaco_Cantina_Venda_de_produtos_Financas_E_comerce_Mensalidade_Multa_8
    FOREIGN KEY (fk_Multa_ID_livro, fk_Multa_ID_Usuario)
    REFERENCES Multa (ID_livro, ID_Usuario)
    ON DELETE NO ACTION;

ALTER TABLE Possui_Bibliotecario_E_book_Usuario_Biblioteca_Estoque ADD CONSTRAINT FK_Possui_Bibliotecario_E_book_Usuario_Biblioteca_Estoque_3
    FOREIGN KEY (fk_Usuario_ID_Usuario)
    REFERENCES Usuario (ID_Usuario)
    ON DELETE NO ACTION;

ALTER TABLE Efetua_Emprestimo_E_book_Livro_Usuario_Devolucao_Bibliotecario ADD CONSTRAINT FK_Efetua_Emprestimo_E_book_Livro_Usuario_Devolucao_Bibliotecario_3
    FOREIGN KEY (fk_Usuario_ID_Usuario???)
    REFERENCES ??? (???)
    ON DELETE NO ACTION;

ALTER TABLE Implica_Emprestimo_Devolucao_Multa ADD CONSTRAINT FK_Implica_Emprestimo_Devolucao_Multa_2
    FOREIGN KEY (fk_Multa_ID_livro, fk_Multa_ID_Usuario)
    REFERENCES Multa (ID_livro, ID_Usuario)
    ON DELETE NO ACTION;
 
ALTER TABLE Bibliotecario 
ADD CONSTRAINT FK_Bibliotecario_1
    FOREIGN KEY (fk_Funcionario_ID_Func)
    REFERENCES Funcionario(Id_Func);
 
ALTER TABLE Escola ADD CONSTRAINT FK_Escola_2
    FOREIGN KEY (fk_Biblioteca_idSala)
    REFERENCES Biblioteca (idSala)
    ON DELETE RESTRICT;
 
ALTER TABLE Efetua_Emprestimo_E_book_Livro_Usuario_Devolucao_Bibliotecario ADD CONSTRAINT FK_Efetua_Emprestimo_E_book_Livro_Usuario_Devolucao_Bibliotecario_1
    FOREIGN KEY (fk_E_book_ID_book)
    REFERENCES E_book (ID_book)
    ON DELETE NO ACTION;
 
ALTER TABLE Efetua_Emprestimo_E_book_Livro_Usuario_Devolucao_Bibliotecario ADD CONSTRAINT FK_Efetua_Emprestimo_E_book_Livro_Usuario_Devolucao_Bibliotecario_2
    FOREIGN KEY (fk_Livro_ID_Livro???)
    REFERENCES ??? (???)
    ON DELETE NO ACTION;
 
 
ALTER TABLE Efetua_Emprestimo_E_book_Livro_Usuario_Devolucao_Bibliotecario ADD CONSTRAINT FK_Efetua_Emprestimo_E_book_Livro_Usuario_Devolucao_Bibliotecario_4
    FOREIGN KEY (fk_Devolucao_ID_Livro)
    REFERENCES Devolucao (ID_Livro)
    ON DELETE NO ACTION;
 
ALTER TABLE Efetua_Emprestimo_E_book_Livro_Usuario_Devolucao_Bibliotecario ADD CONSTRAINT FK_Efetua_Emprestimo_E_book_Livro_Usuario_Devolucao_Bibliotecario_5
    FOREIGN KEY (fk_Bibliotecario_ID_Func???)
    REFERENCES ??? (???)
    ON DELETE NO ACTION;
 
ALTER TABLE Cadastra_E_book_Bibliotecario ADD CONSTRAINT FK_Cadastra_E_book_Bibliotecario_1
    FOREIGN KEY (fk_E_book_ID_book)
    REFERENCES E_book (ID_book)
    ON DELETE NO ACTION;
 
ALTER TABLE Cadastra_E_book_Bibliotecario ADD CONSTRAINT FK_Cadastra_E_book_Bibliotecario_2
    FOREIGN KEY (fk_Bibliotecario_ID_Func???)
    REFERENCES ??? (???)
    ON DELETE NO ACTION;
 
ALTER TABLE Reserva_E_book ADD CONSTRAINT FK_Reserva_E_book_1
    FOREIGN KEY (fk_E_book_ID_book)
    REFERENCES E_book (ID_book)
    ON DELETE NO ACTION;
 
ALTER TABLE Coordena_Doacao_Midia_E_comerce_Bibliotecario_Estoque ADD CONSTRAINT FK_Coordena_Doacao_Midia_E_comerce_Bibliotecario_Estoque_1
    FOREIGN KEY (fk_Doacao_ID_Usuraio???)
    REFERENCES ??? (???)
    ON DELETE RESTRICT;
 
ALTER TABLE Coordena_Doacao_Midia_E_comerce_Bibliotecario_Estoque ADD CONSTRAINT FK_Coordena_Doacao_Midia_E_comerce_Bibliotecario_Estoque_2
    FOREIGN KEY (fk_Midia_ID_Func, fk_Midia_E_mail_Biblioteca)
    REFERENCES Midia (ID_Func, E_mail_Biblioteca)
    ON DELETE RESTRICT;
 
ALTER TABLE Coordena_Doacao_Midia_E_comerce_Bibliotecario_Estoque ADD CONSTRAINT FK_Coordena_Doacao_Midia_E_comerce_Bibliotecario_Estoque_3
    FOREIGN KEY (fk_E_comerce_ID_Livro, fk_E_comerce_ID_Vendedor, fk_E_comerce_ID_Cliente)
    REFERENCES E_comerce (ID_Livro, ID_Vendedor, ID_Cliente)
    ON DELETE RESTRICT;
 
ALTER TABLE Coordena_Doacao_Midia_E_comerce_Bibliotecario_Estoque ADD CONSTRAINT FK_Coordena_Doacao_Midia_E_comerce_Bibliotecario_Estoque_4
    FOREIGN KEY (fk_Bibliotecario_ID_Func???)
    REFERENCES ??? (???)
    ON DELETE NO ACTION;
 
ALTER TABLE Coordena_Doacao_Midia_E_comerce_Bibliotecario_Estoque ADD CONSTRAINT FK_Coordena_Doacao_Midia_E_comerce_Bibliotecario_Estoque_5
    FOREIGN KEY (fk_Retirada_ID_compra???)
    REFERENCES ??? (???);
 
ALTER TABLE Implica_Emprestimo_Devolucao_Multa ADD CONSTRAINT FK_Implica_Emprestimo_Devolucao_Multa_1
    FOREIGN KEY (fk_Devolucao_ID_Livro)
    REFERENCES Devolucao (ID_Livro)
    ON DELETE NO ACTION;
 
ALTER TABLE Possui_Bibliotecario_E_book_Usuario_Biblioteca_Estoque ADD CONSTRAINT FK_Possui_Bibliotecario_E_book_Usuario_Biblioteca_Estoque_1
    FOREIGN KEY (fk_Bibliotecario_ID_Func???)
    REFERENCES ??? (???)
    ON DELETE NO ACTION;
 
ALTER TABLE Possui_Bibliotecario_E_book_Usuario_Biblioteca_Estoque ADD CONSTRAINT FK_Possui_Bibliotecario_E_book_Usuario_Biblioteca_Estoque_2
    FOREIGN KEY (fk_E_book_ID_book)
    REFERENCES E_book (ID_book)
    ON DELETE NO ACTION;
 
 
ALTER TABLE Possui_Bibliotecario_E_book_Usuario_Biblioteca_Estoque ADD CONSTRAINT FK_Possui_Bibliotecario_E_book_Usuario_Biblioteca_Estoque_4
    FOREIGN KEY (fk_Biblioteca_idSala)
    REFERENCES Biblioteca (idSala)
    ON DELETE NO ACTION;
 
ALTER TABLE Estuda ADD CONSTRAINT FK_Estuda_1
    FOREIGN KEY (fk_Aluno_Aluno_Id)
    REFERENCES Aluno (Aluno_Id)
    ON DELETE SET NULL;
 
ALTER TABLE Estuda ADD CONSTRAINT FK_Estuda_2
    FOREIGN KEY (fk_Escola_ID_Matricula)
    REFERENCES Escola (ID_Matricula)
    ON DELETE SET NULL;
 
ALTER TABLE Cursa_Extracurricular_Disciplina_Aluno ADD CONSTRAINT FK_Cursa_Extracurricular_Disciplina_Aluno_1
    FOREIGN KEY (fk_Extracurricular_Extra_Id)
    REFERENCES Extracurricular (Extra_Id)
    ON DELETE NO ACTION;
 
ALTER TABLE Cursa_Extracurricular_Disciplina_Aluno ADD CONSTRAINT FK_Cursa_Extracurricular_Disciplina_Aluno_2
    FOREIGN KEY (fk_Disciplina_DisC_Id, fk_Disciplina_Nota_Id)
    REFERENCES Disciplina (DisC_Id, Nota_Id)
    ON DELETE NO ACTION;
 
ALTER TABLE Cursa_Extracurricular_Disciplina_Aluno ADD CONSTRAINT FK_Cursa_Extracurricular_Disciplina_Aluno_3
    FOREIGN KEY (fk_Aluno_Aluno_Id)
    REFERENCES Aluno (Aluno_Id)
    ON DELETE NO ACTION;
 
ALTER TABLE Paga_Aluno_Taxas_Mensalidade ADD CONSTRAINT FK_Paga_Aluno_Taxas_Mensalidade_1
    FOREIGN KEY (fk_Aluno_Aluno_Id)
    REFERENCES Aluno (Aluno_Id)
    ON DELETE NO ACTION;
 
ALTER TABLE Paga_Aluno_Taxas_Mensalidade ADD CONSTRAINT FK_Paga_Aluno_Taxas_Mensalidade_2
    FOREIGN KEY (fk_Taxas_Taxa_Id)
    REFERENCES Taxas (Taxa_Id)
    ON DELETE NO ACTION;
 
ALTER TABLE Paga_Aluno_Taxas_Mensalidade ADD CONSTRAINT FK_Paga_Aluno_Taxas_Mensalidade_3
    FOREIGN KEY (fk_Mensalidade_Mens_Id)
    REFERENCES Mensalidade (Mens_Id)
    ON DELETE NO ACTION;
 
ALTER TABLE Entrada_de_dinheiro_Taxas_Escola_Aluguel_de_Espaco_Cantina_Venda_de_produtos_Financas_E_comerce_Mensalidade_Multa ADD CONSTRAINT FK_Entrada_de_dinheiro_Taxas_Escola_Aluguel_de_Espaco_Cantina_Venda_de_produtos_Financas_E_comerce_Mensalidade_Multa_1
    FOREIGN KEY (fk_Taxas_Taxa_Id)
    REFERENCES Taxas (Taxa_Id)
    ON DELETE NO ACTION;
 
ALTER TABLE Entrada_de_dinheiro_Taxas_Escola_Aluguel_de_Espaco_Cantina_Venda_de_produtos_Financas_E_comerce_Mensalidade_Multa ADD CONSTRAINT FK_Entrada_de_dinheiro_Taxas_Escola_Aluguel_de_Espaco_Cantina_Venda_de_produtos_Financas_E_comerce_Mensalidade_Multa_2
    FOREIGN KEY (fk_Escola_ID_Matricula)
    REFERENCES Escola (ID_Matricula)
    ON DELETE NO ACTION;
 
ALTER TABLE Entrada_de_dinheiro_Taxas_Escola_Aluguel_de_Espaco_Cantina_Venda_de_produtos_Financas_E_comerce_Mensalidade_Multa ADD CONSTRAINT FK_Entrada_de_dinheiro_Taxas_Escola_Aluguel_de_Espaco_Cantina_Venda_de_produtos_Financas_E_comerce_Mensalidade_Multa_3
    FOREIGN KEY (fk_Aluguel_de_Espaco_Espaco_Id)
    REFERENCES Aluguel_de_Espaco (Espaco_Id)
    ON DELETE NO ACTION;
 
ALTER TABLE Entrada_de_dinheiro_Taxas_Escola_Aluguel_de_Espaco_Cantina_Venda_de_produtos_Financas_E_comerce_Mensalidade_Multa ADD CONSTRAINT FK_Entrada_de_dinheiro_Taxas_Escola_Aluguel_de_Espaco_Cantina_Venda_de_produtos_Financas_E_comerce_Mensalidade_Multa_4
    FOREIGN KEY (fk_Venda_de_produtos_Loja_Id)
    REFERENCES Venda_de_produtos (Loja_Id)
    ON DELETE NO ACTION;
 
ALTER TABLE Entrada_de_dinheiro_Taxas_Escola_Aluguel_de_Espaco_Cantina_Venda_de_produtos_Financas_E_comerce_Mensalidade_Multa ADD CONSTRAINT FK_Entrada_de_dinheiro_Taxas_Escola_Aluguel_de_Espaco_Cantina_Venda_de_produtos_Financas_E_comerce_Mensalidade_Multa_5
    FOREIGN KEY (fk_Financas_Fin_Id)
    REFERENCES Financas (Fin_Id)
    ON DELETE NO ACTION;
 
ALTER TABLE Entrada_de_dinheiro_Taxas_Escola_Aluguel_de_Espaco_Cantina_Venda_de_produtos_Financas_E_comerce_Mensalidade_Multa ADD CONSTRAINT FK_Entrada_de_dinheiro_Taxas_Escola_Aluguel_de_Espaco_Cantina_Venda_de_produtos_Financas_E_comerce_Mensalidade_Multa_6
    FOREIGN KEY (fk_E_comerce_ID_Livro, fk_E_comerce_ID_Vendedor, fk_E_comerce_ID_Cliente)
    REFERENCES E_comerce (ID_Livro, ID_Vendedor, ID_Cliente)
    ON DELETE NO ACTION;
 
ALTER TABLE Entrada_de_dinheiro_Taxas_Escola_Aluguel_de_Espaco_Cantina_Venda_de_produtos_Financas_E_comerce_Mensalidade_Multa ADD CONSTRAINT FK_Entrada_de_dinheiro_Taxas_Escola_Aluguel_de_Espaco_Cantina_Venda_de_produtos_Financas_E_comerce_Mensalidade_Multa_7
    FOREIGN KEY (fk_Mensalidade_Mens_Id)
    REFERENCES Mensalidade (Mens_Id)
    ON DELETE NO ACTION;
 
 
ALTER TABLE Ensina ADD CONSTRAINT FK_Ensina_1
    FOREIGN KEY (fk_Disciplina_DisC_Id, fk_Disciplina_Nota_Id)
    REFERENCES Disciplina (DisC_Id, Nota_Id)
    ON DELETE SET NULL;
 
ALTER TABLE Ensina ADD CONSTRAINT FK_Ensina_2
    FOREIGN KEY (fk_Professor_Prof_Id)
    REFERENCES Professor (Prof_Id)
    ON DELETE SET NULL;
 
ALTER TABLE Reserva ADD CONSTRAINT FK_Reserva_1
    FOREIGN KEY (fk_Sala_Lab_id_sala_lab)
    REFERENCES Sala_Lab (id_sala_lab)
    ON DELETE SET NULL;
 
ALTER TABLE Reserva ADD CONSTRAINT FK_Reserva_2
    FOREIGN KEY (fk_Professor_Prof_Id)
    REFERENCES Professor (Prof_Id)
    ON DELETE SET NULL;
 
ALTER TABLE Trabalha_em_Departamento_Professor_Funcionario ADD CONSTRAINT FK_Trabalha_em_Departamento_Professor_Funcionario_1
    FOREIGN KEY (fk_Departamento_Id_Depart)
    REFERENCES Departamento (Id_Depart)
    ON DELETE NO ACTION;
 
ALTER TABLE Trabalha_em_Departamento_Professor_Funcionario ADD CONSTRAINT FK_Trabalha_em_Departamento_Professor_Funcionario_2
    FOREIGN KEY (fk_Professor_Prof_Id)
    REFERENCES Professor (Prof_Id)
    ON DELETE NO ACTION;
 
ALTER TABLE Trabalha_em_Departamento_Professor_Funcionario ADD CONSTRAINT FK_Trabalha_em_Departamento_Professor_Funcionario_3
    FOREIGN KEY (fk_Funcionario_Id_Func)
    REFERENCES Funcionario (Id_Func)
    ON DELETE NO ACTION;
 
ALTER TABLE Faz_parte ADD CONSTRAINT FK_Faz_parte_1
    FOREIGN KEY (fk_Departamento_Id_Depart)
    REFERENCES Departamento (Id_Depart)
    ON DELETE SET NULL;
 
ALTER TABLE Faz_parte ADD CONSTRAINT FK_Faz_parte_2
    FOREIGN KEY (fk_Escola_ID_Matricula)
    REFERENCES Escola (ID_Matricula)
    ON DELETE SET NULL;
 
ALTER TABLE Tem ADD CONSTRAINT FK_Tem_1
    FOREIGN KEY (fk_Escola_ID_Matricula)
    REFERENCES Escola (ID_Matricula)
    ON DELETE SET NULL;
 
ALTER TABLE Oragniza ADD CONSTRAINT FK_Oragniza_1
    FOREIGN KEY (fk_Eventos_Evento_Id)
    REFERENCES Eventos (Evento_Id)
    ON DELETE SET NULL;
 
ALTER TABLE Oragniza ADD CONSTRAINT FK_Oragniza_2
    FOREIGN KEY (fk_Escola_ID_Matricula)
    REFERENCES Escola (ID_Matricula)
    ON DELETE SET NULL;
 
ALTER TABLE Reserva ADD CONSTRAINT FK_Reserva_1
    FOREIGN KEY (fk_Espacos_Evento_Id)
    REFERENCES Espacos (Evento_Id)
    ON DELETE SET NULL;
 
ALTER TABLE Reserva ADD CONSTRAINT FK_Reserva_2
    FOREIGN KEY (fk_Eventos_Evento_Id)
    REFERENCES Eventos (Evento_Id)
    ON DELETE SET NULL;
 
ALTER TABLE Contem ADD CONSTRAINT FK_Contem_1
    FOREIGN KEY (fk_Livro_ID_Livro???)
    REFERENCES ??? (???)
    ON DELETE SET NULL;
 
ALTER TABLE Aplica_Midia_E_comerce_Promocoes ADD CONSTRAINT FK_Aplica_Midia_E_comerce_Promocoes_1
    FOREIGN KEY (fk_Midia_ID_Func, fk_Midia_E_mail_Biblioteca)
    REFERENCES Midia (ID_Func, E_mail_Biblioteca)
    ON DELETE RESTRICT;
 
ALTER TABLE Aplica_Midia_E_comerce_Promocoes ADD CONSTRAINT FK_Aplica_Midia_E_comerce_Promocoes_2
    FOREIGN KEY (fk_E_comerce_ID_Livro, fk_E_comerce_ID_Vendedor, fk_E_comerce_ID_Cliente)
    REFERENCES E_comerce (ID_Livro, ID_Vendedor, ID_Cliente)
    ON DELETE RESTRICT;
 
 
ALTER TABLE Adiciona ADD CONSTRAINT FK_Adiciona_1
    FOREIGN KEY (fk_Doacao_ID_Usuraio???)
    REFERENCES ??? (???)
    ON DELETE SET NULL;
 
ALTER TABLE Compra ADD CONSTRAINT FK_Compra_2
    FOREIGN KEY (fk_E_commerce_ID_Livro???, fk_E_commerce_ID_Cliente???, Campo???)
    REFERENCES ??? (???);
 
ALTER TABLE Reserva_Livro ADD CONSTRAINT FK_Reserva_Livro_1
    FOREIGN KEY (fk_Livro_ID_Livro???)
    REFERENCES ??? (???)
    ON DELETE NO ACTION;
 
ALTER TABLE Cadastra_Livro_Bibliotecario ADD CONSTRAINT FK_Cadastra_Livro_Bibliotecario_1
    FOREIGN KEY (fk_Livro_ID_Livro???)
    REFERENCES ??? (???)
    ON DELETE NO ACTION;
 
ALTER TABLE Cadastra_Livro_Bibliotecario ADD CONSTRAINT FK_Cadastra_Livro_Bibliotecario_2
    FOREIGN KEY (fk_Bibliotecario_ID_Func???)
    REFERENCES ??? (???)
    ON DELETE NO ACTION;
 
ALTER TABLE Terceiros ADD CONSTRAINT FK_Terceiros_2
    FOREIGN KEY (fk_E_commerce_ID_Cliente???, Campo???)
    REFERENCES ??? (???);
 
ALTER TABLE Terceiros ADD CONSTRAINT FK_Terceiros_3
    FOREIGN KEY (fk_Promocoes_ID_Livro, ???)
    REFERENCES Promocoes (ID_Livro, ???);
