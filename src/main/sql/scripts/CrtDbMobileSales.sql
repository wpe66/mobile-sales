-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema MobileSalesDb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MobileSalesDb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MobileSalesDb` ;
USE `MobileSalesDb` ;

-- -----------------------------------------------------
-- Table `MobileSalesDb`.`postal_address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MobileSalesDb`.`postal_address` ;

CREATE TABLE IF NOT EXISTS `MobileSalesDb`.`postal_address` (
  `id` INT NOT NULL,
  `street` VARCHAR(45) NULL,
  `postal_code` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MobileSalesDb`.`customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MobileSalesDb`.`customer` ;

CREATE TABLE IF NOT EXISTS `MobileSalesDb`.`customer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `sur_name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `user_name` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `address_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_customer_postal_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_customer_postal_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `MobileSalesDb`.`postal_address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MobileSalesDb`.`mobile_phone`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MobileSalesDb`.`mobile_phone` ;

CREATE TABLE IF NOT EXISTS `MobileSalesDb`.`mobile_phone` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `customer_id` INT NULL,
  `phone_number` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_mobile_phone_client_idx` (`customer_id` ASC),
  CONSTRAINT `fk_mobile_phone_client`
    FOREIGN KEY (`customer_id`)
    REFERENCES `MobileSalesDb`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MobileSalesDb`.`topic`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MobileSalesDb`.`topic` ;

CREATE TABLE IF NOT EXISTS `MobileSalesDb`.`topic` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  `pay_unit` VARCHAR(45) NULL,
  `std_bill` DECIMAL(10,4) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MobileSalesDb`.`event_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MobileSalesDb`.`event_type` ;

CREATE TABLE IF NOT EXISTS `MobileSalesDb`.`event_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL COMMENT '		',
  `description` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MobileSalesDb`.`subscription`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MobileSalesDb`.`subscription` ;

CREATE TABLE IF NOT EXISTS `MobileSalesDb`.`subscription` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `mobile_phone_id` INT NULL,
  `topic_id` INT NULL,
  `event_type_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_subscription_mobile_phone1_idx` (`mobile_phone_id` ASC),
  INDEX `fk_subscription_topic1_idx` (`topic_id` ASC),
  INDEX `fk_subscription_event1_idx` (`event_type_id` ASC),
  CONSTRAINT `fk_subscription_mobile_phone1`
    FOREIGN KEY (`mobile_phone_id`)
    REFERENCES `MobileSalesDb`.`mobile_phone` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_subscription_topic1`
    FOREIGN KEY (`topic_id`)
    REFERENCES `MobileSalesDb`.`topic` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_subscription_event1`
    FOREIGN KEY (`event_type_id`)
    REFERENCES `MobileSalesDb`.`event_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MobileSalesDb`.`media`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MobileSalesDb`.`media` ;

CREATE TABLE IF NOT EXISTS `MobileSalesDb`.`media` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `topic_id` INT NULL,
  `title` VARCHAR(45) NULL,
  `filename` VARCHAR(256) NULL,
  `content` LONGBLOB NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_media_topic1_idx` (`topic_id` ASC),
  CONSTRAINT `fk_media_topic1`
    FOREIGN KEY (`topic_id`)
    REFERENCES `MobileSalesDb`.`topic` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MobileSalesDb`.`billing`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MobileSalesDb`.`billing` ;

CREATE TABLE IF NOT EXISTS `MobileSalesDb`.`billing` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `mobile_phone_id` INT NULL,
  `subscription_id` INT NULL,
  `amount` DECIMAL(10,4) NULL,
  `date` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_billing_mobile_phone1_idx` (`mobile_phone_id` ASC),
  INDEX `fk_billing_subscription1_idx` (`subscription_id` ASC),
  CONSTRAINT `fk_billing_mobile_phone1`
    FOREIGN KEY (`mobile_phone_id`)
    REFERENCES `MobileSalesDb`.`mobile_phone` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_billing_subscription1`
    FOREIGN KEY (`subscription_id`)
    REFERENCES `MobileSalesDb`.`subscription` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
