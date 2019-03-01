-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.6.43-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema fariapersonalizados
--

CREATE DATABASE IF NOT EXISTS fariapersonalizados;
USE fariapersonalizados;

--
-- Definition of table `detalhes_mensagem`
--

DROP TABLE IF EXISTS `detalhes_mensagem`;
CREATE TABLE `detalhes_mensagem` (
  `DET_MEN_CODIGOID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `DET_MEN_CODMENSAGEM` int(10) unsigned DEFAULT NULL,
  `DET_MEN_CODREMETENTE` int(10) unsigned DEFAULT NULL,
  `DET_MEN_MENSAGEM` text,
  `DET_MEN_DATAEMISSAO` datetime DEFAULT NULL,
  `DET_MEN_LIDO` varchar(1) DEFAULT 'N',
  PRIMARY KEY (`DET_MEN_CODIGOID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detalhes_mensagem`
--

/*!40000 ALTER TABLE `detalhes_mensagem` DISABLE KEYS */;
INSERT INTO `detalhes_mensagem` (`DET_MEN_CODIGOID`,`DET_MEN_CODMENSAGEM`,`DET_MEN_CODREMETENTE`,`DET_MEN_MENSAGEM`,`DET_MEN_DATAEMISSAO`,`DET_MEN_LIDO`) VALUES 
 (1,1,1,'Bom dia Valentina, <br> Favor acessar o menu de orçamentos em seu painel para realizar este procedimento. <br> Atenciosamente, Italo Angelo. <br> Gerente de Produção - Faria Personalizados','2019-02-27 11:08:00','N');
/*!40000 ALTER TABLE `detalhes_mensagem` ENABLE KEYS */;


--
-- Definition of table `mensagens`
--

DROP TABLE IF EXISTS `mensagens`;
CREATE TABLE `mensagens` (
  `MEN_CODIGOID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `MEN_ASSUNTO` varchar(255) DEFAULT NULL,
  `MEN_CODUSUREMETENTE` int(10) unsigned DEFAULT NULL,
  `MEN_CODUSUdESTINATARIO` int(10) unsigned DEFAULT NULL,
  `MEN_DATACRIACAO` datetime DEFAULT NULL,
  `MEN_DESCRICAO` text,
  PRIMARY KEY (`MEN_CODIGOID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mensagens`
--

/*!40000 ALTER TABLE `mensagens` DISABLE KEYS */;
INSERT INTO `mensagens` (`MEN_CODIGOID`,`MEN_ASSUNTO`,`MEN_CODUSUREMETENTE`,`MEN_CODUSUdESTINATARIO`,`MEN_DATACRIACAO`,`MEN_DESCRICAO`) VALUES 
 (1,'Orçamento de canecas de Acrilico',2,0,'2019-02-27 11:05:00','Boa Tarde <br> Gostaria de pedir o orçamento de 50 canecas de chopp, da cor branca.');
/*!40000 ALTER TABLE `mensagens` ENABLE KEYS */;


--
-- Definition of table `perfil`
--

DROP TABLE IF EXISTS `perfil`;
CREATE TABLE `perfil` (
  `PER_CODIGOID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PER_DESCRICAO` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PER_CODIGOID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `perfil`
--

/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
INSERT INTO `perfil` (`PER_CODIGOID`,`PER_DESCRICAO`) VALUES 
 (1,'FUNCIONARIO'),
 (2,'CLIENTE');
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;


--
-- Definition of table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `USU_CODIGOID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `USU_NOME` varchar(255) DEFAULT NULL,
  `USU_USUARIO` varchar(100) DEFAULT NULL,
  `USU_SENHA` varchar(255) DEFAULT NULL,
  `USU_PERFIL` int(10) unsigned NOT NULL,
  `USU_EMAIL` varchar(255) DEFAULT NULL,
  `USU_ENDERECO` varchar(500) DEFAULT NULL,
  `USU_TELEFONE` varchar(20) DEFAULT NULL,
  `USU_CELULAR` varchar(20) DEFAULT NULL,
  `USU_DATACADASTRO` datetime DEFAULT NULL,
  `USU_CEP` varchar(10) DEFAULT NULL,
  `USU_CAMINHO_IMG_PERFIL` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`USU_CODIGOID`),
  KEY `IDX_PERFIL` (`USU_PERFIL`) USING BTREE,
  CONSTRAINT `FK_PERFIL` FOREIGN KEY (`USU_PERFIL`) REFERENCES `perfil` (`PER_CODIGOID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuario`
--

/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`USU_CODIGOID`,`USU_NOME`,`USU_USUARIO`,`USU_SENHA`,`USU_PERFIL`,`USU_EMAIL`,`USU_ENDERECO`,`USU_TELEFONE`,`USU_CELULAR`,`USU_DATACADASTRO`,`USU_CEP`,`USU_CAMINHO_IMG_PERFIL`) VALUES 
 (1,'Italo Angelo','italoangelo13','2bc33fada526d4eae9c27647d2e374b8',1,'italoangelo.ti@gmail.com','Rua José Augusto Pinto, 190, Pompéu, Sabará - MG','(31) 3671-6139','(31) 97507-0686','2019-02-27 10:53:00','34518-010',NULL),
 (2,'Valentina Faria','valentina1faria','d85a98ee06397ef26667d5cd994c250b',2,'italogaloucura22@gmail.com','Rua José Augusto Pinto, 190, Pompéu, Sabará - MG','(31) 3671-6139','(31) 97507-0686','2019-02-27 11:04:00','34518-010',NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
