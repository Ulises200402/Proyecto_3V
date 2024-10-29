SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Viajes
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Viajes` DEFAULT CHARACTER SET utf8 ;
USE `Viajes` ;

-- -----------------------------------------------------
-- Table `Viajes`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Viajes`.`user` (
  `iduser` INT NOT NULL AUTO_INCREMENT,
  `Gmail` VARCHAR(100) NULL,
  `password` VARCHAR(100) NULL,
  `username` VARCHAR(100) NULL,
  PRIMARY KEY (`iduser`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Viajes`.`Micros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Viajes`.`Micros` (
  `idMicros` INT NOT NULL AUTO_INCREMENT,
  `Numero_asientos` INT NULL,
  `Modelo` VARCHAR(45) NULL,
  `Patente` VARCHAR(20) NULL,
  `Marca` VARCHAR(50) NULL,
  PRIMARY KEY (`idMicros`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Viajes`.`Choferes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Viajes`.`Choferes` (
  `idChoferes` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(100) NULL,
  `Apellido` VARCHAR(100) NULL,
  `Telefono` VARCHAR(20) NULL,
  `DNI` VARCHAR(20) NULL,
  PRIMARY KEY (`idChoferes`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Viajes`.`Viaje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Viajes`.`Viaje` (
  `idViaje` INT NOT NULL AUTO_INCREMENT,
  `Destino` VARCHAR(45) NULL,
  `origen` VARCHAR(45) NULL,
  `fecha_salida` DATE NULL,
  `hora_salida` TIME NULL,
  `Precio_pasajero` DECIMAL(10,2) NULL,
  `idMicros` INT NOT NULL,
  `idChoferes` INT NOT NULL,
  PRIMARY KEY (`idViaje`),
  CONSTRAINT `fk_Micros_Viaje`
    FOREIGN KEY (`idMicros`)
    REFERENCES `Viajes`.`Micros` (`idMicros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Choferes_Viaje`
    FOREIGN KEY (`idChoferes`)
    REFERENCES `Viajes`.`Choferes` (`idChoferes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Viajes`.`Reservas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Viajes`.`Reservas` (
  `idReservas` INT NOT NULL AUTO_INCREMENT,
  `Asiento` INT NULL,
  `nombre` VARCHAR(255) NOT NULL,
  `Fecha de Ida` DATE NOT NULL,
  `Fecha de Vuelta` DATE NOT NULL;
  `idUsuario` INT NOT NULL,
  `idViaje` INT NOT NULL,
  PRIMARY KEY (`idReservas`),
  CONSTRAINT `fk_Usuario_Reservas`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `Viajes`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Viaje_Reservas`
    FOREIGN KEY (`idViaje`)
    REFERENCES `Viajes`.`Viaje` (`idViaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- Restaurar configuraciones anteriores
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


--añadir provincias
CREATE TABLE IF NOT EXISTS Lugares (
  idLugar INT NOT NULL AUTO_INCREMENT,
  lugarDestino VARCHAR(100) NOT NULL,
  lugarOrigen VARCHAR(100) NOT NULL,
  PRIMARY KEY (idLugar)
);

INSERT INTO Lugares (lugarDestino, lugarOrigen) VALUES 
('Buenos Aires'), 
('Catamarca'), 
('Chaco'), 
('Chubut'), 
('CABA'), 
('Córdoba'), 
('Corrientes'), 
('Entre Ríos'), 
('Formosa'), 
('Jujuy'), 
('La Pampa'), 
('La Rioja'), 
('Mendoza'), 
('Misiones'), 
('Neuquén'), 
('Río Negro'), 
('Salta'), 
('San Juan'), 
('San Luis'), 
('Santa Cruz'), 
('Santa Fe'), 
('Santiago del Estero'), 
('Tierra del Fuego'), 
('Tucumán');