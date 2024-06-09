# Projeto de BD para a “EducaLivros Online”
<br>

![biblio](https://github.com/ashtarts/proj2_BancodeDados/blob/main/biblio.gif)
<br>
O que atualizamos: Demos uma olhada no DML(updates e deletes) e no TD (diminuimos de 10 questões para 6, que o banco de dados pode responder), diminuindo e deletando algumas coisas que não tinham utilidades. Tabela Checa foi deletada. Ajeitamos as tabelas usuario e aluno-professor, e funcionario e bibliotecario.
<br>

## Objetivo do projeto:
Desenvolver e implementar um banco de dados que seja capaz de abranger as múltiplas facetas das operações da empresa. Para isso, iremos integrar pelo menos dois dos três Diagramas de Entidade-Relacionamento (DER) previamente concebidos. 
<br>

<br>

 ## O segundo projeto inclui:
<br>
Modelagem Relacional(15%): Desenvolver um modelo lógico que represente as entidades do negócio e os relacionamentos entre elas.
<br>
<br>
Data Definition Language(DDL)(10%): Usar a linguagem DDL para definir as tabelas, índices, restrições e outros objetos do banco de dados.
<br>
<br>
Data Manipulation Language(DML) (10%): Usar a linguagem DML para inserir, atualizare deletaros dados em pelo menos 3 tabelas no banco de dados.
<br>
<br>
Tomada de Decisão (10%):O analista da equipe deve elaborar pelo menos 5 perguntas baseadas no SGBD que entregue que agreguem valor ($$$) ao negócio.
<br>
<br>
Entrega(5%): Linkdo githubvia teams. No githubdeve conter o modelo relacional final, o código DDL, DML e as perguntas para tomada de decisão. 
<br>
<br>
Um readme com uma breve descrição do que foi feito deve estar preenchido.
<br>
<br>
Requisitos adicionais(40%): irá ser considerado o que for feito além do requerimento mínimo esperado.
<br>
<br>
Easter Egg ao cliente(10%): Surpreenda o cliente com algo interessante.
___________________________________________________________________________________________

## Projeto Feito:

 Com BRMW. Criamos um modelo relacional e físico de um sistema de uma Escola-Livraria, e incluimos o DML, o DDL e o TD a pedido do professor da disciplina de Banco de Dados
 <br>
 <br>
 Existem 52 tabelas no projeto, especificadas logo abaixo:
<br>
<br>
1. Funcionário; 2. Professor; 3. Trabalha em; 4. Departamento; 5. Ensina; 6. Disciplina; 7. Faz Parte; 8. Escola; 9. Eventos; 10. Organiza; 11. Reserva; 12. Espaços; 13. Cantina; 14. Tem; 15. Parcerias; 16. Reserva; 17. Sala_lab; 18. Cursa; 19. Extracurricular; 20. Aluno; 21. Estuda; 22. Paga; 23. Taxas; 24. Mensalidade; 25. Aluguel de Espaço; 26.  Venda de Produtos; 27. Entrada de dinheiro; 28. Finanças; 29. Multa; 30. Biblioteca; 31. Possui; 32. Bibliotecário; 33. Coordena; 34. Sebo E-commerce; 35. Cadastra; 36. Livro. 37; E-book; 38. Reserva; 39. Contem; 40. Estoque; 41. Midia; 42. Aplica; 43. Efetua; 44. Empréstimo; 45. Checa; 46. Adiciona; 47. Doação; 48. Implica; 49. Promoções; 50. Devolução; 51. Participa; 52. Usuário;
   <br>
   <br>
<h2>Tomada de decisão:</h2>
<h5>Questão 01: Quantos usuários estão com mensalidades em atraso e qual é o valor total em pendências?</h5>
- Isso permite à biblioteca identificar potenciais perdas financeiras devido à inadimplência, orientando estratégias para cobrança e controle de inadimplência, o que pode aumentar a receita da biblioteca.<br>
<br>
<h5>Questão 02: Quais canais de venda geram maior volume de vendas, leads qualificados e clientes fiéis para o seu negócio?</h5>
- Essa pergunta ajuda a entender quais canais de venda são mais eficazes, considerando aspectos como volume de vendas, qualidade dos leads e fidelidade dos clientes. Isso possibilita otimizar investimentos em marketing e vendas, direcionando recursos para os canais mais rentáveis e eficazes.
<br>
<br>
<h5>Questão 03: Qual é o volume de empréstimos de e-books em comparação com os empréstimos de livros físicos ao longo do último trimestre?</h5>
- Monitorar a preferência dos usuários por e-books versus livros físicos ajuda a biblioteca a ajustar seu estoque e alocação de recursos para atender às demandas dos usuários, potencialmente reduzindo custos de armazenamento e aumentando a satisfação do usuário.
<br>
<br>
<h5>Questão 04: Qual é o perfil demográfico dos usuários mais frequentes da biblioteca (idade, gênero, localização)?</h5>
- Compreender o perfil demográfico dos usuários permite personalizar ofertas e serviços de acordo com as necessidades e preferências específicas de cada segmento, aumentando a satisfação do usuário e potencialmente atraindo novos públicos.
<br>
<br>
<h5>Questão 05: Quais são os livros mais populares cadastrados no sistema de sebo e-commerce, e qual é o volume de vendas associado a cada um?</h5>
- Identificar os livros mais populares e suas vendas associadas permite ajustar estratégias de promoção e estoque, concentrando-se nos produtos com maior potencial de vendas, o que pode aumentar a receita proveniente do e-commerce.
<br>
<br>
<h5>Questão 06: Quais são os períodos de maior e menor demanda por serviços da biblioteca ao longo do ano?</h5>
- Identificar os períodos de pico e baixa demanda permite uma alocação eficiente de recursos humanos e materiais, garantindo que a biblioteca esteja preparada para atender às necessidades dos usuários durante os momentos de maior fluxo de visitantes, otimizando custos durante os períodos de menor atividade.

## Como foi dividido o projeto entre 3 pessoas:

<h3>Ana Carolina Ribeiro: Ficou responsável por juntar dois dos Projetos Conceituais e fazer eles funcionarem juntos. Além de auxiliar na elaboração das perguntas para Tomada de Decisão. </h3> 
<h8>Link git https://github.com/CaroliisRibeiro </h8>

<h3>Ana Virgínia: Supervisionou a construção do projeto, fornecendo ideias e feedbacks para o resto da equipe. Ficou responsável pelo DDL, pelo DML e pela elaboração das perguntas para a Tomada de Decisão. </h3>

<h3>Breno Pedrosa: Ficou responsável pela transformação do modelo conceitual em relacional e pelo DDL. Bem como, responsável por adicionar as mudanças no projeto sugeridas pelo grupo. </h3>

