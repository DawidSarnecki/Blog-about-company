-- MySQL Script generated by MySQL Workbench
-- 11/09/16 01:04:04
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema new_schema1
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema blog
-- -----------------------------------------------------
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `ID` VARCHAR(36) NOT NULL,
  `Login` VARCHAR(10) NOT NULL,
  `Email` TINYTEXT NULL DEFAULT NULL,
  `Pass` TINYTEXT NOT NULL,
  `X_CreateTime` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IsAdmin` TINYINT(1) NOT NULL DEFAULT '0',
  `IsBlocked` TINYINT(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC),
  UNIQUE INDEX `Login_UNIQUE` (`Login` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = cp1250;


-- -----------------------------------------------------
-- Table `mydb`.`activity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`activity` (
  `ID` VARCHAR(36) NOT NULL DEFAULT '',
  `Blogs` INT(11) NOT NULL DEFAULT '0',
  `Comments` INT(11) NOT NULL DEFAULT '0',
  `LastActivity` DATETIME NULL DEFAULT NULL,
  `userID` VARCHAR(36) NOT NULL,
  PRIMARY KEY (`ID`, `userID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC),
  INDEX `fk_activity_user_idx` (`userID` ASC),
  CONSTRAINT `fk_activity_user`
    FOREIGN KEY (`userID`)
    REFERENCES `mydb`.`user` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = cp1250;


-- -----------------------------------------------------
-- Table `mydb`.`blogtext`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`blogtext` (
  `ID` VARCHAR(36) NOT NULL,
  `Title` TEXT NOT NULL,
  `Text` LONGTEXT NOT NULL,
  `Status` INT(11) NOT NULL DEFAULT '0',
  `X_CreateUser` VARCHAR(36) NULL DEFAULT NULL,
  `X_CreateTime` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `X_UpdateTime` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `X_RemoveTime` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC),
  INDEX `fk_blogtext_user1_idx` (`X_CreateUser` ASC),
  CONSTRAINT `fk_blogtext_user1`
    FOREIGN KEY (`X_CreateUser`)
    REFERENCES `mydb`.`user` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = cp1250;


-- -----------------------------------------------------
-- Table `mydb`.`blogcomment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`blogcomment` (
  `ID` VARCHAR(36) NOT NULL,
  `BlogItemID` VARCHAR(36) NOT NULL,
  `Author` VARCHAR(36) NOT NULL,
  `Text` TEXT NOT NULL,
  `X_CreateTime` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `X_UpdateTime` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `X_RemoveTime` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC),
  INDEX `fk_blogcomment_user1_idx` (`Author` ASC),
  INDEX `fk_blogcomment_blogtext1_idx` (`BlogItemID` ASC),
  CONSTRAINT `fk_blogcomment_user1`
    FOREIGN KEY (`Author`)
    REFERENCES `mydb`.`user` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_blogcomment_blogtext1`
    FOREIGN KEY (`BlogItemID`)
    REFERENCES `mydb`.`blogtext` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = cp1250;

USE `mydb`;

DELIMITER $$
USE `mydb`$$
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `sdbm`.`user_BEFORE_INSERT` BEFORE INSERT ON `user` FOR EACH ROW
BEGIN
SET new.ID = uuid();
END */$$

USE `mydb`$$
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `sdbm`.`activity_BEFORE_INSERT` BEFORE INSERT ON `activity` FOR EACH ROW
BEGIN
 SET new.ID = uuid();
END */$$

USE `mydb`$$
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `sdbm`.`blogtext_AFTER_INSERT` AFTER INSERT ON `blogtext` FOR EACH ROW
BEGIN
DECLARE x INT;
SET x = (SELECT COUNT(*) FROM BlogText WHERE BlogText.X_CreateUser = NEW.X_CreateUser);
UPDATE Activity SET Activity.Blogs = x, LastActivity = now() WHERE UserID =  NEW.X_CreateUser;
END */$$

USE `mydb`$$
CREATE DEFINER = CURRENT_USER TRIGGER `mydb`.`blogtext_BEFORE_INSERT` BEFORE INSERT ON `blogtext` FOR EACH ROW
BEGIN
SET new.ID = uuid();
END$$

USE `mydb`$$
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `sdbm`.`blogcomment_BEFORE_INSERT` BEFORE INSERT ON `blogcomment` FOR EACH ROW
BEGIN
SET new.ID = uuid();
END */$$

USE `mydb`$$
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `sdbm`.`blogcomment_AFTER_INSERT` AFTER INSERT ON `blogcomment` FOR EACH ROW
BEGIN
DECLARE x INT;
SET x = (SELECT COUNT(*) FROM BlogComment WHERE Author = NEW.Author);
UPDATE Activity SET Activity.Comments = x, LastActivity = now() WHERE UserID =  NEW.Author;
END */$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
