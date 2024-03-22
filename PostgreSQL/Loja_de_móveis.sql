CREATE TABLE Vendedor(
	CodVdd int PRIMARY KEY,
	CPF numeric(11),
	v_comissao numeric(4,2),
	Nome varchar(50),
	Endereço varchar(100)
);

--VENDEDOR

INSERT INTO Vendedor
VALUES
(1, 12345678900, 5.00, 'Alane Evellyn', 'Rua Manu Menezes, 141'),
(2, 98765432100, 4.50, 'Júlia Maria', 'Rua São Manoel, 287'),
(3, 45678912300, 5.50, 'Emerson Dantas', 'Rua Colibris , 175');

CREATE TABLE Cliente(
	codCli int PRIMARY KEY,
	Nome varchar(50),
	Tel char(10),
	Endereco varchar(100),
	CPF numeric(11),
	Email varchar(50)
);

--Cliente

INSERT INTO Produto (codPro, Custo, Descricao, Preco, Nome)
VALUES
(1, 10.00, 'Produto 1', 20.00, 'Produto A'),
(2, 15.00, 'Produto 2', 25.00, 'Produto B'),
(3, 20.00, 'Produto 3', 30.00, 'Produto C');


CREATE TABLE Produto(
	codPro int PRIMARY KEY,
	Custo numeric (11,2),
	Descricao text,
	Preco numeric (11,2),
	Nome varchar(50)
);

--Produto

INSERT INTO Produto (codPro, Custo, Descricao, Preco, Nome)
VALUES
(1, 10.00, 'Produto 1', 20.00, 'Produto A'),
(2, 15.00, 'Produto 2', 25.00, 'Produto B'),
(3, 20.00, 'Produto 3', 30.00, 'Produto C');


CREATE TABLE Motorista(
	codMod int PRIMARY KEY,
	CPF numeric (11),
	Nome varchar(50),
	endereço varchar(100)
);

--Motorista

INSERT INTO Motorista (codMod, CPF, Nome, endereço)
VALUES
(1, 11122233344, 'José Pereira', 'Rua M, 789'),
(2, 55566677788, 'Fernanda Oliveira', 'Av. N, 456'),
(3, 99988877766, 'Paulo Silva', 'Pç. O, 123');


CREATE TABLE Veiculo (
    Placa char(7) PRIMARY KEY,
    Capacidade int
);

--Veículo

INSERT INTO Veiculo (Placa, Capacidade)
VALUES
('ABC1234', 5),
('DEF5678', 7),
('GHI9012', 10);


CREATE TABLE Entrega (
    Hora TIME,
    Data DATE,
    Num_Ven INT,
    Placa CHAR(7) REFERENCES Veiculo (Placa),
    codMot INT REFERENCES Motorista (codMod),
    PRIMARY KEY (Hora, Data)
);

--Entrega (entregas diferentes com veículos e motoristas correspondentes:)

INSERT INTO Entrega (Hora, Data, Num_Ven, Placa, codMot)
VALUES
('10:00', '2024-03-25', 1, 'ABC1234', 1),
('12:00', '2024-03-25', 2, 'DEF5678', 2),
('15:00', '2024-03-25', 3, 'GHI9012', 3);

CREATE TABLE Venda(
	NumVen int primary key,
	Valor_Total numeric(11,2),
	codVdd int references Vendedor,
	codCli int references Cliente
);

--Venda

INSERT INTO Venda (NumVen, Valor_Total, codVdd, codCli)
VALUES
(1, 100.00, 1, 1),
(2, 150.00, 2, 2),
(3, 200.00, 3, 3);


CREATE TABLE Item_venda(
    codPro int primary key,
    Num_Ven int references Venda(NumVen),
    vUnitario numeric (11,2),
    Qtd int
);

--Item_venda

INSERT INTO Item_venda (codPro, Num_Ven, vUnitario, Qtd)
VALUES
(1, 1, 20.00, 2),
(2, 2, 25.00, 3),
(3, 3, 30.00, 4);


