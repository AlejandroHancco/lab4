-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema flores
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `flores` ;

CREATE SCHEMA IF NOT EXISTS `flores` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `flores` ;

-- -----------------------------------------------------
-- Table `flores`.`color`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `flores`.`color` ;

CREATE TABLE IF NOT EXISTS `flores`.`color` (
  `idcolor` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcolor`))
ENGINE = InnoDB;

INSERT INTO `flores`.`color` (`idcolor`, `nombre`) VALUES
(1, 'Rojo'),
(2, 'Verde'),
(3, 'Azul'),
(4, 'Blanco'),
(5, 'Amarillo');

-- -----------------------------------------------------
-- Table `flores`.`ocasion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `flores`.`ocasion` ;

CREATE TABLE IF NOT EXISTS `flores`.`ocasion` (
  `idocasion` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idocasion`))
ENGINE = InnoDB;

INSERT INTO `flores`.`ocasion` (`idocasion`, `nombre`) VALUES
(1, 'Primavera'),
(2, 'San Valentín'),
(3, 'Aniversario'),
(4, 'Día de la Amistad'),
(5, 'Condolencias'),
(6, 'Día de la Madre');

-- -----------------------------------------------------
-- Table `flores`.`tipo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `flores`.`tipo` ;

CREATE TABLE IF NOT EXISTS `flores`.`tipo` (
  `idtipo` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idtipo`))
ENGINE = InnoDB;

INSERT INTO `flores`.`tipo` (`idtipo`, `nombre`) VALUES
(1, 'Rosa'),
(2, 'Clavel'),
(3, 'Hortensia'),
(4, 'Girasol'),
(5, 'Tulipán');

-- -----------------------------------------------------
-- Table `flores`.`flores`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `flores`.`flores`;
-- Crear la tabla de flores
CREATE TABLE IF NOT EXISTS `flores`.`flores` (
  `idflores` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,  
  `descripcion` VARCHAR(45) NULL,
  `precio` DECIMAL NULL,
  `cantidad` INT NOT NULL,  -- Columna para la cantidad
  `color_idcolor` INT NOT NULL,
  `id_ocasion` INT NOT NULL,  -- Cambiado el nombre de la columna
  `tipo_idtipo` INT NOT NULL,
  `imagen_url` VARCHAR(255) NULL, -- Nueva columna para la URL de la imagen
  PRIMARY KEY (`idflores`),
  INDEX `fk_flores_color_idx` (`color_idcolor` ASC),
  INDEX `fk_flores_ocasion1_idx` (`id_ocasion` ASC),
  INDEX `fk_flores_tipo1_idx` (`tipo_idtipo` ASC),
  CONSTRAINT `fk_flores_color`
    FOREIGN KEY (`color_idcolor`)
    REFERENCES `flores`.`color` (`idcolor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_flores_ocasion1`
    FOREIGN KEY (`id_ocasion`)
    REFERENCES `flores`.`ocasion` (`idocasion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_flores_tipo1`
    FOREIGN KEY (`tipo_idtipo`)
    REFERENCES `flores`.`tipo` (`idtipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- Insertar registros con URLs de imagen
INSERT INTO `flores`.`flores` (`idflores`, `nombre`, `descripcion`, `precio`, `cantidad`, `color_idcolor`, `id_ocasion`, `tipo_idtipo`, `imagen_url`) VALUES
(1, 'Rosa Roja', 'Una rosa roja perfecta para el amor', 15.00, 10, 1, 2, 1, 'https://cdn.pixabay.com/photo/2023/01/09/22/17/ai-generated-7708417_1280.jpg'),
(2, 'Clavel Blanco', 'Clavel blanco para momentos solemnes', 10.00, 5, 4, 5, 2, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIRNPOwqziThCtvwWlxu0qM02idpSQxAhGyA&s'),
(3, 'Girasol Amarillo', 'Hermoso girasol amarillo', 12.50, 8, 5, 1, 4, 'https://static.wixstatic.com/media/4373be_a3e89186ca6741eb81d5ba02bff64098~mv2_d_2908_2909_s_4_2.jpg/v1/fill/w_520,h_520,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/4373be_a3e89186ca6741eb81d5ba02bff64098~mv2_d_2908_2909_s_4_2.jpg'),
(4, 'Tulipán Azul', 'Tulipán azul elegante', 20.00, 6, 3, 3, 5, 'https://i.pinimg.com/originals/52/d5/f4/52d5f4f0f6eba7de0f9d76c19b2badab.jpg'),
(5, 'Hortensia Verde', 'Hortensia verde brillante', 18.00, 4, 2, 6, 3, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSuvOnL7maAoEUjl6OujFfjh4EHqZ_W2rDZng&s'),
(6, 'Rosa Blanca', 'Rosa blanca simbolizando pureza', 17.00, 12, 4, 3, 1, 'https://i.pinimg.com/originals/70/ba/14/70ba142f0cba606b5916d1d3dcbc9ced.jpg'),
(7, 'Clavel Rojo', 'Clavel rojo para amigos cercanos', 11.00, 15, 1, 4, 2, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOjN9UmeIZMsMASssg3atrhauPr3MfQukYMg&s'),
(8, 'Girasol Blanco', 'Girasol blanco especial para la primavera', 13.50, 9, 4, 1, 4, 'https://entresemillas.com/3446-large_default/girasol-blanco-semillas.jpg');

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
