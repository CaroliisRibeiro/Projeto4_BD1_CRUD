/* Projeto _2_banco de Dados_logico_reentrega_v3: */

CREATE TABLE Bibliotecario (
    Login VARCHAR,
    Senha VARCHAR,
    fk_Funcionario_ID_Func INT,
    fk_Funcionario_E_mail VARCHAR,
    fk_Funcionario_Telefone INT,
    fk_Funcionario_Funcao VARCHAR,
    fk_Funcionario_Salario FLOAT,
    fk_Funcionario_Data_Nasc DATE,
    fk_Funcionario_CPF INT
);

CREATE TABLE Emprestimo (
    Tempo_Permanencia TIME,
    ID_Usuario INT,
    Data_Emprest DATE,
    ID_Emprest INT,
    ID_Func INT
);

CREATE TABLE Livro (
    Autor VARCHAR,
    Ano DATE,
    Edicao VARCHAR,
    Titulo VARCHAR,
    Editora VARCHAR,
    Status BOOLEAN,
    ID_Livro INT PRIMARY KEY,
    Area VARCHAR,
    Genero VARCHAR
);

CREATE TABLE E_book (
    Editora VARCHAR,
    Autor VARCHAR,
    Edicao VARCHAR,
    ID_book INT PRIMARY KEY,
    Status BOOLEAN,
    Link VARCHAR,
    Genero VARCHAR,
    Area VARCHAR
);

CREATE TABLE Devolucao (
    ID_Devolucao INT,
    ID_Livro INT PRIMARY KEY,
    Quant_Exemplares INT,
    ID_Func INT,
    ID_Usuario INT,
    Data_Dev DATE
);

CREATE TABLE Midia (
    ID_Func INT,
    Mundo VARCHAR,
    Tema VARCHAR,
    Area VARCHAR,
    Local VARCHAR,
    E_mail_Biblioteca VARCHAR,
    Midia_TIPO INT,
    PRIMARY KEY (ID_Func, E_mail_Biblioteca)
);

CREATE TABLE Promocoes (
    ID_Livro INT,
    ID_Func INT,
    Promocoes_TIPO VARCHAR,
    PRIMARY KEY (ID_Livro, ID_Func)
);

CREATE TABLE Multa (
    Data_Emprest DATE,
    Data_Dev DATE,
    Tempo_Permanencia TIME,
    Livro_Danificado BOOLEAN,
    ID_livro INT,
    ID_Usuario INT,
    PRIMARY KEY (ID_livro, ID_Usuario)
);

CREATE TABLE Doacao (
    ID_Livro INT,
    Genero VARCHAR,
    Titulo VARCHAR,
    Autor VARCHAR,
    Editora VARCHAR,
    Area VARCHAR
);

CREATE TABLE E_comerce (
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
    CNPJ INT,
    PRIMARY KEY (ID_Livro, ID_Vendedor, ID_Cliente)
);

CREATE TABLE Biblioteca (
    idSala INT PRIMARY KEY,
    ID_Livro INT,
    ID_book INT,
    ID_Func INT,
    ID_Vendedor INT,
    ID_Cliente INT,
    E_mail_Biblioteca VARCHAR
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
    fk_Biblioteca_idSala INT
);

CREATE TABLE Aluno (
    Data_Nasc DATE,
    Endereco VARCHAR,
    Mens_Id INT,
    Aluno_Id INT PRIMARY KEY,
    Matricula_Id INT,
    Nota_Id INT,
    Ano_Serie SMALLINT,
    Telefone INT,
    E_mail INT,
    CPF INT
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
    Telefone INT,
    Salario FLOAT
);

CREATE TABLE Sala_Lab (
    Local VARCHAR,
    Disponibilidade BOOLEAN,
    id_sala_lab INT PRIMARY KEY
);

CREATE TABLE Departamento (
    AreaDepart VARCHAR,
    Id_Depart INT PRIMARY KEY
);

CREATE TABLE Funcionario (
    Id_Func INT PRIMARY KEY,
    Mat_Funcionario VARCHAR,
    Data_Nasc DATE,
    E_mail VARCHAR,
    Funcao VARCHAR,
    Salario FLOAT,
    CPF INT,
    Telefone INT,
    Nome INT
);

CREATE TABLE Parcerias (
    Beneficios VARCHAR,
    Tipo VARCHAR,
    Parceria_Id INT,
    Data_de_inicio DATE
);

CREATE TABLE Eventos (
    Evento_Id INT PRIMARY KEY,
    Tipo VARCHAR,
    Duracao TIME
);

CREATE TABLE Espacos (
    Local VARCHAR,
    Disponibilidade DATE,
    Evento_Id INT PRIMARY KEY
);

CREATE TABLE Aluguel_de_Espaco (
    Disponibilidade DATE,
    Espaco_Id INT PRIMARY KEY,
    Capacidade INT,
    Local VARCHAR
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

CREATE TABLE Efetua_Emprestimo_E_book_Livro_Usuario_Devolucao_Bibliotecario (
    fk_E_book_ID_book INT,
    fk_Livro_ID_Livro INT,
    fk_Devolucao_ID_Livro INT,
    fk_Bibliotecario_ID_Func INT
);

CREATE TABLE Cadastra_E_book_Bibliotecario (
    fk_E_book_ID_book INT,
    fk_Bibliotecario_ID_Func INT
);

CREATE TABLE Reserva_E_book (
    fk_E_book_ID_book INT
);

CREATE TABLE Coordena_Doacao_Midia_E_comerce_Bibliotecario_Estoque (
    fk_Doacao_ID_Usuraio INT,
    fk_Midia_ID_Func INT,
    fk_Midia_E_mail_Biblioteca VARCHAR,
    fk_E_comerce_ID_Livro INT,
    fk_E_comerce_ID_Vendedor INT,
    fk_E_comerce_ID_Cliente INT,
    fk_Bibliotecario_ID_Func INT,
    fk_Retirada_ID_compra INT
);

CREATE TABLE Implica_Emprestimo_Devolucao_Multa (
    fk_Devolucao_ID_Livro INT,
    fk_Multa_ID_livro INT,
    fk_Multa_ID_Usuario INT
);

CREATE TABLE Possui_Bibliotecario_E_book_Usuario_Biblioteca_Estoque (
    fk_Bibliotecario_ID_Func INT,
    fk_E_book_ID_book INT,
    fk_Biblioteca_idSala INT
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

CREATE TABLE Entrada_de_dinheiro_Taxas_Escola_Aluguel_de_Espaco_Cantina_Venda_de_produtos_Financas_E_comerce_Mensalidade_Multa (
    fk_Taxas_Taxa_Id INT,
    fk_Escola_ID_Matricula INT,
    fk_Aluguel_de_Espaco_Espaco_Id INT,
    fk_Venda_de_produtos_Loja_Id INT,
    fk_Financas_Fin_Id INT,
    fk_E_comerce_ID_Livro INT,
    fk_E_comerce_ID_Vendedor INT,
    fk_E_comerce_ID_Cliente INT,
    fk_Mensalidade_Mens_Id INT,
    fk_Multa_ID_livro INT,
    fk_Multa_ID_Usuario INT
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

CREATE TABLE Aplica_Midia_E_comerce_Promocoes (
    fk_Midia_ID_Func INT,
    fk_Midia_E_mail_Biblioteca VARCHAR,
    fk_E_comerce_ID_Livro INT,
    fk_E_comerce_ID_Vendedor INT,
    fk_E_comerce_ID_Cliente INT,
    fk_Promocoes_ID_Livro INT,
    fk_Promocoes_ID_Usuario INT,
    fk_Promocoes_ID_Func INT
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
 
ALTER TABLE Bibliotecario ADD CONSTRAINT FK_Bibliotecario_1
    FOREIGN KEY (fk_Funcionario_ID_Func???, fk_Funcionario_E_mail???, fk_Funcionario_Telefone???, fk_Funcionario_Funcao???, fk_Funcionario_Salario???, fk_Funcionario_Data_Nasc???, fk_Funcionario_CPF???)
    REFERENCES ??? (???);
 
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
 
ALTER TABLE Efetua_Emprestimo_E_book_Livro_Usuario_Devolucao_Bibliotecario ADD CONSTRAINT FK_Efetua_Emprestimo_E_book_Livro_Usuario_Devolucao_Bibliotecario_3
    FOREIGN KEY (fk_Usuario_ID_Usuario???)
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
 
ALTER TABLE Implica_Emprestimo_Devolucao_Multa ADD CONSTRAINT FK_Implica_Emprestimo_Devolucao_Multa_2
    FOREIGN KEY (fk_Multa_ID_livro, fk_Multa_ID_Usuario)
    REFERENCES Multa (ID_livro, ID_Usuario)
    ON DELETE NO ACTION;
 
ALTER TABLE Possui_Bibliotecario_E_book_Usuario_Biblioteca_Estoque ADD CONSTRAINT FK_Possui_Bibliotecario_E_book_Usuario_Biblioteca_Estoque_1
    FOREIGN KEY (fk_Bibliotecario_ID_Func???)
    REFERENCES ??? (???)
    ON DELETE NO ACTION;
 
ALTER TABLE Possui_Bibliotecario_E_book_Usuario_Biblioteca_Estoque ADD CONSTRAINT FK_Possui_Bibliotecario_E_book_Usuario_Biblioteca_Estoque_2
    FOREIGN KEY (fk_E_book_ID_book)
    REFERENCES E_book (ID_book)
    ON DELETE NO ACTION;
 
ALTER TABLE Possui_Bibliotecario_E_book_Usuario_Biblioteca_Estoque ADD CONSTRAINT FK_Possui_Bibliotecario_E_book_Usuario_Biblioteca_Estoque_3
    FOREIGN KEY (fk_Usuario_ID_Usuario)
    REFERENCES Usuario (ID_Usuario)
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
 
ALTER TABLE Entrada_de_dinheiro_Taxas_Escola_Aluguel_de_Espaco_Cantina_Venda_de_produtos_Financas_E_comerce_Mensalidade_Multa ADD CONSTRAINT FK_Entrada_de_dinheiro_Taxas_Escola_Aluguel_de_Espaco_Cantina_Venda_de_produtos_Financas_E_comerce_Mensalidade_Multa_8
    FOREIGN KEY (fk_Multa_ID_livro, fk_Multa_ID_Usuario)
    REFERENCES Multa (ID_livro, ID_Usuario)
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
 
ALTER TABLE Aplica_Midia_E_comerce_Promocoes ADD CONSTRAINT FK_Aplica_Midia_E_comerce_Promocoes_3
    FOREIGN KEY (fk_Promocoes_ID_Livro, fk_Promocoes_ID_Usuario???, fk_Promocoes_ID_Func)
    REFERENCES Promocoes (ID_Livro, ???, ID_Func)
    ON DELETE NO ACTION;
 
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
