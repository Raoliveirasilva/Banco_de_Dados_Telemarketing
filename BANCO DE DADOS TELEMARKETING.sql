CREATE DATABASE telemarketing;

USE telemarketing

CREATE TABLE Cliente (
    id_cliente INT IDENTITY(1,1) PRIMARY KEY,
    nomeCliente varchar(100) NOT NULL,
    telefoneCliente varchar(25) NOT NULL,
    endereco nvarchar(100) NOT NULL,
    CPF nvarchar(15) NOT NULL
);

CREATE TABLE Atendente (
    id_atendente INT IDENTITY(1,1) PRIMARY KEY,
	id_cliente INT NOT NULL,
    Nome_Atendente varchar(50) NOT NULL,
    Nome_empresa varchar(30) NOT NULL,
    Data_Atend DATE,
	CONSTRAINT fk_Clientes FOREIGN KEY (id_cliente) REFERENCES Cliente (id_cliente)
);

CREATE TABLE Causa_Solucao (
    id_causa_solucao INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	id_cliente INT NOT NULL,
    CPF_Cliente nvarchar(15) NOT NULL,
    Motivo_lig varchar(100) NOT NULL,
    Desc_Problema varchar(150) NOT NULL,
    Solucao varchar(150) NOT NULL,
	CONSTRAINT fk_CausaClientes FOREIGN KEY (id_cliente) REFERENCES Cliente (id_cliente)
);

CREATE TABLE Protocolo (
    id_protocolo INT IDENTITY(1,1) PRIMARY KEY,
	id_cliente INT,
    Dados_Cliente NVARCHAR(15) NOT NULL,
    Dados_Atendente VARCHAR(50) NOT NULL,
    Caso NVARCHAR(20) NOT NULL,
    Num_Protoco NVARCHAR(15) NOT NULL,
	CONSTRAINT fk_ProtocoloCliente FOREIGN KEY (id_cliente) REFERENCES Cliente (id_cliente)
);

-- INSERÇÃO DE DADOS NA TABELA CLIENTE
INSERT into Cliente (nomeCliente, telefoneCliente, endereco, CPF)
VALUES 
('Ingrid Souza Santos', '(11) 99493-7947', 'JD Laura', '910.977.358-42'),
('Emanuel Kevin da costa', '(19) 99733-7947', 'Rua Vereador Luiz Antonio Mitry Neto 360', '209.788.828-30'),
('Bryan Heitor José Ramos', '(12) 98116-8675', 'Rua Engenheiro Antônio Penido', '839.587.768-41'),
('Emilly Benedita Pinto', '(19) 2995-6223', 'Rua Mário Alvez Ferraz', '741.979.748-09'),
('Sérgio Thomas Farias', '(13) 98995-2696', 'Rua Manoel Marques Nabeto', '457.514.198-47'),
('Cristiane Andreia Laís Figueiredo', '(11) 98885-8851', 'Travessa Santa Adelaide', '993.323.838-80'),
('Yago Rafael Araújo', '(19) 99638-8939', 'Avenida Germano Dix', '534.100.668-29'),
('Lúcia Luana Moreira', '(11) 98546-9314', 'Rua Jerusalém', '738.294.708-43'),
('Alexandre Victor Carlos Eduardo Ferreira', '(11) 99410-6129', 'Rua José Albinati', '122.678.418-60'),
('Thales Mário Caldeira', '(12) 99577-8014 ', 'Rua José Dias', '022.540.358-78');

 -- INSERÇÃO DE DADOS NA TABELA ATENDENTE
INSERT INTO Atendente (id_cliente, Nome_Atendente, Nome_empresa, Data_Atend)
VALUES 
(1,'Fernanda Monteiro Lima', 'Telemarketing Keeper', '2022/04/22'),
(2,'Fernanda Monteiro Lima', 'Telemarketing Keeper', '2022/04/22'),
(3,'Yasmin Rocha dos Santos', 'Telemarketing Keeper', '2022/04/22'),
(4,'Thiago Ribeiro Silva', 'Telemarketing Keeper', '2022/04/23'),
(5,'Bruno de la cruz', 'Telemarketing Keeper', '2022/04/23'),
(6,'Yasmin Rocha dos Santos', 'Telemarketing Keeper', '2022/04/23'),
(7,'Thiago Ribeiro Silva', 'Telemarketing Keeper', '2022/04/22'),
(8,'Fernanda Monteiro Lima', 'Telemarketing Keeper', '2022/04/24'),
(9,'Thiago Ribeiro Silva', 'Telemarketing Keeper', '2022/04/24'),
(10,'Bruno de la cruz', 'Telemarketing Keeper', '2022/04/30');

-- INSERÇÃO DE DADOS NA TABELA CAUSA_SOLUCAO
INSERT INTO Causa_Solucao (id_cliente, CPF_Cliente, Motivo_lig, Desc_Problema, Solucao)
VALUES
(1, '910.977.358-42', 'Valor indevido na fatura', 'Conta veio com valor superior ao combinado', 'Problema sulucionado'),
(2, '209.788.828-30', 'Fatura do mês não recebida', 'A fatura do mês 4 não chegou', 'Problema sulucionado'),
(3, '839.587.768-41', 'Internet muito lenta', 'A internet esta lenta, nao consigo acessar nada', 'Problema sulucionado'),
(4, '741.979.748-09', 'Valor indevido na fatura', 'Conta veio com valor superior e com data de vencimento errada', 'Problema sulucionado'),
(5, '457.514.198-47', 'Sem acesso a internet', 'Minha Conexão caiu e ate o momento nada de voltar', 'Problema sulucionado'),
(6, '993.323.838-80', 'Tv sem sinal', 'O poste quebrou minha antena e estou sem sinal de tv', 'Problema não sulucionado'),
(7, '534.100.668-29', 'Roubaram minha conta na caixa de correio', 'Roubaram minha conta e pagaram como faço para paga-la', 'Problema sulucionado'),
(8, '738.294.708-43', 'Tecnico da sua empresa assaltou minha residencia', 'Chamei um tecnico para arrumar minha internet é ele assaltou minha casa, como proceder', 'Problema sulucionado'),
(9, '122.678.418-60', 'Meu canarinho esta cantando de formas estranha', 'Comprei um canario na shopee qu canta como um urutau', 'Problema não sulucionado'),
(10, '022.540.358-78', 'quero cancelar minha assinatura', 'tenho assinatura de tv e quero cancelar', 'Problema sulucionado');

--INSERÇÃO DE DADOS NA TABELA Protocolo
INSERT INTO Protocolo (id_cliente,Dados_Cliente, Dados_Atendente, Caso, Num_Protoco)
VALUES
(1,'910.977.358-42', 'Fernanda Monteiro Lima', 'Solucionado', '00140896001402'),
(2,'209.788.828-30', 'Fernanda Monteiro Lima', 'Solucionado', '00741236001402'),
(3,'839.587.768-41', 'Yasmin Rocha dos Santos', 'Solucionado', '00741296384521'),
(4,'741.979.748-09', 'Thiago Ribeiro Silva', 'Solucionado', '00985621437521'), 
(5,'457.514.198-47', 'Bruno de la cruz', 'Solucionado', '00985621437521'), 
(6,'993.323.838-80', 'Yasmin Rocha dos Santos', 'Não Solucionado', '00852021437521'), 
(7,'534.100.668-29', 'Thiago Ribeiro Silva', 'Solucionado', '75315985204961'), 
(8,'738.294.708-43', 'Fernanda Monteiro Lima', 'Solucionado', '79517894204357'), 
(9,'122.678.418-60', 'Thiago Ribeiro Silva', 'Não Solucionado', '02587414204357'),
(10,'022.540.358-78', 'Bruno de la cruz', 'Solucionado', '96387414204754');

SELECT * FROM Cliente
SELECT * FROM Atendente
SELECT * FROM Causa_Solucao
SELECT * FROM Protocolo

-- Teste com INNER JOIN
SELECT nc.nomeCliente, nc.CPF, pt.Dados_Atendente, pt.Caso
FROM Cliente AS nc
INNER JOIN Protocolo pt ON nc.id_cliente = pt.id_cliente;