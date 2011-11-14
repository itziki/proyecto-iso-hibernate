﻿DROP TABLE IF EXISTS `hibejcc`.`domicilios`;
DROP TABLE IF EXISTS `hibejcc`.`direccion`;
DROP TABLE IF EXISTS `hibejcc`.`externo`;
DROP TABLE IF EXISTS `hibejcc`.`empleado`;
DROP TABLE IF EXISTS `hibejcc`.`departamento`;

CREATE TABLE  `hibejcc`.`departamento` (
  `DEP_ID` int(11) NOT NULL auto_increment,
  `DEP_NOMBRE` varchar(255) NOT NULL,
  PRIMARY KEY  (`DEP_ID`),
  UNIQUE KEY `DEP_NOMBRE` (`DEP_NOMBRE`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

CREATE TABLE  `hibejcc`.`direccion` (
  `DIR_ID` int(11) NOT NULL auto_increment,
  `DIR_DESC` varchar(255) NOT NULL,
  `DIR_CP` int(11) NOT NULL,
  PRIMARY KEY  (`DIR_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

CREATE TABLE  `hibejcc`.`empleado` (
  `EM_NIF` int(11) NOT NULL,
  `EM_NOMBRE` varchar(255) NOT NULL,
  `EM_PUESTO` varchar(255) default NULL,
  `EM_EMAIL` varchar(255) default NULL,
  `DEP_ID` int(11) NOT NULL,
  PRIMARY KEY  (`EM_NIF`),
  UNIQUE KEY `EM_NOMBRE` (`EM_NOMBRE`),
  KEY `FK75C3F0CBD5EE2164` (`DEP_ID`),
  CONSTRAINT `FK75C3F0CBD5EE2164` FOREIGN KEY (`DEP_ID`) REFERENCES `departamento` (`DEP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE  `hibejcc`.`externo` (
  `EM_NIF` int(11) NOT NULL,
  `EX_EMPRESA` varchar(255) default NULL,
  `EX_EMAILALT` varchar(255) default NULL,
  `EX_DESCCOLABORACION` varchar(255) default NULL,
  PRIMARY KEY  (`EM_NIF`),
  KEY `FKDCF8C0AF26BD5B54` (`EM_NIF`),
  CONSTRAINT `FKDCF8C0AF26BD5B54` FOREIGN KEY (`EM_NIF`) REFERENCES `empleado` (`EM_NIF`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE  `hibejcc`.`domicilios` (
  `EM_NIF` int(11) NOT NULL,
  `DIR_ID` int(11) NOT NULL,
  PRIMARY KEY  (`EM_NIF`,`DIR_ID`),
  KEY `FK6F7EBFAEED41DD48` (`DIR_ID`),
  KEY `FK6F7EBFAE26BD5B54` (`EM_NIF`),
  CONSTRAINT `FK6F7EBFAE26BD5B54` FOREIGN KEY (`EM_NIF`) REFERENCES `empleado` (`EM_NIF`),
  CONSTRAINT `FK6F7EBFAEED41DD48` FOREIGN KEY (`DIR_ID`) REFERENCES `direccion` (`DIR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




