-- MySQL Workbench Synchronization
-- Generated: 2018-11-25 22:49
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Principal

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `PruebaEmpresa` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `PruebaEmpresa`.`Productos` (
  `idProductos` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `cantidad` INT(11) NULL DEFAULT NULL,
  `precioCompra` INT(11) NULL DEFAULT NULL,
  `precioVenta` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idProductos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `PruebaEmpresa`.`FacturaVenta` (
  `idFacturaVenta` INT(11) NOT NULL AUTO_INCREMENT,
  `total` INT(11) NULL DEFAULT NULL,
  `fechaVenta` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`idFacturaVenta`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `PruebaEmpresa`.`FacturaCompra` (
  `idFacturaCompra` INT(11) NOT NULL AUTO_INCREMENT,
  `total` INT(11) NULL DEFAULT NULL,
  `fechaCompra` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`idFacturaCompra`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `PruebaEmpresa`.`Venta` (
  `idProductos` INT(11) NOT NULL,
  `idFacturaVenta` INT(11) NOT NULL,
  `cantidadProductoVenta` INT(11) NULL DEFAULT NULL,
  `valorTipoProductoVenta` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idProductos`, `idFacturaVenta`),
  INDEX `fk_Productos_has_FacturaVenta_FacturaVenta1_idx` (`idFacturaVenta` ASC),
  INDEX `fk_Productos_has_FacturaVenta_Productos_idx` (`idProductos` ASC),
  CONSTRAINT `fk_Productos_has_FacturaVenta_Productos`
    FOREIGN KEY (`idProductos`)
    REFERENCES `PruebaEmpresa`.`Productos` (`idProductos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Productos_has_FacturaVenta_FacturaVenta1`
    FOREIGN KEY (`idFacturaVenta`)
    REFERENCES `PruebaEmpresa`.`FacturaVenta` (`idFacturaVenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `PruebaEmpresa`.`Compra` (
  `idProductos` INT(11) NOT NULL,
  `idFacturaCompra` INT(11) NOT NULL,
  `cantidadProductoCompra` INT(11) NULL DEFAULT NULL,
  `valorTipoProductoCompra` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idProductos`, `idFacturaCompra`),
  INDEX `fk_Productos_has_FacturaCompra_FacturaCompra1_idx` (`idFacturaCompra` ASC),
  INDEX `fk_Productos_has_FacturaCompra_Productos1_idx` (`idProductos` ASC),
  CONSTRAINT `fk_Productos_has_FacturaCompra_Productos1`
    FOREIGN KEY (`idProductos`)
    REFERENCES `PruebaEmpresa`.`Productos` (`idProductos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Productos_has_FacturaCompra_FacturaCompra1`
    FOREIGN KEY (`idFacturaCompra`)
    REFERENCES `PruebaEmpresa`.`FacturaCompra` (`idFacturaCompra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
