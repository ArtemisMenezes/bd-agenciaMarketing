SISTEMA EMPRESA DE SERVIÇOS
===========================

Projeto da disciplina Banco de Dados I (Sistemas e Mídias Digitais),
desenvolvido do zero: modelagem conceitual (MER), diagrama (DER), esquema
relacional textual, scripts SQL e uma aplicação web que consome o banco.

O domínio é uma agência de serviços digitais (marketing, audiovisual, sites,
e-commerce) que vende pacotes a clientes (pessoa fisica ou juridica),
formaliza contratos com parcelas de pagamento e aloca funcionários de
diferentes departamentos aos contratos.


TECNOLOGIAS
-----------

- PostgreSQL: banco de dados relacional
- Python + Flask: API REST
- psycopg2: conexão com o PostgreSQL
- HTML, CSS e JavaScript: interface web


MODELAGEM
---------

ODER estão na pasta docs/ (docs/mer.png e docs/der.png).

Relações entre as tabelas:

- Cliente possui vários e-mails (Cliente_Email) e vários telefones
  (Cliente_Telefone)
- Cliente é especializado em Pessoa_Fisica ou Pessoa_Juridica
- Cliente assina vários Contratos
- Pacotes é contemplado em vários Contratos
- Contrato gera varias Parcelas (entidade fraca)
- Contrato e Funcionario se relacionam em N:N pela tabela Recebe
- Departamento aloca vários Funcionários


ESQUEMA RELACIONAL (TEXTUAL)
----------------------------

    Cliente(Id_Cliente, nome, status, email, telefone, CEP, Rua, numero,
            cidade, bairro, estado)

    Cliente_Email(Id_Cliente, Email)
        Id_Cliente referencia Cliente

    Cliente_Telefone(Id_Cliente, Telefone)
        Id_Cliente referencia Cliente

    Pessoa_Fisica(Id_Cliente, CPF, Data_Nascimento)
        Id_Cliente referencia Cliente

    Pessoa_Juridica(Id_Cliente, CNPJ, Data_fundacao)
        Id_Cliente referencia Cliente

    Departamento(Nome_Departamento, Setor)

    Funcionario(CPF, Nome_Departamento, Nome, Cargo)
        Nome_Departamento referencia Departamento

    Pacotes(Nome_Pacote, Descricao, Restricoes, Valor_Base)

    Contrato(Id_Contrato, Id_Cliente, Nome_Pacote, Data_Inicio,
             Data_Termino, Valor_Acordado, Tipo_Cobranca, Status_Pagamento,
             Servicos_entregues)
        Id_Cliente referencia Cliente
        Nome_Pacote referencia Pacotes

    Parcela(Id_Contrato, Numero_Parcela, Data_Vencimento, Status_Pagamento,
            Valor_Parcela)
        Id_Contrato referencia Contrato

    Recebe(Id_Contrato, CPF_Funcionario, ID_Alocacao, Atribuicao_servico,
           Data)
        Id_Contrato referencia Contrato
        CPF_Funcionario referencia Funcionario

Decisões de modelagem:

- Especialização de Cliente: Pessoa_Fisica e Pessoa_Juridica guardam os dados
  específicos (CPF/CNPJ) e compartilham o Id_Cliente.
- Atributos multivalorados: e-mails e telefones adicionais ficam em tabelas
  próprias.
- Entidade fraca: Parcela depende de Contrato e é identificada por
  (Id_Contrato, Numero_Parcela).
- Relacionamento N:N: Recebe liga funcionários a contratos e guarda a
  atribuição do servico e a data.
- Remoção em cascata: ao remover um cliente, seus e-mails, telefones e dados
  de PF/PJ também são removidos. Clientes com contrato não podem ser
  removidos.


ESTRUTURA DO REPOSITÓRIO
------------------------

    db/schema.sql          criação das tabelas
    db/seed.sql            dados de exemplo
    backend/app.py         API Flask
    backend/.env.example   modelo de configuração
    frontend/              index.html, script.js, style.css
    docs/                  MER, DER e demais documentos


COMO RODAR
----------

Pré-requisitos: PostgreSQL (https://www.postgresql.org/download/) e
Python 3.10 ou superior.

1) Criar o banco e popular (use -p PORTA se o seu PostgreSQL não estiver na
   porta 5432):

    psql -U postgres -c "CREATE DATABASE bd1 ENCODING 'UTF8' TEMPLATE template0;"
    psql -U postgres -d bd1 -f db/schema.sql -f db/seed.sql

   No Windows, rode antes o comando abaixo no PowerShell para os acentos
   serem lidos corretamente:

    $env:PGCLIENTENCODING = "UTF8"

2) Configurar a conexão:

    cd backend
    copy .env.example .env        (Linux/Mac: cp .env.example .env)

   Edite o arquivo .env com a porta, usuário e senha do seu PostgreSQL.

3) Instalar dependências e iniciar a API:

    python -m venv .venv
    .venv\Scripts\activate        (Linux/Mac: source .venv/bin/activate)
    pip install -r requirements.txt
    python app.py

   A API sobe em http://127.0.0.1:5000

4) Abrir a interface: abra o arquivo frontend/index.html no navegador.


FUNCIONALIDADES
---------------

Contratos acima de 3000   (GET /consulta1)
    Clientes com contrato de valor maior ou igual a 3000 (subconsulta IN).

Média por estado          (GET /consulta2)
    Média de valor dos contratos por estado, maior que 1000
    (GROUP BY + HAVING).

Funcionários e departamentos   (GET /consulta3)
    Funcionários com cargo, departamento e setor (INNER JOIN).

Clientes e contratos      (GET /consulta4)
    Todos os clientes e seus contratos, mesmo sem contrato (LEFT JOIN).

Contratos com alocação    (GET /consulta5)
    Contratos que tem funcionário alocado (EXISTS).

Inserir Cliente           (POST /clientes)
    Cadastra um novo cliente.

Remover Cliente           (DELETE /clientes/<id>)
    Remove um cliente pelo ID (bloqueado se houver contratos).

