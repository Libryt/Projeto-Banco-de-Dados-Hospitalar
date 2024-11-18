-- Tabela Especialidade
CREATE TABLE Especialidade (
    id_especialidade SERIAL PRIMARY KEY,
    nome_especialidade VARCHAR(100) NOT NULL
);

-- Tabela Medico
CREATE TABLE Medico (
    id_medico SERIAL PRIMARY KEY,
    nome_medico VARCHAR(100) NOT NULL,
    cpf_medico CHAR(11) UNIQUE NOT NULL,
    crm VARCHAR(20) UNIQUE NOT NULL,
    id_especialidade INT REFERENCES Especialidade(id_especialidade)
);

-- Tabela Enfermeiro
CREATE TABLE Enfermeiro (
    id_enfermeiro SERIAL PRIMARY KEY,
    nome_enfermeiro VARCHAR(100) NOT NULL,
    cpf_enfermeiro CHAR(11) UNIQUE NOT NULL,
    cre VARCHAR(20) UNIQUE NOT NULL
);

-- Tabela Paciente
CREATE TABLE Paciente (
    id_paciente SERIAL PRIMARY KEY,
    nome_paciente VARCHAR(100) NOT NULL,
    dtnasc_paciente DATE NOT NULL,
    cpf_paciente CHAR(11) UNIQUE NOT NULL,
    rg_paciente VARCHAR(15),
    email_paciente VARCHAR(100)
);

-- Tabela Endereco
CREATE TABLE Endereco (
    id_endereco SERIAL PRIMARY KEY,
    logradouro VARCHAR(100),
    cep CHAR(8),
    bairro VARCHAR(50),
    cidade VARCHAR(50),
    estado CHAR(2),
    medico_fk INT REFERENCES Medico(id_medico),
    paciente_fk INT REFERENCES Paciente(id_paciente)
);

-- Tabela Telefone
CREATE TABLE Telefone (
    id_telefone SERIAL PRIMARY KEY,
    ddd CHAR(2) NOT NULL,
    numero CHAR(9) NOT NULL,
    medico_fk INT REFERENCES Medico(id_medico),
    paciente_fk INT REFERENCES Paciente(id_paciente)
);

-- Tabela Consulta
CREATE TABLE Consulta (
    id_consulta SERIAL PRIMARY KEY,
    data_consulta DATE NOT NULL,
    hora_consulta TIME NOT NULL,
    medico_fk INT REFERENCES Medico(id_medico),
    paciente_fk INT REFERENCES Paciente(id_paciente)
);

-- Tabela Internacao
CREATE TABLE Internacao (
    id_internacao SERIAL PRIMARY KEY,
    data_entrada DATE NOT NULL,
    data_prev_alta DATE,
    data_efet_alta DATE,
    paciente_fk INT REFERENCES Paciente(id_paciente),
    medico_fk INT REFERENCES Medico(id_medico)
);

-- Tabela Plantao
CREATE TABLE Plantao (
    id_plantao SERIAL PRIMARY KEY,
    data_plantao DATE NOT NULL,
    hora_plantao TIME NOT NULL,
    enfermeiro_fk INT REFERENCES Enfermeiro(id_enfermeiro),
    internacao_fk INT REFERENCES Internacao(id_internacao)
);