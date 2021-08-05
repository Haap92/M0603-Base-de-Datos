SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema m06e03-entrega
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema m06e03-entrega
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `m06e03-entrega` DEFAULT CHARACTER SET utf8 ;
USE `m06e03-entrega` ;

-- -----------------------------------------------------
-- Table `m06e03-entrega`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `m06e03-entrega`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `m06e03-entrega`.`notes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `m06e03-entrega`.`notes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `createdAt` INT NULL,
  `updatedAt` INT NULL,
  `description` LONGTEXT NOT NULL,
  `users_id` INT NOT NULL,
  PRIMARY KEY (`id`, `users_id`),
  INDEX `fk_notes_users_idx` (`users_id` ASC),
  CONSTRAINT `fk_notes_users`
    FOREIGN KEY (`users_id`)
    REFERENCES `m06e03-entrega`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `m06e03-entrega`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `m06e03-entrega`.`categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `notes_id` INT NOT NULL,
  `notes_users_id` INT NOT NULL,
  PRIMARY KEY (`id`, `notes_id`, `notes_users_id`),
  INDEX `fk_categories_notes1_idx` (`notes_id` ASC, `notes_users_id` ASC),
  CONSTRAINT `fk_categories_notes1`
    FOREIGN KEY (`notes_id` , `notes_users_id`)
    REFERENCES `m06e03-entrega`.`notes` (`id` , `users_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Schema m06e03-entrega - Insertando Datos en User
-- -----------------------------------------------------
 INSERT INTO users (id, name, email) 
    VALUES (DEFAULT, 'Kelly', 'kelly@gmail.com'),
    (DEFAULT, 'John', 'john@gmail.com'),
    (DEFAULT, 'Sam', 'sam@gmail.com'),
    (DEFAULT, 'Tina', 'tina@gmail.com'),
    (DEFAULT, 'Gaby', 'gaby@gmail.com'),
    (DEFAULT, 'Ana', 'ana@gmail.com'),
    (DEFAULT, 'Rosas44', 'josevicente@gmail.com'),
    (DEFAULT, 'Jean', 'jean@gmail.com'),
    (DEFAULT, 'Rosas44', 'josevicente@gmail.com'),
    (DEFAULT, 'Ramos', 'mejias@gmail.com');
    

-- -------------------------------------------------------
-- Schema m06e03-entrega - Insertando Datos en Categorias
-- -------------------------------------------------------
INSERT INTO categories (id, name, notes_id, notes_users_id) 
    VALUES (DEFAULT, 'Drama', 1, 1),
	(DEFAULT, 'Mas Drama', 2, 2),
        (DEFAULT, 'Mucho mas Drama', 3, 3),
	(DEFAULT, 'El peor de los Dramas', 4, 4),
        (DEFAULT, 'Autoayuda', 5, 5),
	(DEFAULT, 'Contenido Web', 6, 6),
        (DEFAULT, 'Dudas', 7, 7),
	(DEFAULT, 'Filosofando', 8, 8),
        (DEFAULT, 'Cuentos', 9, 9),
	(DEFAULT, 'Chismes', 10, 10);

-- -------------------------------------------------------
-- Schema m06e03-entrega - Insertando Datos en Notes
-- -------------------------------------------------------    
        
	INSERT INTO notes (id, title, createdAt, updatedAt, description, users_id) 
    VALUES (DEFAULT, 'Ternuras', '20210805', '20210805', 'Primera Entrada', 10),
    (DEFAULT, 'Locuras', '20210805', '20210805', 'Segunda Entrada', 9),
    (DEFAULT, 'Frituras', '20210805', '20210805', 'Tercera Entrada', 8),
    (DEFAULT, 'Atomicos', '20210805', '20210805', 'Cuarta Entrada', 7),
    (DEFAULT, 'Platillos Voladores', '20210805', '20210805', 'Quinta Entrada', 6),
    (DEFAULT, 'Verde', '20210805', '20210805', 'Sexta Entrada', 5),
    (DEFAULT, 'Algo Rojo', '20210805', '20210805', 'Septima Entrada', 4),
    (DEFAULT, 'Programando Ando', '20210805', '20210805', 'Octava Entrada', 3),
    (DEFAULT, 'Base de Datos Andando', '20210805', '20210805', 'Novena Entrada', 2),
    (DEFAULT, 'Se acabooooo', '20210805', '20210805', 'Decima Entrada', 1);