
# Projeto 4 de BD - Grand finale- para a “EducaLivros Online”
<br>


![giphy (6)](https://github.com/CaroliisRibeiro/Projeto4_BD1_CRUD/assets/127742540/17e72d54-e1b7-4ea7-8155-842619e5e41e)


<br>

## OBJETIVOS
<br>
Incorporar novas funcionalidades e melhorar a eficiência do banco
de dados, utilizando operações CRUD, normalização, triggers, stored procedures, views e
controles de acesso.
<br>

Requisitos:

1. Triggers  automatiza operações no banco de dados. Por exemplo, um trigger pode ser usado para atualizar automaticamente o estoque de livros quando uma venda é realizada.
2. Stored Procedures: trabalha com bancos de dados, permitindo a criação de blocos de código SQL reutilizáveis, seguros e de alto desempenho.. Por exemplo, uma stored procedure
pode ser usada para calcular o total de vendas de um determinado livro.
- Views : simplifica o acesso e a manipulação de dados em bancos de dados relacionais, fornecendo uma camada de abstração sobre a estrutura do banco de dados e promovendo a reutilização de consultas SQL.. Por exemplo, uma view pode mostrar o
número total de vendas por categoria de livro.
3. Segurança (5%): Implemente pelo menos dois controles de acesso para garantir
que apenas usuários autorizados possam acessar os dados.
4. Normalização (10%): Revise o esquema do banco de dados para garantir que ele
esteja na Terceira Forma Normal (3NF). Documente qualquer modificação feita
no esquema durante o processo de normalização.
5. Operações CRUD : Implementa operações de Criação, Leitura, Atualização
e Exclusão (CRUD) em um framework distinto (cada equipe vai usar um
framework diferente) em pelo menos três tabelas do banco de dados.


![crud](https://github.com/CaroliisRibeiro/Projeto4_BD1_CRUD/assets/127742540/61d498e2-fada-44e3-ba17-644724bc87b4)



## O CRUD 

Linguagem PYTHON 
- Framework DJANGO
- Ambiente de teste ISOMNIA


## Caraciteristicas do DJANGO:
<br>
O Django é um framework web Python de código aberto, que se destaca por oferecer um ambiente que simplifica a criação de soluções web escaláveis, ao mesmo tempo, em que promove o desenvolvimento rápido e um design limpo, proporcionando ferramentas robustas e eficientes para pessoas desenvolvedoras.
<br>
Dadas suas características e facilidade de aplicação, este framework pode ser empregado em diversos contextos. Podemos citar alguns exemplos mais conhecidos de utilização, tais como:
<br>
Criação de sites e aplicações web: tendo sido projetado especificamente para essa finalidade, com o Django é possível desenvolver desde simples sites informativos até sistemas complexos e interativos;
<br>
Plataformas de redes sociais: diversas funcionalidades de redes sociais, como os perfis de usuários, feeds de notícias e interações, podem ser implementadas com o Django. Alguns exemplos bastante conhecidos são o Instagram e o Pinterest;
<br>

![DjangoRocket](https://github.com/CaroliisRibeiro/Projeto4_BD1_CRUD/assets/127742540/ad695f07-0160-4c84-ab63-e72febce3a6d)



## Caracteriscas CRUD
1. O modelo de dados: O modelo de dados é responsável por representar a estrutura das informações que serão armazenadas no banco de dados. Utilizando a linguagem Python, você pode criar classes que representam as entidades do seu sistema, como por exemplo, um modelo de usuário, um modelo de produto, etc.

2. O banco de dados:
O Django possui suporte nativo para vários bancos de dados, como MySQL, PostgreSQL, SQLite, entre outros. Você precisa configurar as informações de conexão com o banco de dados no arquivo de configuração do Django. Após a configuração, o Django irá gerenciar automaticamente a criação das tabelas e a interação com o banco de dados.

3.  As visualizações:
As visualizações são responsáveis por processar as requisições feitas pelos usuários e retornar as respostas apropriadas. No caso de um CRUD, você precisa criar visualizações para criar, ler, atualizar e excluir os registros do banco de dados. Utilizando o Django, você pode criar funções ou classes que implementam a lógica de cada uma dessas operações.

4. Os templates:
Os templates são arquivos HTML que definem a estrutura visual das páginas da sua aplicação. Eles permitem que você separe a lógica de apresentação da lógica de negócio. Utilizando o Django, você pode criar templates que são renderizados dinamicamente com base nos dados fornecidos pelas visualizações.


## O que o Crud do nosso projeto 4 tem:
- Pasta Api_rest: Models, Serializers, urls,views, app
- Pasta Api_root: settings e urls
- Pata Venv: a "venv" (abreviação de "virtual environment" ou ambiente virtual) é uma ferramenta em Python que permite criar ambientes Python isolados, independentes do ambiente Python global do sistema. Esses ambientes virtuais são úteis quando você precisa trabalhar em projetos Python com diferentes dependências ou versões de pacotes sem afetar o ambiente global do sistema.
##### Aqui estão algumas características importantes de uma venv:

- Isolamento: Cada venv possui seu próprio diretório onde as bibliotecas Python e os scripts são armazenados. Isso permite que você instale e gerencie pacotes Python de forma independente, sem afetar outros projetos ou o ambiente global do sistema.

- Gerenciamento de Dependências: Você pode instalar bibliotecas Python específicas para um projeto dentro da venv, e essas bibliotecas estarão disponíveis apenas para esse projeto. Isso ajuda a evitar conflitos de dependências entre diferentes projetos.

- Reprodutibilidade: As venvs garantem que as versões específicas das bibliotecas Python sejam usadas em um projeto, o que torna mais fácil reproduzir o ambiente de desenvolvimento em diferentes máquinas.

- Facilidade de Uso: Criar e ativar uma venv é bastante simples usando as ferramentas Python integradas, como venv ou virtualenv.

## Tabelas do SQLITE3
- Aluno; Disciplina; Funcionario; Livro; Matricula; Professor; Turma; Usuário

###### Exemplo de Models
 - id_funcionario; nome_funcionario; cpf_regex; cpf_funcionario; telefone_regex; fone_funcionario; email_funcionario 

#### Link apresentação :
https://www.canva.com/design/DAGHubrMP-s/_0ilwBVtLVbhNLs8SJ_fnA/edit

