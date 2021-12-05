-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema hotel
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hotel
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hotel` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema lab_schema
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lab_schema
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lab_schema` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `hotel` ;

-- -----------------------------------------------------
-- Table `hotel`.`Roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`Roles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `role` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel`.`UserInformation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`UserInformation` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `surname` VARCHAR(45) NULL,
  `phone` VARCHAR(15) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`Users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(50) NOT NULL,
  `password` VARCHAR(50) NOT NULL,
  `role_id` INT NOT NULL,
  `userInformation_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Users_Roles_idx` (`role_id` ASC) VISIBLE,
  INDEX `fk_Users_UserInformation1_idx` (`userInformation_id` ASC) VISIBLE,
  CONSTRAINT `fk_Users_Roles`
    FOREIGN KEY (`role_id`)
    REFERENCES `hotel`.`Roles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Users_UserInformation1`
    FOREIGN KEY (`userInformation_id`)
    REFERENCES `hotel`.`UserInformation` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel`.`Apartments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`Apartments` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(15) NOT NULL,
  `number_of_rooms` INT NOT NULL,
  `apartment_number` INT NOT NULL,
  `type` VARCHAR(15) NOT NULL,
  `number_of_beds` INT NOT NULL,
  `price` DOUBLE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel`.`UserOrders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`UserOrders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(15) NOT NULL,
  `start_time` DATETIME NOT NULL,
  `lease_duration` INT NOT NULL,
  `user_id` INT NOT NULL,
  `apartment_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_UserOrders_Users1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_UserOrders_Apartments1_idx` (`apartment_id` ASC) VISIBLE,
  CONSTRAINT `fk_UserOrders_Users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `hotel`.`Users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_UserOrders_Apartments1`
    FOREIGN KEY (`apartment_id`)
    REFERENCES `hotel`.`Apartments` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `lab_schema` ;

-- -----------------------------------------------------
-- Table `lab_schema`.`apartments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_schema`.`apartments` (
  `Id` INT NOT NULL,
  `number` INT NOT NULL,
  `price` DOUBLE NOT NULL,
  `rooms_number` INT NOT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `lab_schema`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_schema`.`roles` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `lab_schema`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_schema`.`users` (
  `id` INT NOT NULL,
  `login` VARCHAR(45) NOT NULL,
  `password_hash` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(15) NOT NULL,
  `role_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `User_Role_idx` (`role_id` ASC) VISIBLE,
  CONSTRAINT `User_Role`
    FOREIGN KEY (`role_id`)
    REFERENCES `lab_schema`.`roles` (`Id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `lab_schema`.`userorders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_schema`.`userorders` (
  `Id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `apartment_id` INT NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `start_time` DATETIME NOT NULL,
  `end_time` DATETIME NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `Order_User_idx` (`user_id` ASC) VISIBLE,
  INDEX `Order_Apartment_idx` (`apartment_id` ASC) VISIBLE,
  CONSTRAINT `Order_Apartment`
    FOREIGN KEY (`apartment_id`)
    REFERENCES `lab_schema`.`apartments` (`Id`),
  CONSTRAINT `Order_User`
    FOREIGN KEY (`user_id`)
    REFERENCES `lab_schema`.`users` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
