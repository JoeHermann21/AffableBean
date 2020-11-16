SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `affablebean` ;
CREATE SCHEMA IF NOT EXISTS `affablebean` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
USE `affablebean` ;

-- -----------------------------------------------------
-- Table `affablebean`.`customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `affablebean`.`cliente` ;

CREATE  TABLE IF NOT EXISTS `affablebean`.`cliente` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(45) NOT NULL ,
  `email` VARCHAR(45) NOT NULL ,
  `telefone` VARCHAR(45) NOT NULL ,
  `endereco` VARCHAR(45) NOT NULL ,
  `cidade` VARCHAR(2) NOT NULL ,
  `num_cartao_credito` VARCHAR(19) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
COMMENT = 'maintains customer details';


-- -----------------------------------------------------
-- Table `affablebean`.`customer_order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `affablebean`.`pedido` ;

CREATE  TABLE IF NOT EXISTS `affablebean`.`pedido` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `total` DECIMAL(6,2) NOT NULL ,
  `data_criacao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `numero_confirmacao` INT UNSIGNED NOT NULL ,
  `cliente_id` INT UNSIGNED NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_cliente_pedido` (`cliente_id` ASC) ,
  CONSTRAINT `fk_cliente_pedido`
    FOREIGN KEY (`cliente_id` )
    REFERENCES `affablebean`.`cliente` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'maintains customer order details';


-- -----------------------------------------------------
-- Table `affablebean`.`category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `affablebean`.`categoria` ;

CREATE  TABLE IF NOT EXISTS `affablebean`.`categoria` (
  `id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
COMMENT = 'contains product categories, e.g., dairy, meats, etc.';


-- -----------------------------------------------------
-- Table `affablebean`.`product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `affablebean`.`product` ;

CREATE  TABLE IF NOT EXISTS `affablebean`.`produto` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(45) NOT NULL ,
  `preco` DECIMAL(5,2) NOT NULL ,
  `descricao` TINYTEXT NULL ,
  `ultima_atualizacao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `categoria_id` TINYINT UNSIGNED NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_produto_categoria` (`categoria_id` ASC) ,
  CONSTRAINT `fk_produto_categoria`
    FOREIGN KEY (`categoria_id` )
    REFERENCES `affablebean`.`categoria` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'contains product details';


-- -----------------------------------------------------
-- Table `affablebean`.`ordered_product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `affablebean`.`produto_solicitado` ;

CREATE  TABLE IF NOT EXISTS `affablebean`.`produto_solicitado` (
  `pedido_id` INT UNSIGNED NOT NULL ,
  `produto_id` INT UNSIGNED NOT NULL ,
  `quantidade` SMALLINT UNSIGNED NOT NULL DEFAULT 1 ,
  PRIMARY KEY (`pedido_id`, `produto_id`) ,
  INDEX `fk_produto_solicitado_pedido` (`pedido_id` ASC) ,
  INDEX `fk_produto_solicitado_produto` (`produto_id` ASC) ,
  CONSTRAINT `fk_produto_solicitado_pedido`
    FOREIGN KEY (`pedido_id` )
    REFERENCES `affablebean`.`pedido` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produto_solicitado_produto`
    FOREIGN KEY (`produto_id` )
    REFERENCES `affablebean`.`produto` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;