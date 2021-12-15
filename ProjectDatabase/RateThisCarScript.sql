-- MySQL Script generated by MySQL Workbench
-- Sun Dec 12 18:16:06 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema RateThisCarDB
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `RateThisCarDB` ;

-- -----------------------------------------------------
-- Schema RateThisCarDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `RateThisCarDB` DEFAULT CHARACTER SET utf8 ;
USE `RateThisCarDB` ;

-- -----------------------------------------------------
-- Table `RateThisCarDB`.`producer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RateThisCarDB`.`producer` ;

CREATE TABLE IF NOT EXISTS `RateThisCarDB`.`producer` (
  `idproducer` INT NOT NULL,
  `ProducerName` VARCHAR(45) NOT NULL,
  `ProducerCountry` VARCHAR(45) NOT NULL,
  `ProducerDescription` TEXT NULL,
  PRIMARY KEY (`idproducer`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RateThisCarDB`.`vehicle`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RateThisCarDB`.`vehicle` ;

CREATE TABLE IF NOT EXISTS `RateThisCarDB`.`vehicle` (
  `idvehicle` INT NOT NULL,
  `VehicleType` VARCHAR(45) NOT NULL,
  `VehicleName` VARCHAR(60) NOT NULL,
  `VehiclePower` VARCHAR(10) NULL,
  `VehicleEngCap` VARCHAR(20) NULL,
  `VehicleTransmission` VARCHAR(20) NULL,
  `VehicleFuel` VARCHAR(15) NULL,
  `VehicleYear` SMALLINT NULL,
  `VehiclePrice` DOUBLE NULL,
  `VehicleImage` VARCHAR(80) NULL,
  `producer_idproducer` INT NOT NULL,
  PRIMARY KEY (`idvehicle`),
  INDEX `fk_vehicle_producer1_idx` (`producer_idproducer` ASC) ,
  CONSTRAINT `fk_vehicle_producer1`
    FOREIGN KEY (`producer_idproducer`)
    REFERENCES `RateThisCarDB`.`producer` (`idproducer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RateThisCarDB`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RateThisCarDB`.`user` ;

CREATE TABLE IF NOT EXISTS `RateThisCarDB`.`user` (
  `iduser` INT NOT NULL,
  `UserName` VARCHAR(15) NOT NULL,
  `Email` VARCHAR(50) NOT NULL,
  `Password` VARCHAR(80) NOT NULL,
  `Role` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`iduser`),
  UNIQUE INDEX `UserName_UNIQUE` (`UserName` ASC) ,
  UNIQUE INDEX `Email_UNIQUE` (`Email` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RateThisCarDB`.`user_rates_vehicle`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RateThisCarDB`.`user_rates_vehicle` ;

CREATE TABLE IF NOT EXISTS `RateThisCarDB`.`user_rates_vehicle` (
  `iduser_rates` INT NOT NULL,
  `vehicle_idvehicle` INT NOT NULL,
  `user_iduser` INT NOT NULL,
  `RateOverall` DOUBLE NOT NULL,
  `Comment` TEXT NULL,
  `RateComfort` DOUBLE NULL,
  `RatePerformance` DOUBLE NULL,
  `RateExteriorStyling` DOUBLE NULL,
  `RateReliability` DOUBLE NULL,
  INDEX `fk_vehicle_has_user_user1_idx` (`user_iduser` ASC),
  INDEX `fk_vehicle_has_user_vehicle_idx` (`vehicle_idvehicle` ASC),
  PRIMARY KEY (`iduser_rates`),
  CONSTRAINT `fk_vehicle_has_user_vehicle`
    FOREIGN KEY (`vehicle_idvehicle`)
    REFERENCES `RateThisCarDB`.`vehicle` (`idvehicle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vehicle_has_user_user1`
    FOREIGN KEY (`user_iduser`)
    REFERENCES `RateThisCarDB`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RateThisCarDB`.`car`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RateThisCarDB`.`car` ;

CREATE TABLE IF NOT EXISTS `RateThisCarDB`.`car` (
  `idcar` INT NOT NULL,
  `CarType` VARCHAR(45) NULL,
  `TopSpeed` DOUBLE NULL,
  `Seats` TINYINT NULL,
  `Drive` VARCHAR(45) NULL,
  `vehicle_idvehicle` INT NOT NULL,
  PRIMARY KEY (`idcar`),
  INDEX `fk_car_vehicle1_idx` (`vehicle_idvehicle` ASC),
  CONSTRAINT `fk_car_vehicle1`
    FOREIGN KEY (`vehicle_idvehicle`)
    REFERENCES `RateThisCarDB`.`vehicle` (`idvehicle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RateThisCarDB`.`truck`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RateThisCarDB`.`truck` ;

CREATE TABLE IF NOT EXISTS `RateThisCarDB`.`truck` (
  `idtruck` INT NOT NULL,
  `TruckType` VARCHAR(45) NULL,
  `Clearance` DOUBLE NULL,
  `vehicle_idvehicle` INT NOT NULL,
  PRIMARY KEY (`idtruck`),
  INDEX `fk_truck_vehicle1_idx` (`vehicle_idvehicle` ASC) ,
  CONSTRAINT `fk_truck_vehicle1`
    FOREIGN KEY (`vehicle_idvehicle`)
    REFERENCES `RateThisCarDB`.`vehicle` (`idvehicle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RateThisCarDB`.`motor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RateThisCarDB`.`motor` ;

CREATE TABLE IF NOT EXISTS `RateThisCarDB`.`motor` (
  `idmotor` INT NOT NULL,
  `MotorType` VARCHAR(45) NULL,
  `TopSpeed` DOUBLE NULL,
  `vehicle_idvehicle` INT NOT NULL,
  PRIMARY KEY (`idmotor`),
  INDEX `fk_motor_vehicle1_idx` (`vehicle_idvehicle` ASC) ,
  CONSTRAINT `fk_motor_vehicle1`
    FOREIGN KEY (`vehicle_idvehicle`)
    REFERENCES `RateThisCarDB`.`vehicle` (`idvehicle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;