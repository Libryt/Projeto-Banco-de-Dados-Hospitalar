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