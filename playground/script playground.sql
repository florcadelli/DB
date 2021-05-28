CREATE DATABASE playground;

USE playground;

CREATE TABLE `playground`.`categoria` (
  `idCategoria` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idCategoria`));
  
  CREATE TABLE `playground`.`usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `apellido` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `categoria` INT,
  PRIMARY KEY (`idUsuario`),
    CONSTRAINT `FKcategoria_usuario`
    FOREIGN KEY (`categoria`)
    REFERENCES `playground`.`categoria` (`idCategoria`)
);

CREATE TABLE `playground`.`carrera` (
  `idCarrera` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(100) NOT NULL,
  `descripcion` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idCarrera`));
  
    
  CREATE TABLE `playground`.`usuarios_carrera` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuario`INT,
  `carrera`INT,
  PRIMARY KEY (`id`),
    CONSTRAINT `FKusuarios`
    FOREIGN KEY (`usuario`)
    REFERENCES `playground`.`usuario` (`idUsuario`),
    CONSTRAINT `FKcarrera`
    FOREIGN KEY (`carrera`)
    REFERENCES `playground`.`carrera` (`idCarrera`)
);