-- Inserção na tabela Departamento

INSERT INTO Departamento (Nome_Departamento, Setor) VALUES
('RH', 'Administração Geral'),
('Vendas', 'Comercial'),
('Marketing Digital', 'Produção Design'),
('Jurídico', 'Administração Geral'),
('Diretoria', 'Administração Geral'),
('Atendimento', 'Comercial'),
('Logística', 'Administração Geral'),
('Administrativo', 'Administração Geral'),
('Financeiro', 'Gestão Financeira'),
('Atuação', 'Comercial'),
('Técnico De Informatica', 'Produção TI'),
('Product Owner', 'Produção Design'),
('Designer', 'Produção Design'),
('Técnico de Som', 'Produção Audiovisual'),
('Filmaker', 'Produção Audiovisual'),
('Programador', 'Produção TI'),
('Editor', 'Produção Audiovisual');

-- Inserção na tabela Pacotes

INSERT INTO Pacotes (Nome_Pacote, Descricao, Restricoes,
Valor_Base) VALUES
('Pacote Único', 'Criação de posts', 'Não faz campanhas, monitoramento, eventos ou site', 500.00),
('Pacote Crescimento', 'Campanhas de marketing, Criação de posts e Monitoramento', 'Não faz eventos, nem criação/monitoramento de site', 1200.00),
('Pacote Eventos', 'Filmagem, Fotografia, Edição e Publicação',
'Não faz campanhas, monitoramento ou site', 2500.00),
('Pacote Web', 'Criação de Site, Monitoramento, Criação de posts e Campanhas', 'Não faz monitoramento de redes e cobertura de eventos', 3500.00),
('Pacote Básico', 'Criação de posts e atendimento a comentários nas redes sociais', 'Não inclui tráfego pago (anúncios), criação de site ou eventos', 800.00),
('Pacote Identidade Visual', 'Criação de logotipo, manual da marca e templates para redes', 'Pacote de entrega única, não inclui gerenciamento mensal', 1500.00),
('Pacote Tráfego Pago', 'Criação, gestão e otimização de campanhas de anúncios (Ads)', 'Não inclui criação de conteúdo orgânico, site ou eventos', 1000.00),
('Pacote Audiovisual', 'Gravação, roteirização e edição de vídeos curtos (Reels/TikTok)', 'Não faz campanhas de anúncios, gestão de site ou monitoramento', 1800.00),
('Pacote E-commerce', 'Criação de loja virtual, cadastro de produtos e integração de frete', 'Não inclui criação de posts para redes sociais ou cobertura de eventos', 4500.00),
('Pacote Premium 360', 'Gestão completa: Posts, Campanhas, Site, Monitoramento e 1 Evento/mês', 'Nenhuma restrição aplicada',
6500.00);

-- Inserção na tabela Cliente

INSERT INTO Cliente (nome, status, email, telefone, CEP, Rua,
numero, cidade, bairro, estado) VALUES
('João Silva', 'Ativo', 'joao@email.com', '11999991111',
'01001-000', 'Rua A', '10', 'São Paulo', 'Centro', 'SP'),
('Maria Oliveira', 'Ativo', 'maria@email.com', '11988882222',
'02002-000', 'Rua B', '20', 'São Paulo', 'Mooca', 'SP'),
('Carlos Souza', 'Inativo', 'carlos@email.com', '21977773333',
'20000-000', 'Av Brasil', '100', 'Rio de Janeiro', 'Centro',
'RJ'),
('Ana Costa', 'Ativo', 'ana@email.com', '31966664444',
'30000-000', 'Rua C', '30', 'Belo Horizonte', 'Savassi', 'MG'),
('Pedro Paulo', 'Ativo', 'pedro@email.com', '41955555555',
'80000-000', 'Rua D', '40', 'Curitiba', 'Batel', 'PR'),
('Lucas Mendes', 'Ativo', 'lucas@email.com', '51944446666',
'90000-000', 'Rua E', '50', 'Porto Alegre', 'Moinhos', 'RS'),
('Juliana Lima', 'Inativo', 'juliana@email.com', '61933337777',
'70000-000', 'Av W3', '60', 'Brasília', 'Asa Sul', 'DF'),
('Fernanda Gomes', 'Ativo', 'fernanda@email.com', '71922228888',
'40000-000', 'Rua F', '70', 'Salvador', 'Barra', 'BA'),
('Ricardo Alves', 'Ativo', 'ricardo@email.com', '81911119999',
'50000-000', 'Rua G', '80', 'Recife', 'Boa Viagem', 'PE'),
('Camila Rocha', 'Ativo', 'camila@email.com', '85900001234',
'60000-000', 'Av Beira Mar', '90', 'Fortaleza', 'Meireles', 'CE'),
('Tech SMDERS LTDA', 'Ativo', 'contato@tech.com', '1133334444',
'01001-001', 'Rua H', '100', 'São Paulo', 'Paulista', 'SP'),
('Comércio de Alimentos', 'Ativo', 'vendas@alimentos.com',
'2133335555', '20000-001', 'Av Brasil', '200', 'Rio de Janeiro',
'Centro', 'RJ'),
('Serviços Gerais SMD', 'Inativo', 'gerais@servicos.com',
'3133336666', '30000-001', 'Rua I', '300', 'Belo Horizonte',
'Centro', 'MG'),
('Consultoria Financeira', 'Ativo', 'financeiro@consult.com',
'4133337777', '80000-001', 'Rua J', '400', 'Curitiba', 'Centro',
'PR'),
('Agência de Marketing', 'Ativo', 'agencia@mkt.com', '5133338888',
'90000-001', 'Rua K', '500', 'Porto Alegre', 'Centro', 'RS'),
('Transportes Rápidos', 'Ativo', 'logistica@transp.com',
'6133339999', '70000-001', 'Setor Cargas', '600', 'Brasília',
'SIA', 'DF'),
('Construtora Edificar', 'Inativo', 'obras@edificar.com',
'7133330000', '40000-001', 'Av Principal', '700', 'Salvador',
'Centro', 'BA'),
('Escola Aprender', 'Ativo', 'diretoria@escola.com', '8133331111',
'50000-001', 'Rua L', '800', 'Recife', 'Centro', 'PE'),
('Clínica Hapvida', 'Ativo', 'atendimento@clinica.com',
'8533332222', '60000-001', 'Rua M', '900', 'Fortaleza', 'Aldeota',
'CE'),
('Livraria Leitura', 'Ativo', 'livros@leitura.com', '1133333333',
'01001-002', 'Rua N', '1000', 'São Paulo', 'Pinheiros', 'SP');

-- Inserção na tabela Cliente_Email

INSERT INTO Cliente_Email (Id_Cliente, Email) VALUES
(1, 'joao.trabalho@email.com'),
(2, 'maria.pessoal@email.com'),
(3, 'carlos.secundario@email.com'),
(4, 'ana.estudos@email.com'),
(5, 'pedro.gamer@email.com'),
(11, 'suporte@tech.com'),
(12, 'financeiro@alimentos.com'),
(13, 'rh@servicos.com'),
(14, 'diretoria@consult.com'),
(15, 'contato@mkt.com');

-- Inserção na tabela Cliente_Telefone

INSERT INTO Cliente_Telefone (Id_Cliente, Telefone) VALUES
(6, '51988888888'),
(7, '61977777777'),
(8, '71966666666'),
(9, '81955555555'),
(10, '85944444444'),
(16, '6133330001'),
(17, '7133330002'),
(18, '8133330003'),
(19, '8533330004'),
(20, '1133330005');

-- Inserção na tabela Pessoa_Fisica
INSERT INTO Pessoa_Fisica (Id_Cliente, CPF, Data_Nascimento)
VALUES
(1, '111.111.111-11', '1990-01-15'),
(2, '222.222.222-22', '1985-05-20'),
(3, '333.333.333-33', '1992-08-10'),
(4, '444.444.444-44', '1988-11-25'),
(5, '555.555.555-55', '1995-03-05'),
(6, '666.666.666-66', '1980-12-12'),
(7, '777.777.777-77', '1998-07-22'),
(8, '888.888.888-88', '1982-02-18'),
(9, '999.999.999-99', '1991-09-30'),
(10, '000.000.000-00', '1989-04-14');

-- Inserção na tabela Pessoa_Juridica

INSERT INTO Pessoa_Juridica (Id_Cliente, CNPJ, Data_fundacao)
VALUES
(11, '11.111.111/0001-11', '2010-01-01'),
(12, '22.222.222/0001-22', '2005-06-15'),
(13, '33.333.333/0001-33', '2015-09-20'),
(14, '44.444.444/0001-44', '2008-11-10'),
(15, '55.555.555/0001-55', '2012-03-25'),
(16, '66.666.666/0001-66', '2000-12-05'),
(17, '77.777.777/0001-77', '2018-07-12'),
(18, '88.888.888/0001-88', '1995-02-28'),
(19, '99.999.999/0001-99', '2020-08-08'),
(20, '00.000.000/0001-00', '1990-04-30');

-- Inserção na tabela Funcionario

INSERT INTO Funcionario (cpf, nome_departamento, nome, cargo)
VALUES
('111.222.333-44', 'RH', 'Ana Clara Souza', 'Analista de Recursos Humanos'),
('222.333.444-55', 'Vendas', 'Carlos Eduardo Lima', 'Executivo de Vendas'),
('333.444.555-66', 'Marketing Digital', 'Beatriz Ferreira',
'Analista de Marketing'),
('444.555.666-77', 'Jurídico', 'Daniel Alves', 'Advogado Corporativo'),
('555.666.777-88', 'Diretoria', 'Eduardo Mendes', 'Diretor de Operações'),
('666.777.888-99', 'Atendimento', 'Fernanda Costa', 'Assistente de Atendimento'),
('777.888.999-00', 'Logística', 'Gabriel Ribeiro', 'Coordenador de Logística'),
('888.999.000-11', 'Administrativo', 'Helena Rocha', 'Auxiliar Administrativo'),
('999.000.111-22', 'Financeiro', 'Igor Santos', 'Analista Financeiro'),
('000.111.222-33', 'Atuação', 'Juliana Castro', 'Atriz Principal'),
('123.123.123-44', 'Técnico De Informatica', 'Lucas Martins',
'Analista de Suporte'),
('234.234.234-55', 'Product Owner', 'Mariana Pereira', 'Product Owner Sênior'),
('345.345.345-66', 'Designer', 'Nicolas Gomes', 'Designer Gráfico'),
('456.456.456-77', 'Técnico de Som', 'Otávio Silva', 'Operador de Áudio'),
('567.567.567-88', 'Filmaker', 'Paula Carvalho', 'Cinegrafista'),
('678.678.678-99', 'Programador', 'Rafael Oliveira',
'Desenvolvedor Full Stack');

-- Inserção na tabela Contrato

INSERT INTO Contrato (id_cliente, nome_pacote, data_inicio,
data_termino, valor_acordado, tipo_cobranca, status_pagamento,
servicos_entregues) VALUES
(1, 'Pacote Crescimento', '2023-01-10', '2024-01-10', 1200.00,
'Mensal', 'Pago', 'Criação de 12 posts no mês, 2 campanhas de tráfego ativas e relatório mensal.'),
(2, 'Pacote Único', '2023-03-15', '2023-04-15', 500.00, 'Única',
'Pendente', 'Entrega de 10 artes para redes sociais e 2 banners.'),
(3, 'Pacote Web', '2023-05-05', '2023-07-05', 3500.00, 'Parcelado (2x)', 'Pago', 'Criação de site institucional com blog, monitoramento de métricas configurado.'),
(4, 'Pacote Premium 360', '2023-02-01', '2024-02-01', 6500.00,
'Mensal', 'Atrasado', 'Gestão completa: posts publicados, site atualizado, anúncios otimizados e 1 cobertura de evento realizada.'),
(5, 'Pacote Eventos', '2023-08-20', '2023-08-25', 2500.00,
'Única', 'Pago', 'Cobertura fotográfica e filmagem de evento de 4h. Vídeo final entregue.'),
(6, 'Pacote Identidade Visual', '2023-09-01', '2023-10-01',
1500.00, 'Única', 'Pendente', 'Elaboração de logo, tipografia e manual da marca em andamento.'),
(7, 'Pacote Básico', '2023-10-10', '2024-10-10', 800.00, 'Mensal',
'Pago', 'Gestão de comentários e 8 posts publicados no mês.'),
(8, 'Pacote Tráfego Pago', '2023-11-05', '2024-05-05', 1000.00,
'Mensal', 'Pago', 'Campanhas no Google Ads e Meta Ads criadas e otimizadas semanalmente.'),
(9, 'Pacote Audiovisual', '2023-11-20', '2023-12-20', 1800.00,
'Única', 'Cancelado', 'Cliente cancelou antes da captação das imagens.'),
(10, 'Pacote E-commerce', '2024-01-15', '2024-03-15', 4500.00,
'Parcelado (3x)', 'Pendente', 'Estruturação da loja virtual concluída, aguardando cadastro de produtos pelo cliente.'),
(11, 'Pacote Crescimento', '2024-02-01', '2025-02-01', 1200.00,
'Mensal', 'Pago', 'Onboarding concluído, cronograma de postagens aprovado.'),
(12, 'Pacote Premium 360', '2024-03-10', '2025-03-10', 6500.00,
'Mensal', 'Pendente', 'Assinatura de contrato recente, iniciando diagnóstico da marca.');

-- Inserção na tabela Parcela

INSERT INTO Parcela (Id_Contrato, Numero_Parcela, Data_Vencimento,
Status_Pagamento, Valor_Parcela) VALUES
(1, 1, '2024-02-01', 'Pago', 99.90),
(2, 1, '2024-03-15', 'Atrasado', 180.00),
(3, 1, '2024-04-01', 'Pago', 900.00),
(4, 1, '2024-06-01', 'Pago', 2500.00),
(5, 1, '2024-05-10', 'Pago', 120.00),
(6, 1, '2024-02-20', 'Pago', 299.90),
(7, 1, '2024-03-01', 'Cancelado', 49.90),
(8, 1, '2024-06-05', 'Pendente', 50.00),
(9, 1, '2024-02-11', 'Pago', 450.00),
(10, 1, '2024-12-01', 'Pendente', 1500.00);

-- Inserção na tabela Recebe

INSERT INTO Recebe (Id_Contrato, CPF_Funcionario,
Atribuicao_servico, Data) VALUES
(1, '111.222.333-44', 'Configuração inicial', '2024-01-02'),
(2, '333.444.555-66', 'Tentativa de contato para cobrança',
'2024-03-20'),
(3, '666.777.888-99', 'Instalação de infraestrutura VIP',
'2024-03-05'),
(4, '555.666.777-88', 'Gerenciamento do projeto ERP',
'2023-06-05'),
(5, '777.888.999-00', 'Entrega de equipamentos', '2024-04-12'),
(6, '222.333.444-55', 'Onboarding do cliente', '2024-01-22'),
(7, '444.555.666-77', 'Processamento de cancelamento',
'2024-03-05'),
(8, '000.111.222-33', 'Liberação de acessos do sistema',
'2024-05-06'),
(9, '123.123.123-44', 'Manutenção preventiva de servidor',
'2024-05-15'),
(10, '345.345.345-66', 'Reunião de alinhamento executivo',
'2024-06-02');
