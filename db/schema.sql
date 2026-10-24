-- Tabelas sem chaves estrangeiras

CREATE TABLE Cliente (
    Id_Cliente SERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    status VARCHAR(50),
    email VARCHAR(150),
    telefone VARCHAR(20),
    CEP VARCHAR(15),
    Rua VARCHAR(150),
    numero VARCHAR(20),
    cidade VARCHAR(100),
    bairro VARCHAR(100),
    estado VARCHAR(2)
);

CREATE TABLE Departamento (
    Nome_Departamento VARCHAR(100) PRIMARY KEY,
    Setor VARCHAR(100)
);

CREATE TABLE Pacotes (
    Nome_Pacote VARCHAR(100) PRIMARY KEY,
    Descricao TEXT,
    Restricoes TEXT,
    Valor_Base NUMERIC(10, 2) NOT NULL
);

-- Tabelas dependentes de Cliente e Departamento

CREATE TABLE Cliente_Email (
    Id_Cliente INT,
    Email VARCHAR(150),
    PRIMARY KEY (Id_Cliente, Email),
    FOREIGN KEY (Id_Cliente) REFERENCES Cliente(Id_Cliente) ON DELETE CASCADE
);

CREATE TABLE Cliente_Telefone (
    Id_Cliente INT,
    Telefone VARCHAR(20),
    PRIMARY KEY (Id_Cliente, Telefone),
    FOREIGN KEY (Id_Cliente) REFERENCES Cliente(Id_Cliente) ON DELETE CASCADE
);

CREATE TABLE Pessoa_Fisica (
    Id_Cliente INT PRIMARY KEY,
    CPF VARCHAR(14) UNIQUE NOT NULL,
    Data_Nascimento DATE,
    FOREIGN KEY (Id_Cliente) REFERENCES Cliente(Id_Cliente) ON DELETE CASCADE
);

CREATE TABLE Pessoa_Juridica (
    Id_Cliente INT PRIMARY KEY,
    CNPJ VARCHAR(18) UNIQUE NOT NULL,
    Data_fundacao DATE,
    FOREIGN KEY (Id_Cliente) REFERENCES Cliente(Id_Cliente) ON DELETE CASCADE
);

CREATE TABLE Funcionario (
    CPF VARCHAR(14) PRIMARY KEY,
    Nome_Departamento VARCHAR(100),
    Nome VARCHAR(150) NOT NULL,
    Cargo VARCHAR(100),
    FOREIGN KEY (Nome_Departamento) REFERENCES Departamento(Nome_Departamento)
);

-- Tabela Contrato depende de Cliente e Pacotes

CREATE TABLE Contrato (
    Id_Contrato SERIAL PRIMARY KEY,
    Id_Cliente INT,
    Nome_Pacote VARCHAR(100),
    Data_Inicio DATE,
    Data_Termino DATE,
    Valor_Acordado NUMERIC(10, 2),
    Tipo_Cobranca VARCHAR(50),
    Status_Pagamento VARCHAR(50),
    Servicos_entregues TEXT,
    FOREIGN KEY (Id_Cliente) REFERENCES Cliente(Id_Cliente),
    FOREIGN KEY (Nome_Pacote) REFERENCES Pacotes(Nome_Pacote)
);

-- Tabela dependentes de Contrato

CREATE TABLE Parcela (
    Id_Contrato INT,
    Numero_Parcela INT,
    Data_Vencimento DATE,
    Status_Pagamento VARCHAR(50),
    Valor_Parcela NUMERIC(10, 2),
    PRIMARY KEY (Id_Contrato, Numero_Parcela),
    FOREIGN KEY (Id_Contrato) REFERENCES Contrato(Id_Contrato) ON DELETE CASCADE
);

CREATE TABLE Recebe (
    Id_Contrato INT,
    CPF_Funcionario VARCHAR(14),
    ID_Alocacao SERIAL,
    Atribuicao_servico TEXT,
    Data DATE,
    PRIMARY KEY (Id_Contrato, CPF_Funcionario),
    FOREIGN KEY (Id_Contrato) REFERENCES Contrato(Id_Contrato),
    FOREIGN KEY (CPF_Funcionario) REFERENCES Funcionario(CPF)
);
