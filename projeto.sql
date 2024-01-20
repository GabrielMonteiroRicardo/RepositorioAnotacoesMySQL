CREATE DATABASE aula;

USE aula;

CREATE TABLE usuario (
    idusuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30),
    login VARCHAR(30),
    senha VARCHAR(100)
);

CREATE TABLE bkp_usuario (
    idbackup INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    nome VARCHAR(30),
    login VARCHAR(39)
);

DELIMITER $
CREATE TRIGGER backup_user
BEFORE DELETE ON usuario
FOR EACH ROW
BEGIN

INSERT INTO bkp_usuario VALUES (NULL,OLD.idusuario, OLD.nome, OLD.login);

END
$

INSERT INTO usuario (nome, login, senha) VALUES
    ('João Silva', 'joao123', 'senha123'),
    ('Maria Oliveira', 'maria456', 'senha456'),
    ('Carlos Santos', 'carlos789', 'senha789'),
    ('Ana Pereira', 'ana101', 'senha101'),
    ('Ricardo Lima', 'ricardo2022', 'senha2022'),
    ('Fernanda Costa', 'fernanda33', 'senha33'),
    ('Lucas Mendes', 'lucas777', 'senha777'),
    ('Patrícia Vieira', 'patricia55', 'senha55'),
    ('Roberto Oliveira', 'roberto999', 'senha999'),
    ('Cristina Silva', 'cristina222', 'senha222');

SELECT * FROM usuario;

DELETE FROM usuario WHERE idusuario = 1;

SELECT * FROM bkp_usuario;