CREATE DATABASE IF NOT EXISTS rpg_online;
USE rpg_online;

SELECT DATABASE();

CREATE TABLE USUARIOS (
    UsuarioId INT AUTO_INCREMENT PRIMARY KEY,
    Email VARCHAR(120) NOT NULL UNIQUE,
    Senha VARCHAR(255) NOT NULL
);

CREATE TABLE CLASSES (
    ClasseId INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(80) NOT NULL UNIQUE,
    Descricao VARCHAR(255)f
);

CREATE TABLE HABILIDADES (
    HabilidadeId INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE PERSONAGENS (
    PersonagemId INT AUTO_INCREMENT PRIMARY KEY,
    NomePersonagem VARCHAR(80) NOT NULL,
    UsuarioId INT NOT NULL,
    ClasseId INT NOT NULL,
    CONSTRAINT fk_personagens_usuarios
        FOREIGN KEY (UsuarioId) REFERENCES USUARIOS(UsuarioId),
    CONSTRAINT fk_personagens_classes
        FOREIGN KEY (ClasseId) REFERENCES CLASSES(ClasseId)
);

CREATE TABLE CLASSES_HABILIDADES (
    ClasseId INT NOT NULL,
    HabilidadeId INT NOT NULL,
    PRIMARY KEY (ClasseId, HabilidadeId),
    CONSTRAINT fk_classes_habilidades_classes
        FOREIGN KEY (ClasseId) REFERENCES CLASSES(ClasseId),
    CONSTRAINT fk_classes_habilidades_habilidades
        FOREIGN KEY (HabilidadeId) REFERENCES HABILIDADES(HabilidadeId)
);

SHOW TABLES;