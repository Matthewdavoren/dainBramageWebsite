-- MySQL Script generated by MySQL Workbench
-- Fri 12 Apr 2024 03:14:33 PM PDT
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema dainBramage
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dainBramage` ;
USE `dainBramage` ;

-- -----------------------------------------------------
-- Table `dainBramage`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dainBramage`.`users` (
  `user_id` INT NOT NULL,
  `username` VARCHAR(25) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `date_registered` DATETIME NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `date_of_birth` DATE NOT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dainBramage`.`chatrooms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dainBramage`.`chatrooms` (
  `chatroom_id` INT NOT NULL,
  `channel_id` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`chatroom_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dainBramage`.`channels`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dainBramage`.`channels` (
  `channel_id` INT NOT NULL,
  `channel_number` VARCHAR(255) NOT NULL,
  `chatrooms_chatroom_id` INT NOT NULL,
  PRIMARY KEY (`channel_id`, `chatrooms_chatroom_id`),
  INDEX `fk_channels_chatrooms1_idx` (`chatrooms_chatroom_id` ASC) VISIBLE,
  CONSTRAINT `fk_channels_chatrooms1`
    FOREIGN KEY (`chatrooms_chatroom_id`)
    REFERENCES `dainBramage`.`chatrooms` (`chatroom_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dainBramage`.`videos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dainBramage`.`videos` (
  `video_id` INT NOT NULL,
  `production_house_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `title` VARCHAR(50) NOT NULL,
  `director` VARCHAR(50) NOT NULL,
  `date_uploaded` DATETIME NOT NULL,
  `actor` VARCHAR(50) NOT NULL,
  `producer` VARCHAR(50) NOT NULL,
  `writer` VARCHAR(50) NOT NULL,
  `editor` VARCHAR(50) NOT NULL,
  `channels_channel_id` INT NOT NULL,
  PRIMARY KEY (`video_id`, `production_house_id`, `user_id`, `channels_channel_id`),
  INDEX `fk_videos_users_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_videos_channels1_idx` (`channels_channel_id` ASC) VISIBLE,
  CONSTRAINT `fk_videos_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `dainBramage`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_videos_channels1`
    FOREIGN KEY (`channels_channel_id`)
    REFERENCES `dainBramage`.`channels` (`channel_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dainBramage`.`tags`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dainBramage`.`tags` (
  `tag_id` INT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`tag_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dainBramage`.`messages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dainBramage`.`messages` (
  `message_id` INT NOT NULL,
  `user_id` VARCHAR(255) NOT NULL,
  `chatroom_id` VARCHAR(255) NOT NULL,
  `message_content` VARCHAR(255) NOT NULL,
  `timestamp` VARCHAR(255) NOT NULL,
  `users_user_id` INT NOT NULL,
  `chatrooms_chatroom_id` INT NOT NULL,
  PRIMARY KEY (`message_id`, `users_user_id`, `chatrooms_chatroom_id`),
  INDEX `fk_messages_users1_idx` (`users_user_id` ASC) VISIBLE,
  INDEX `fk_messages_chatrooms1_idx` (`chatrooms_chatroom_id` ASC) VISIBLE,
  CONSTRAINT `fk_messages_users1`
    FOREIGN KEY (`users_user_id`)
    REFERENCES `dainBramage`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_messages_chatrooms1`
    FOREIGN KEY (`chatrooms_chatroom_id`)
    REFERENCES `dainBramage`.`chatrooms` (`chatroom_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dainBramage`.`video_tags`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dainBramage`.`video_tags` (
  `videos_video_id` INT NOT NULL,
  `videos_production_house_id` INT NOT NULL,
  `videos_user_id` INT NOT NULL,
  `videos_channels_channel_id` INT NOT NULL,
  `tags_tag_id` INT NOT NULL,
  PRIMARY KEY (`videos_video_id`, `videos_production_house_id`, `videos_user_id`, `videos_channels_channel_id`, `tags_tag_id`),
  INDEX `fk_videos_has_tags_tags1_idx` (`tags_tag_id` ASC) VISIBLE,
  INDEX `fk_videos_has_tags_videos1_idx` (`videos_video_id` ASC, `videos_production_house_id` ASC, `videos_user_id` ASC, `videos_channels_channel_id` ASC) VISIBLE,
  CONSTRAINT `fk_videos_has_tags_videos1`
    FOREIGN KEY (`videos_video_id` , `videos_production_house_id` , `videos_user_id` , `videos_channels_channel_id`)
    REFERENCES `dainBramage`.`videos` (`video_id` , `production_house_id` , `user_id` , `channels_channel_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_videos_has_tags_tags1`
    FOREIGN KEY (`tags_tag_id`)
    REFERENCES `dainBramage`.`tags` (`tag_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `dainBramage`.`api_keys`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dainBramage`.`api_keys` (
	id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP)
    ENGINE = InnoDB;
  


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
