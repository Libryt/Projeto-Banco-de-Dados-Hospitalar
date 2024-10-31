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