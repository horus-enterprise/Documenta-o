CREATE DATABASE Horus;

USE  Horus;


CREATE TABLE Empresa (
  idEmpresa INT PRIMARY KEY IDENTITY,
  codigo VARCHAR(40),
  cnpj CHAR(14) NULL,
  razaoSocial VARCHAR(255),
  email VARCHAR(255),
  cep CHAR(9),
  uf CHAR(2),
  cidade VARCHAR(100),
  bairro VARCHAR(100),
  lougadouro VARCHAR(100),
  numero INT,
  complemento VARCHAR(100)
  );


CREATE TABLE Slack (
  idSlack  INT PRIMARY KEY IDENTITY,
  urlSlack VARCHAR(250),
  fkEmpresa INT NOT NULL,
  FOREIGN KEY (fkEmpresa) REFERENCES Empresa (idEmpresa)
);
  
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Funcionario (
  idFuncionario INT NOT NULL PRIMARY KEY IDENTITY,
  nomeFuncionario VARCHAR(200) NULL,
  email VARCHAR(200) NULL,
  senha VARCHAR(200) BINARY NULL,
  fkEmpresa INT NOT NULL,
  FOREIGN KEY (fkEmpresa) REFERENCES Empresa (idEmpresa),
  fkSupervisor INT,
  FOREIGN KEY (fkSupervisor) REFERENCES Funcionario (idFuncionario)
  );


CREATE TABLE Maquina (
  idMaquina INT NOT NULL PRIMARY KEY IDENTITY,
  hostname VARCHAR(30) NULL,
  fkEmpresa INT NOT NULL,
  nomeCpu VARCHAR(100),
  modeloDisco VARCHAR(100),
  tamanhoDisco FLOAT,
  tamanhoRam FLOAT,
  FOREIGN KEY (fkEmpresa) REFERENCES Empresa (idEmpresa)
  );


CREATE TABLE MonitoramentoWeb (
fkFuncionario INT NOT NULL,
FOREIGN KEY (fkFuncionario) REFERENCES Funcionario (idFuncionario),
fkMaquina INT NOT NULL,
FOREIGN KEY (fkMaquina) REFERENCES Maquina (idMaquina),
PRIMARY KEY (fkFuncionario, fkMAquina),
url VARCHAR (200),
dataHora DATETIME2 DEFAULT GETDATE() 
);


CREATE TABLE MonitoramentoHardware (
  idOcorrencia INT NOT NULL PRIMARY KEY IDENTITY,
  fkMaquina INT NOT NULL,
  FOREIGN KEY (fkMaquina) REFERENCES Maquina (idMaquina),
  dataHora DATETIME2 DEFAULT GETDATE(),
  cpuUso FLOAT,
  cpuTemperatura FLOAT,
  disco FLOAT,
  ram FLOAT,
  uptime VARCHAR(max)
);


CREATE TABLE Monitoramento (
idMonitoramento INT PRIMARY KEY IDENTITY,
fkEmpresa INT NOT NULL,
FOREIGN KEY (fkEmpresa) REFERENCES Empresa (idEmpresa),
fkMaquina INT NOT NULL,
FOREIGN KEY (fkMaquina) REFERENCES Maquina (idMaquina),
cpuAtivo BIT,
discoAtivo BIT,
ramAtivo BIT
);