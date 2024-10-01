CREATE TABLE Aluno (
    ra VARCHAR(10) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    data_nascimento DATE NOT NULL,
    sexo CHAR(1) NOT NULL,
    escolaridade VARCHAR(50),
    email VARCHAR(100) NOT NULL
);
CREATE TABLE Professor (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    data_nascimento DATE NOT NULL,
    sexo CHAR(1) NOT NULL,
    titulação VARCHAR(50),
    email VARCHAR(100) NOT NULL
);
CREATE TABLE Periodo (
    id SERIAL PRIMARY KEY,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL
);
CREATE TABLE Curso (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    carga_horária INTEGER NOT NULL,
    status VARCHAR(10) CHECK (status IN ('Ativo', 'Inativo')) NOT NULL,
    id_professor INTEGER NOT NULL,
    id_período INTEGER NOT NULL,
    FOREIGN KEY (id_professor) REFERENCES Professor(id),
    FOREIGN KEY (id_período) REFERENCES Periodo(id),
    UNIQUE (nome, id_período)
);
CREATE TABLE Matricula (
    ra_aluno VARCHAR(10) REFERENCES Aluno(ra),
    id_curso INT REFERENCES Curso(id),
    data_matricula DATE NOT NULL,
    n1 DECIMAL(4,2),
    n2 DECIMAL(4,2),
    nf DECIMAL(4,2),
    resultado VARCHAR(20),
    PRIMARY KEY (ra_aluno, id_curso)
);
/*ALTER TABLE Professor ADD COLUMN email VARCHAR(100) NOT NULL;*/
/*ALTER TABLE Aluno ADD COLUMN email VARCHAR(100) NOT NULL;*/
CREATE INDEX idx_aluno_cpf ON Aluno(cpf);
CREATE INDEX idx_professor_cpf ON Professor(cpf);

INSERT INTO Aluno (ra, nome, cpf, data_nascimento, sexo, escolaridade, email) 
VALUES ('A123', 'Maria Silva', '12345678901', '2000-01-01', 'F', 'Graduação', 'maria.silva@email.com');
INSERT INTO Aluno (ra, nome, cpf, data_nascimento, sexo, escolaridade, email)
VALUES
('A234', 'Julio Cocorico', '23456789012', '2000-12-23','M', 'Ensino Superior', 'juliococorico@email.com'),
('A003', 'Carlos Souza', '34567890123', '2000-11-25', 'M', 'Ensino Médio', 'carlos.souza@email.com'),
('A004', 'Ana Lima', '45678901234', '1997-02-18', 'F', 'Ensino Superior', 'ana.lima@email.com'),
('A005', 'Fernanda Costa', '56789012345', '1999-09-12', 'F', 'Ensino Médio', 'fernanda.costa@email.com'),
('A006', 'Pedro Rocha', '67890123456', '1998-03-14', 'M', 'Ensino Superior', 'pedro.rocha@email.com'),
('A007', 'Lucas Almeida', '78901234567', '2001-07-21', 'M', 'Ensino Médio', 'lucas.almeida@email.com'),
('A008', 'Beatriz Martins', '89012345678', '1996-12-05', 'F', 'Ensino Superior', 'beatriz.martins@email.com'),
('A009', 'Gabriel Santos', '90123456789', '1995-09-30', 'M', 'Ensino Superior', 'gabriel.santos@email.com'),
('A010', 'Renata Lima', '12312312312', '1999-08-16', 'F', 'Ensino Médio', 'renata.lima@email.com'),
('A011', 'Marcelo Ferreira', '23423423423', '2002-05-08', 'M', 'Ensino Médio', 'marcelo.ferreira@email.com'),
('A012', 'Tatiana Duarte', '34534534534', '1997-11-11', 'F', 'Ensino Superior', 'tatiana.duarte@email.com'),
('A013', 'Bruno Carvalho', '45645645645', '1996-02-27', 'M', 'Ensino Médio', 'bruno.carvalho@email.com'),
('A014', 'Carla Mendes', '56756756756', '2000-01-19', 'F', 'Ensino Médio', 'carla.mendes@email.com'),
('A015', 'Eduardo Nunes', '67867867867', '1998-04-12', 'M', 'Ensino Superior', 'eduardo.nunes@email.com'),
('A016', 'Paula Costa', '78978978978', '1994-03-10', 'F', 'Ensino Superior', 'paula.costa@email.com'),
('A017', 'Felipe Araújo', '89089089089', '2000-07-17', 'M', 'Ensino Médio', 'felipe.araujo@email.com'),
('A018', 'Juliana Souza', '90190190190', '1995-06-25', 'F', 'Ensino Superior', 'juliana.souza@email.com'),
('A019', 'Roberto Silva', '12345612345', '1997-10-01', 'M', 'Ensino Médio', 'roberto.silva@email.com'),
('A020', 'Camila Santos', '23456723456', '1999-02-22', 'F', 'Ensino Médio', 'camila.santos@email.com'),
('A021', 'Leandro Gomes', '34567834567', '1995-01-30', 'M', 'Ensino Superior', 'leandro.gomes@email.com'),
('A022', 'Patrícia Faria', '45678945678', '1996-11-05', 'F', 'Ensino Médio', 'patricia.faria@email.com'),
('A023', 'Igor Teixeira', '56789056789', '1998-09-20', 'M', 'Ensino Superior', 'igor.teixeira@email.com'),
('A024', 'Mônica Mendes', '67890167890', '2001-06-15', 'F', 'Ensino Médio', 'monica.mendes@email.com'),
('A025', 'Thiago Souza', '78901278901', '1997-07-23', 'M', 'Ensino Superior', 'thiago.souza@email.com'),
('A026', 'Letícia Oliveira', '89012389012', '1994-10-27', 'F', 'Ensino Superior', 'leticia.oliveira@email.com'),
('A027', 'Vinícius Nunes', '90123490123', '1999-12-14', 'M', 'Ensino Médio', 'vinicius.nunes@email.com'),
('A028', 'Larissa Duarte', '12332112332', '2000-05-22', 'F', 'Ensino Superior', 'larissa.duarte@email.com'),
('A029', 'Fernando Souza', '23443223443', '1996-09-09', 'M', 'Ensino Médio', 'fernando.souza@email.com'),
('A030', 'Sabrina Costa', '34554334554', '1995-03-17', 'F', 'Ensino Médio', 'sabrina.costa@email.com'),
('A031', 'Gustavo Santos', '45665445665', '2000-11-29', 'M', 'Ensino Médio', 'gustavo.santos@email.com'),
('A032', 'Rafaela Nunes', '56776556776', '1999-06-04', 'F', 'Ensino Superior', 'rafaela.nunes@email.com'),
('A033', 'Rafael Lima', '67887667887', '1998-12-09', 'M', 'Ensino Superior', 'rafael.lima@email.com'),
('A034', 'Viviane Costa', '78998778998', '1997-04-12', 'F', 'Ensino Médio', 'viviane.costa@email.com'),
('A035', 'Henrique Teixeira', '89009889009', '1995-08-21', 'M', 'Ensino Superior', 'henrique.teixeira@email.com'),
('A036', 'Bianca Souza', '90110990110', '2001-10-19', 'F', 'Ensino Médio', 'bianca.souza@email.com'),
('A037', 'Matheus Nunes', '12321212321', '1996-07-11', 'M', 'Ensino Médio', 'matheus.nunes@email.com'),
('A038', 'Débora Faria', '23432323432', '1999-03-30', 'F', 'Ensino Superior', 'debora.faria@email.com'),
('A039', 'Ricardo Souza', '34543434543', '1997-11-16', 'M', 'Ensino Superior', 'ricardo.souza@email.com'),
('A040', 'Lúcia Ferreira', '45654545654', '1996-08-22', 'F', 'Ensino Superior', 'lucia.ferreira@email.com'),
('A041', 'André Lima', '56765656765', '1998-12-12', 'M', 'Ensino Médio', 'andre.lima@email.com'),
('A042', 'Cláudia Araújo', '67876767876', '2000-04-02', 'F', 'Ensino Superior', 'claudia.araujo@email.com'),
('A043', 'Danilo Martins', '78987878987', '1997-02-26', 'M', 'Ensino Médio', 'danilo.martins@email.com'),
('A044', 'Natália Mendes', '89098989098', '1995-05-04', 'F', 'Ensino Médio', 'natalia.mendes@email.com'),
('A045', 'Otávio Rocha', '90109090109', '1994-10-22', 'M', 'Ensino Superior', 'otavio.rocha@email.com'),
('A046', 'Júlia Santos', '12344321234', '1996-09-17', 'F', 'Ensino Médio', 'julia.santos@email.com'),
('A047', 'Marcos Nunes', '23455432345', '2000-02-14', 'M', 'Ensino Médio', 'marcos.nunes@email.com'),
('A048', 'Amanda Souza', '34566543456', '1997-06-08', 'F', 'Ensino Superior', 'amanda.souza@email.com'),
('A049', 'Sérgio Teixeira', '45677654567', '1995-11-03', 'M', 'Ensino Médio', 'sergio.teixeira@email.com'),
('A050', 'Tânia Costa', '56788765678', '1998-08-09', 'F', 'Ensino Médio', 'tania.costa@email.com');


INSERT INTO Professor (nome, cpf, data_nascimento, sexo, titulação, email)
VALUES ('Dr. João Pereira', '23456789012', '1975-05-15', 'M', 'Doutorado', 'joao.pereira@email.com');
INSERT INTO Professor (nome, cpf, data_nascimento, sexo, titulação, email)
VALUES 
('Ana Costa', '45326465785', '1990-05-14', 'F', 'Mestre', 'ana.costa@email.com'),
('Lucas Andrade', '25674839106', '1988-09-25', 'M', 'Mestre', 'lucas.andrade@email.com'),
('Fernanda Lima', '56482390174', '1992-03-12', 'F', 'Doutor', 'fernanda.lima@email.com'),
('João Pereira', '82345671902', '1985-11-30', 'M', 'Graduado', 'joao.pereira@email.com'),
('Beatriz Almeida', '75489613205', '1991-07-21', 'F', 'Especialista', 'beatriz.almeida@email.com'),
('Carlos Silva', '92345678901', '1993-01-18', 'M', 'Mestre', 'carlos.silva@email.com'),
('Mariana Oliveira', '98345678912', '1990-08-02', 'F', 'Mestre', 'mariana.oliveira@email.com'),
('Felipe Santos', '58309127465', '1987-06-15', 'M', 'Especialista', 'felipe.santos@email.com'),
('Juliana Rocha', '34985276018', '1995-03-10', 'F', 'Graduado', 'juliana.rocha@email.com'),
('Paulo Ribeiro', '23765491803', '1989-12-22', 'M', 'Doutor', 'paulo.ribeiro@email.com'),
('Roberta Souza', '16784923019', '1994-04-18', 'F', 'Mestre', 'roberta.souza@email.com'),
('Renato Figueira', '29837465104', '1992-10-20', 'M', 'Especialista', 'renato.figueira@email.com'),
('Aline Monteiro', '32874659104', '1991-11-14', 'F', 'Mestre', 'aline.monteiro@email.com'),
('Ricardo Duarte', '49385276412', '1986-05-23', 'M', 'Mestre', 'ricardo.duarte@email.com'),
('Sofia Martins', '10475892346', '1995-06-12', 'F', 'Doutor', 'sofia.martins@email.com'),
('Mateus Barros', '27583904612', '1993-02-19', 'M', 'Graduado', 'mateus.barros@email.com'),
('Patrícia Carvalho', '54328967103', '1992-07-27', 'F', 'Especialista', 'patricia.carvalho@email.com'),
('Bruno Fernandes', '75689423107', '1990-10-01', 'M', 'Mestre', 'bruno.fernandes@email.com'),
('Clarice Borges', '48392057126', '1994-09-08', 'F', 'Especialista', 'clarice.borges@email.com'),
('Guilherme Alves', '67293047581', '1991-04-29', 'M', 'Mestre', 'guilherme.alves@email.com'),
('Natália Teixeira', '57382016498', '1992-11-19', 'F', 'Mestre', 'natalia.teixeira@email.com'),
('Marcos Souza', '38291037485', '1989-07-09', 'M', 'Doutor', 'marcos.souza@email.com'),
('Amanda Ramos', '10928475631', '1993-03-04', 'F', 'Graduado', 'amanda.ramos@email.com'),
('Rodrigo Melo', '76283920147', '1988-08-11', 'M', 'Mestre', 'rodrigo.melo@email.com'),
('Larissa Castro', '40392657128', '1994-12-05', 'F', 'Especialista', 'larissa.castro@email.com'),
('Thiago Azevedo', '29485763109', '1990-02-28', 'M', 'Mestre', 'thiago.azevedo@email.com'),
('Bruna Machado', '50937648271', '1995-05-18', 'F', 'Mestre', 'bruna.machado@email.com'),
('Leandro Moraes', '82745639025', '1987-09-06', 'M', 'Doutor', 'leandro.moraes@email.com'),
('Carolina Duarte', '65829410723', '1992-01-22', 'F', 'Especialista', 'carolina.duarte@email.com'),
('Eduardo Martins', '91028374652', '1988-11-16', 'M', 'Mestre', 'eduardo.martins@email.com'),
('Gabriela Soares', '37482910562', '1991-02-27', 'F', 'Mestre', 'gabriela.soares@email.com'),
('Vinícius Torres', '58392074103', '1990-06-30', 'M', 'Graduado', 'vinicius.torres@email.com'),
('Isabela Carvalho', '29748392015', '1993-09-13', 'F', 'Especialista', 'isabela.carvalho@email.com'),
('Diego Lima', '92038475163', '1987-05-11', 'M', 'Mestre', 'diego.lima@email.com'),
('Luiza Fernandes', '50692748301', '1994-10-17', 'F', 'Mestre', 'luiza.fernandes@email.com'),
('Marcelo Ribeiro', '38492057124', '1986-12-09', 'M', 'Doutor', 'marcelo.ribeiro@email.com'),
('Rafaela Cunha', '71284930567', '1992-07-08', 'F', 'Graduado', 'rafaela.cunha@email.com'),
('Fábio Oliveira', '84029375109', '1989-03-22', 'M', 'Especialista', 'fabio.oliveira@email.com'),
('Daniela Araújo', '39482756103', '1991-08-01', 'F', 'Mestre', 'daniela.araujo@email.com'),
('Gustavo Ferreira', '58293047102', '1988-10-28', 'M', 'Mestre', 'gustavo.ferreira@email.com'),
('Camila Vieira', '67120394528', '1994-11-25', 'F', 'Especialista', 'camila.vieira@email.com'),
('Rafael Barbosa', '90485673102', '1992-03-31', 'M', 'Graduado', 'rafael.barbosa@email.com'),
('Tatiana Leite', '57392048102', '1993-06-27', 'F', 'Mestre', 'tatiana.leite@email.com');
INSERT INTO Professor (nome, cpf, data_nascimento, sexo, titulação, email) 
VALUES
('Carlos Silva', '12345678900', '1980-05-10', 'M', NULL, 'carlos.silva@email.com'),
('Ana Oliveira', '23456789001', '1975-03-22', 'F', NULL, 'ana.oliveira@email.com'),
('Júlio Santos', '34567890102', '1990-12-15', 'M', NULL, 'julio.santos@email.com'),
('Mariana Costa', '45678901203', '1985-08-30', 'F', NULL, 'mariana.costa@email.com'),
('Felipe Almeida', '56789012304', '1992-01-25', 'M', NULL, 'felipe.almeida@email.com'),
('Luciana Martins', '67890123405', '1988-07-19', 'F', NULL, 'luciana.martins@email.com'),
('Ricardo Ferreira', '78901234506', '1983-11-02', 'M', NULL, 'ricardo.ferreira@email.com'),
('Fernanda Lima', '89012345607', '1995-02-14', 'F', NULL, 'fernanda.lima@email.com'),
('André Pereira', '90123456708', '1978-09-11', 'M', NULL, 'andre.pereira@email.com'),
('Tatiane Souza', '01234567890', '1986-06-20', 'F', NULL, 'tatiane.souza@email.com');
INSERT INTO Professor (nome, cpf, data_nascimento, sexo, titulação, email) 
VALUES
('Vinícius Nunes', '90123490123', '1999-12-14', 'M', 'Graduado', 'vinicius.nunes@email.com'),
('Larissa Duarte', '12332112332', '2000-05-22', 'F', 'Especialista', 'larissa.duarte@email.com'),
('Fernando Souza', '23443223443', '1996-09-09', 'M', 'Graduado', 'fernando.souza@email.com'),
('Sabrina Costa', '34554334554', '1995-03-17', 'F', 'Doutor', 'sabrina.costa@email.com'),
('Gustavo Santos', '45665445665', '2000-11-29', 'M', 'Graduado', 'gustavo.santos@email.com'),
('Rafaela Nunes', '56776556776', '1999-06-04', 'F', 'Doutor', 'rafaela.nunes@email.com');
INSERT INTO Periodo (data_inicio, data_fim) 
VALUES ('2023-04-13', '2023-08-13');
INSERT INTO Periodo (data_inicio, data_fim)
VALUES 
('2023-01-10', '2023-05-15'),
('2023-02-15', '2023-06-20'),
('2023-03-01', '2023-07-01'),
('2023-04-01', '2023-08-01'),
('2023-05-10', '2023-09-10'),
('2023-06-15', '2023-10-15'),
('2023-07-01', '2023-11-01'),
('2023-08-01', '2023-12-01'),
('2023-09-05', '2024-01-05'),
('2023-10-10', '2024-02-10'),
('2023-11-15', '2024-03-15'),
('2023-12-01', '2024-04-01'),
('2024-01-10', '2024-05-10'),
('2024-02-15', '2024-06-15'),
('2024-03-01', '2024-07-01'),
('2024-04-10', '2024-08-10'),
('2024-05-15', '2024-09-15'),
('2024-06-01', '2024-10-01'),
('2024-07-10', '2024-11-10'),
('2024-08-15', '2024-12-15'),
('2024-09-01', '2025-01-01'),
('2024-10-05', '2025-02-05'),
('2024-11-10', '2025-03-10'),
('2024-12-15', '2025-04-15'),
('2025-01-05', '2025-05-05'),
('2025-02-10', '2025-06-10'),
('2025-03-01', '2025-07-01'),
('2025-04-15', '2025-08-15'),
('2025-05-05', '2025-09-05'),
('2025-06-10', '2025-10-10'),
('2025-07-01', '2025-11-01'),
('2025-08-05', '2025-12-05'),
('2025-09-10', '2026-01-10'),
('2025-10-15', '2026-02-15'),
('2025-11-01', '2026-03-01'),
('2025-12-05', '2026-04-05'),
('2026-01-10', '2026-05-10'),
('2026-02-15', '2026-06-15'),
('2026-03-05', '2026-07-05'),
('2026-04-10', '2026-08-10'),
('2026-05-15', '2026-09-15'),
('2026-06-01', '2026-10-01'),
('2026-07-05', '2026-11-05'),
('2026-08-10', '2026-12-10'),
('2026-09-01', '2027-01-01'),
('2026-10-05', '2027-02-05'),
('2026-11-15', '2027-03-15'),
('2026-12-01', '2027-04-01'),
('2027-01-10', '2027-05-10'),
('2027-02-15', '2027-06-15');
INSERT INTO Periodo (data_inicio, data_fim) 
VALUES
('2022-01-10', '2022-06-15'),
('2022-02-05', '2022-07-10'),
('2022-03-01', '2022-08-20'),
('2021-11-15', '2022-04-30'),
('2021-09-10', '2022-02-25'),
('2022-05-20', '2022-12-15'),
('2021-12-01', '2022-06-30'),
('2020-08-15', '2021-12-05'),
('2020-11-25', '2021-05-15'),
('2021-07-01', '2021-12-20'),
('2020-06-10', '2020-11-30'),
('2022-04-18', '2022-09-20'),
('2020-09-05', '2021-03-15'),
('2021-05-01', '2021-10-10'),
('2020-02-20', '2020-07-05'),
('2020-12-15', '2021-07-15'),
('2021-04-25', '2021-09-30'),
('2020-07-12', '2020-12-10'),
('2021-01-15', '2021-06-20'),
('2020-03-05', '2020-08-30'),
('2021-06-15', '2021-11-25'),
('2021-02-10', '2021-07-30'),
('2020-10-30', '2021-05-10'),
('2020-05-15', '2020-10-20'),
('2021-08-01', '2022-01-31'),
('2020-04-11', '2020-09-15'),
('2022-03-15', '2022-08-15'),
('2021-10-05', '2022-03-10'),
('2020-12-20', '2021-06-05'),
('2021-03-25', '2021-09-05'),
('2021-11-10', '2022-03-20'),
('2020-01-01', '2020-06-30'),
('2022-02-15', '2022-07-15'),
('2021-09-20', '2022-02-05'),
('2020-08-01', '2020-12-31'),
('2021-12-15', '2022-06-01'),
('2021-01-05', '2021-05-30'),
('2020-02-05', '2020-07-01'),
('2020-11-01', '2021-03-30'),
('2021-04-20', '2021-10-15'),
('2020-09-10', '2021-01-10'),
('2021-12-10', '2022-05-20'),
('2020-07-15', '2020-11-01'),
('2021-05-10', '2021-09-25'),
('2021-10-15', '2022-04-01'),
('2022-01-15', '2022-06-10'),
('2021-08-25', '2021-12-25'),
('2020-10-20', '2021-04-15');

INSERT INTO curso (nome, valor, carga_horária, status, id_professor, id_período)
VALUES
('Desenvolvimento Web Completo', 2000.00, 120, 'Ativo', 1, 1),
('Análise de Dados com Python', 2200.00, 100, 'Ativo', 6, 2),
('Introdução a UX/UI Design', 1800.00, 80, 'Ativo', 7, 3),
('Machine Learning e IA', 3000.00, 150, 'Ativo', 8, 4),
('Gestão de Projetos Ágeis', 2500.00, 90, 'Ativo', 11, 5);

INSERT INTO Matricula (ra_aluno, id_curso, data_matricula, n1, n2, nf, resultado)
VALUES
('A123', 1, '2023-01-01', 7.0, 8.0, 7.5, 'Aprovado'),
('A234', 1, '2023-01-02', 6.5, 6.0, 6.25, 'Reprovado'),
('A003', 1, '2023-01-03', 8.5, 8.0, 8.25, 'Aprovado'),
('A004', 1, '2023-01-04', 7.0, 7.5, 7.25, 'Aprovado'),
('A005', 1, '2023-01-05', 9.0, 8.5, 8.75, 'Aprovado'),
('A006', 1, '2023-01-06', 6.0, 6.5, 6.25, 'Reprovado'),
('A007', 1, '2023-01-07', 8.0, 8.0, 8.0, 'Aprovado'),
('A008', 1, '2023-01-08', 7.5, 7.0, 7.25, 'Aprovado'),
('A009', 1, '2023-01-09', 5.0, 6.0, 5.5, 'Reprovado'),
('A010', 1, '2023-01-10', 8.5, 7.5, 8.0, 'Aprovado');

INSERT INTO Matricula (ra_aluno, id_curso, data_matricula, n1, n2, nf, resultado) 
VALUES
('A011', 2, '2023-02-01', 6.0, 7.0, 6.5, 'Aprovado'),
('A012', 2, '2023-02-02', 5.5, 5.0, 5.25, 'Reprovado'),
('A013', 2, '2023-02-03', 7.5, 7.0, 7.25, 'Aprovado'),
('A014', 2, '2023-02-04', 8.0, 7.5, 7.75, 'Aprovado'),
('A015', 2, '2023-02-05', 9.0, 9.5, 9.25, 'Aprovado'),
('A016', 2, '2023-02-06', 6.0, 6.5, 6.25, 'Reprovado'),
('A017', 2, '2023-02-07', 7.5, 7.0, 7.25, 'Aprovado'),
('A018', 2, '2023-02-08', 8.0, 7.5, 7.75, 'Aprovado'),
('A019', 2, '2023-02-09', 5.0, 6.0, 5.5, 'Reprovado'),
('A020', 2, '2023-02-10', 9.0, 8.5, 8.75, 'Aprovado');

INSERT INTO Matricula (ra_aluno, id_curso, data_matricula, n1, n2, nf, resultado) VALUES
('A021', 3, '2023-03-01', 8.0, 8.5, 8.25, 'Aprovado'),
('A022', 3, '2023-03-02', 6.0, 6.5, 6.25, 'Reprovado'),
('A023', 3, '2023-03-03', 7.5, 7.0, 7.25, 'Aprovado'),
('A024', 3, '2023-03-04', 8.5, 8.0, 8.25, 'Aprovado'),
('A025', 3, '2023-03-05', 9.0, 9.5, 9.25, 'Aprovado'),
('A026', 3, '2023-03-06', 6.0, 7.0, 6.5, 'Aprovado'),
('A027', 3, '2023-03-07', 7.0, 7.5, 7.25, 'Aprovado'),
('A028', 3, '2023-03-08', 5.5, 6.0, 5.75, 'Reprovado'),
('A029', 3, '2023-03-09', 8.0, 8.0, 8.0, 'Aprovado'),
('A030', 3, '2023-03-10', 7.0, 7.5, 7.25, 'Aprovado');

INSERT INTO Matricula (ra_aluno, id_curso, data_matricula, n1, n2, nf, resultado) VALUES
('A031', 4, '2023-04-01', 9.0, 9.5, 9.25, 'Aprovado'),
('A032', 4, '2023-04-02', 6.0, 6.5, 6.25, 'Reprovado'),
('A033', 4, '2023-04-03', 7.5, 7.0, 7.25, 'Aprovado'),
('A034', 4, '2023-04-04', 8.0, 8.5, 8.25, 'Aprovado'),
('A035', 4, '2023-04-05', 9.0, 9.5, 9.25, 'Aprovado'),
('A036', 4, '2023-04-06', 6.0, 7.0, 6.5, 'Aprovado'),
('A037', 4, '2023-04-07', 7.0, 7.5, 7.25, 'Aprovado'),
('A038', 4, '2023-04-08', 5.5, 6.0, 5.75, 'Reprovado'),
('A039', 4, '2023-04-09', 8.0, 8.0, 8.0, 'Aprovado'),
('A040', 4, '2023-04-10', 7.0, 7.5, 7.25, 'Aprovado');

INSERT INTO Matricula (ra_aluno, id_curso, data_matricula, n1, n2, nf, resultado) VALUES
('A041', 5, '2023-05-01', 8.0, 8.5, 8.25, 'Aprovado'),
('A042', 5, '2023-05-02', 6.0, 6.5, 6.25, 'Reprovado'),
('A043', 5, '2023-05-03', 7.5, 7.0, 7.25, 'Aprovado'),
('A044', 5, '2023-05-04', 8.5, 8.0, 8.25, 'Aprovado'),
('A045', 5, '2023-05-05', 9.0, 9.5, 9.25, 'Aprovado'),
('A046', 5, '2023-05-06', 6.0, 7.0, 6.5, 'Aprovado'),
('A047', 5, '2023-05-07', 7.0, 7.5, 7.25, 'Aprovado'),
('A048', 5, '2023-05-08', 5.5, 6.0, 5.75, 'Reprovado'),
('A049', 5, '2023-05-09', 8.0, 8.0, 8.0, 'Aprovado'),
('A050', 5, '2023-05-10', 7.0, 7.5, 7.25, 'Aprovado');

UPDATE Professor
SET titulação = 'Mestrado'
WHERE titulação = 'Mestre';

DELETE FROM Periodo
WHERE data_inicio < '2023-01-01';

SELECT ra, nome, email
FROM Aluno
WHERE sexo = 'F'
ORDER BY nome;

SELECT *
FROM Professor
WHERE titulação IS NULL;

SELECT
  a.ra,
  a.nome,
  a.cpf,
  m.data_matricula,
  c.nome,
  c.carga_horária
FROM
  aluno a
  JOIN matricula m ON a.ra = m.ra_aluno
  JOIN curso c ON m.id_curso = c.id
WHERE
  c.nome = 'Desenvolvimento Web Completo';

SELECT
  c.nome,
  c.carga_horária,
  c.valor,
  p.nome,
  p.titulação
FROM
  curso c
  JOIN professor p ON p.id = c.id_professor
  JOIN periodo r ON r.id = c.id_período
  WHERE
  r.data_inicio >= '2023-01-10' AND r.data_fim <= '2023-07-01';

SELECT
	a.nome,
	a.email,
	p.nome
FROM
	aluno a 
	JOIN matricula m ON m.ra_aluno  = a.ra
	JOIN curso c ON c.id = m.id_curso
	JOIN professor p ON c.id_professor = p.id
	WHERE
	p.nome = 'João Pereira'; 

SELECT
	a.ra,
	a.nome,
	a.cpf,
	c.nome,
	m.nf,
	m.resultado
FROM
	aluno a
	JOIN matricula m ON a.ra = m.ra_aluno
	JOIN curso c ON m.id_curso = c.id	
	WHERE 
	m.resultado = 'Aprovado' and c.nome = 'Desenvolvimento Web Completo';


SELECT
	c.id,
	c.nome,
	COUNT(a.ra) AS total_alunos
FROM curso c
JOIN matricula m ON m.id_curso = c.id
JOIN aluno a ON a.ra = m.ra_aluno
JOIN periodo pe ON pe.id = c.id_período
  

	WHERE 
	c.nome = 'Desenvolvimento Web Completo' and  pe.data_inicio >= '2023-04-13' AND pe.data_fim <= '2023-08-13'
	GROUP BY c.id, c.nome; 
	
SELECT valor FROM curso WHERE valor IN ((SELECT max(valor) FROM curso), (SELECT min(valor) FROM curso))
UNION ALL
SELECT PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY valor) FROM curso
ORDER BY valor; 

SELECT c.valor * (COUNT(a.ra)) AS ticket_medio , c.nome
from curso c
join matricula m on m.id_curso = c.id
join aluno a on a.ra = m.ra_aluno
join periodo pe on pe.id = c.id_período
WHERE pe.data_inicio >= '2023-01-10' and pe.data_fim <= '2023-08-01'	
GROUP BY c.nome , c.valor
ORDER BY ticket_medio ASC;

SELECT p.* FROM professor p
WHERE p.id NOT IN (SELECT p2.id FROM professor p2 JOIN aluno a ON p2.cpf = a.cpf);

WITH valor_medio AS (
    SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY valor) AS val_medio
    FROM curso
)
SELECT COUNT(a.ra) as qtd_alunos_masc
FROM aluno a
JOIN matricula m ON m.ra_aluno = a.ra
JOIN curso c ON m.id_curso = c.id
JOIN valor_medio vm ON c.valor > vm.val_medio
WHERE a.sexo = 'M'
UNION ALL
SELECT COUNT(a.ra) as qtd_alunos_fem
FROM aluno a
JOIN matricula m ON m.ra_aluno = a.ra
JOIN curso c ON m.id_curso = c.id
JOIN valor_medio vm ON c.valor > vm.val_medio
WHERE a.sexo = 'F';

