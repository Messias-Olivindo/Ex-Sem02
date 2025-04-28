-- CRIAR TABELAS
CREATE TABLE alunos (
  id SERIAL PRIMARY KEY,
  nome TEXT NOT NULL,
  turma TEXT NOT NULL,
  curso TEXT NOT NULL
);

CREATE TABLE cursos (
  id SERIAL PRIMARY KEY,
  nome TEXT NOT NULL,
  duracao_anos INT NOT NULL
);

CREATE TABLE matriculas (
  id SERIAL PRIMARY KEY,
  aluno_id INT REFERENCES alunos(id) ON DELETE CASCADE,
  curso_id INT REFERENCES cursos(id) ON DELETE CASCADE
);

-- INSERIR DADOS
INSERT INTO alunos(nome, turma, curso)
VALUES ('Hugo Montan', 'T15', 'ADM TECH'),
   ('Diego Figueiredo', 'T15', 'Ciências da Computação'),
   ('Thulio Bacco', 'T15', 'Ciências da Computação'),
   ('Gabriel', 'T15', 'Ciências da Computação'),
   ('Eduardo Santanna', 'T15', 'Engenharia da Computação'),
   ('Leandro Filho', 'T15', 'Engenharia da Computação'),
   ('Lívia Cavalcanti', 'T15', 'Sistema da Informação'),
   ('Rafael Cabral', 'T15', 'Engenharia da Computação'),
   ('Maria Arielly', 'T15', 'Engenharia de Software'),
   ('Lorena Gabriela', 'T15', 'ADM TECH');

INSERT INTO cursos(nome, duracao_anos)
VALUES ('Ciências da Computação', 4),
  ('Engenharia da Computação', 4),
  ('Sistema da Informação', 4),
  ('ADM TECH', 4),
  ('Engenharia de Sofware', 4);

INSERT INTO matriculas(aluno_id, curso_id)
VALUES (1, 4),
  (2, 1),
  (3, 1),
  (4, 1),
  (5, 2),
  (6, 2),
  (7, 3),
  (8, 2),
  (9, 5),
  (10, 4);

SELECT a.nome AS aluno, c.nome AS curso
FROM matriculas m
JOIN alunos a ON m.aluno_id = a.id
JOIN cursos c ON m.curso_id = c.id;
