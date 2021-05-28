CREATE DATABASE UNIVERSO_LECTOR;

USE UNIVERSO_LECTOR;

CREATE TABLE `universo_lector`.`socio` (
  `Codigo` INT NOT NULL AUTO_INCREMENT,
  `DNI` INT NOT NULL,
  `Apellido` VARCHAR(100) NOT NULL,
  `Nombres` VARCHAR(100) NOT NULL,
  `Direccion` VARCHAR(200) NULL,
  `Localidad` VARCHAR(100) NULL,
  PRIMARY KEY (`Codigo`));

CREATE TABLE `universo_lector`.`editorial` (
  `Codigo` INT NOT NULL AUTO_INCREMENT,
  `Razon_Social` VARCHAR(100) NOT NULL,
  `Telefono` VARCHAR(100) NULL,
  PRIMARY KEY (`Codigo`));
CREATE TABLE `universo_lector`.`autor` (
  `Codigo` INT NOT NULL AUTO_INCREMENT,
  `Apellido` VARCHAR(100) NULL,
  `Nombre` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`Codigo`));

CREATE TABLE `universo_lector`.`telefonoxsocio` (
  `Codigo` INT NOT NULL AUTO_INCREMENT,
  `NroTelefono` VARCHAR(100) NOT NULL,
  `Codigo_socio` INT NULL,
  PRIMARY KEY (`Codigo`),
  INDEX `FKSocioTelefono_idx` (`Codigo_socio` ASC) VISIBLE,
  CONSTRAINT `FKSocioTelefono`
    FOREIGN KEY (`Codigo_socio`)
    REFERENCES `universo_lector`.`socio` (`Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
COMMENT = '			';


CREATE TABLE `universo_lector`.`libro` (
  `Codigo` INT NOT NULL AUTO_INCREMENT,
  `ISBN` VARCHAR(13) NOT NULL,
  `Titulo` VARCHAR(200) NOT NULL,
  `Anio_Escritura` DATE NULL,
  `Codigo_autor` INT NULL,
  `Anio_Edicion` DATE NULL,
  `Codigo_Editorial` INT NULL,
  PRIMARY KEY (`Codigo`),
  INDEX `AutorLibro_idx` (`Codigo_autor` ASC) VISIBLE,
  INDEX `EditorialLibro_idx` (`Codigo_Editorial` ASC) VISIBLE,
  CONSTRAINT `AutorLibro`
    FOREIGN KEY (`Codigo_autor`)
    REFERENCES `universo_lector`.`autor` (`Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `EditorialLibro`
    FOREIGN KEY (`Codigo_Editorial`)
    REFERENCES `universo_lector`.`editorial` (`Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE `universo_lector`.`prestamo` (
  `Codigo` INT NOT NULL AUTO_INCREMENT,
  `Codigo_socio` INT NOT NULL,
  `Fecha` DATETIME NULL,
  `fecha_devolucion` DATE NULL,
  `Fecha_Tope` DATE NULL,
  PRIMARY KEY (`Codigo`),
  INDEX `SocioPrestamo_idx` (`Codigo_socio` ASC) VISIBLE,
  CONSTRAINT `SocioPrestamo`
    FOREIGN KEY (`Codigo_socio`)
    REFERENCES `universo_lector`.`socio` (`Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE `universo_lector`.`volumen` (
  `Codigo` INT NOT NULL,
  `Codigo_Libro` INT NULL,
  `Deteriorado` TINYINT NULL,
  PRIMARY KEY (`Codigo`),
  INDEX `FKLibro_volumen_idx` (`Codigo_Libro` ASC) VISIBLE,
  CONSTRAINT `FKLibro_volumen`
    FOREIGN KEY (`Codigo_Libro`)
    REFERENCES `universo_lector`.`libro` (`Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
COMMENT = '		';

CREATE TABLE `universo_lector`.`prestamosxvolumen` (
  `Codigo` INT NOT NULL,
  `Codigo_Prestamo` INT NOT NULL,
  `Codigo_Volumen` INT NOT NULL,
  PRIMARY KEY (`Codigo`),
  INDEX `FKPrestamo_Volumen_idx` (`Codigo_Prestamo` ASC) VISIBLE,
  INDEX `FkVolumen_Volumen_idx` (`Codigo_Volumen` ASC) VISIBLE,
  CONSTRAINT `FKPrestamo_Prestamo`
    FOREIGN KEY (`Codigo_Prestamo`)
    REFERENCES `universo_lector`.`volumen` (`Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FkVolumen_Volumen`
    FOREIGN KEY (`Codigo_Volumen`)
    REFERENCES `universo_lector`.`prestamo` (`Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

