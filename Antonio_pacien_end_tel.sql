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