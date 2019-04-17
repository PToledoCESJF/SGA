CREATE DATABASE  IF NOT EXISTS `SGA` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `SGA`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: SGA
-- ------------------------------------------------------
-- Server version	5.7.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Aluno`
--

DROP TABLE IF EXISTS `Aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Aluno` (
  `idAluno` int(11) NOT NULL AUTO_INCREMENT,
  `Matricula` int(11) NOT NULL,
  `Nome` varchar(45) NOT NULL,
  PRIMARY KEY (`idAluno`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Aluno`
--

LOCK TABLES `Aluno` WRITE;
/*!40000 ALTER TABLE `Aluno` DISABLE KEYS */;
INSERT INTO `Aluno` VALUES (1,201701,'João'),(2,201702,'Maria'),(3,201703,'José'),(4,201704,'Pedro'),(5,201705,'Marcos'),(6,201706,'Tiago'),(7,201707,'André'),(8,201708,'Filipe'),(9,201709,'Bartolomeu'),(10,201710,'Tadeu'),(11,201711,'Tomé'),(12,201712,'Zelote'),(13,201713,'Judas'),(14,201714,'Simão ');
/*!40000 ALTER TABLE `Aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Aluno_has_Turma`
--

DROP TABLE IF EXISTS `Aluno_has_Turma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Aluno_has_Turma` (
  `Aluno_idAluno` int(11) NOT NULL,
  `Turma_idTurma` int(11) NOT NULL,
  PRIMARY KEY (`Aluno_idAluno`,`Turma_idTurma`),
  KEY `fk_Aluno_has_Turma_Turma1_idx` (`Turma_idTurma`),
  KEY `fk_Aluno_has_Turma_Aluno1_idx` (`Aluno_idAluno`),
  CONSTRAINT `fk_Aluno_has_Turma_Aluno1` FOREIGN KEY (`Aluno_idAluno`) REFERENCES `Aluno` (`idAluno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Aluno_has_Turma_Turma1` FOREIGN KEY (`Turma_idTurma`) REFERENCES `Turma` (`idTurma`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Aluno_has_Turma`
--

LOCK TABLES `Aluno_has_Turma` WRITE;
/*!40000 ALTER TABLE `Aluno_has_Turma` DISABLE KEYS */;
INSERT INTO `Aluno_has_Turma` VALUES (1,1),(2,1),(3,1);
/*!40000 ALTER TABLE `Aluno_has_Turma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Avaliacao`
--

DROP TABLE IF EXISTS `Avaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Avaliacao` (
  `idAvaliacao` int(11) NOT NULL AUTO_INCREMENT,
  `Turma_idTurma` int(11) NOT NULL,
  `Aluno_idAluno` int(11) NOT NULL,
  `Nota1` float DEFAULT NULL,
  `Nota2` float DEFAULT NULL,
  `Nota3` float DEFAULT NULL,
  `Nota4` float DEFAULT NULL,
  `NotaFinal` float DEFAULT NULL,
  `Situação` varchar(45) DEFAULT 'Cursando',
  PRIMARY KEY (`idAvaliacao`),
  KEY `fk_Avaliacao_Turma1_idx` (`Turma_idTurma`),
  KEY `fk_Avaliacao_Aluno1_idx` (`Aluno_idAluno`),
  CONSTRAINT `fk_Avaliacao_Aluno1` FOREIGN KEY (`Aluno_idAluno`) REFERENCES `Aluno` (`idAluno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Avaliacao_Turma1` FOREIGN KEY (`Turma_idTurma`) REFERENCES `Turma` (`idTurma`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Avaliacao`
--

LOCK TABLES `Avaliacao` WRITE;
/*!40000 ALTER TABLE `Avaliacao` DISABLE KEYS */;
INSERT INTO `Avaliacao` VALUES (1,1,1,10,NULL,NULL,NULL,NULL,'Cursando'),(2,1,2,7.5,NULL,NULL,NULL,NULL,'Cursando'),(3,1,3,5,NULL,NULL,NULL,NULL,'Cursando');
/*!40000 ALTER TABLE `Avaliacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Curso`
--

DROP TABLE IF EXISTS `Curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Curso` (
  `idCurso` int(11) NOT NULL AUTO_INCREMENT,
  `Instituicao_idInstituicao` int(11) NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Sigla` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCurso`),
  KEY `fk_Curso_Instituicao1_idx` (`Instituicao_idInstituicao`),
  CONSTRAINT `fk_Curso_Instituicao1` FOREIGN KEY (`Instituicao_idInstituicao`) REFERENCES `Instituicao` (`idInstituicao`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Curso`
--

LOCK TABLES `Curso` WRITE;
/*!40000 ALTER TABLE `Curso` DISABLE KEYS */;
INSERT INTO `Curso` VALUES (1,1,'ENGENHARIA DE SOFTWARE','ES'),(2,1,'BACHARELADO EM SISTEMAS DE INFORMAÇÃO','BSI'),(3,2,'BACHARELADO EM SISTEMAS DE INFORMAÇÃO','BSI'),(4,2,'ENGENHARIA MECATRONICA','MEC');
/*!40000 ALTER TABLE `Curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Curso_has_Aluno`
--

DROP TABLE IF EXISTS `Curso_has_Aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Curso_has_Aluno` (
  `Curso_idCurso` int(11) NOT NULL,
  `Aluno_idAluno` int(11) NOT NULL,
  PRIMARY KEY (`Curso_idCurso`,`Aluno_idAluno`),
  KEY `fk_Curso_has_Aluno_Aluno1_idx` (`Aluno_idAluno`),
  KEY `fk_Curso_has_Aluno_Curso1_idx` (`Curso_idCurso`),
  CONSTRAINT `fk_Curso_has_Aluno_Aluno1` FOREIGN KEY (`Aluno_idAluno`) REFERENCES `Aluno` (`idAluno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Curso_has_Aluno_Curso1` FOREIGN KEY (`Curso_idCurso`) REFERENCES `Curso` (`idCurso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Curso_has_Aluno`
--

LOCK TABLES `Curso_has_Aluno` WRITE;
/*!40000 ALTER TABLE `Curso_has_Aluno` DISABLE KEYS */;
INSERT INTO `Curso_has_Aluno` VALUES (1,1),(1,2),(1,3);
/*!40000 ALTER TABLE `Curso_has_Aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Disciplina`
--

DROP TABLE IF EXISTS `Disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Disciplina` (
  `idDisciplina` int(11) NOT NULL AUTO_INCREMENT,
  `Professor_idProfessor` int(11) NOT NULL,
  `Nome` varchar(255) NOT NULL,
  `Sigla` varchar(20) DEFAULT NULL,
  `CargaHoraria` int(11) DEFAULT NULL,
  PRIMARY KEY (`idDisciplina`),
  KEY `fk_Disciplina_Professor1_idx` (`Professor_idProfessor`),
  CONSTRAINT `fk_Disciplina_Professor1` FOREIGN KEY (`Professor_idProfessor`) REFERENCES `Professor` (`idProfessor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Disciplina`
--

LOCK TABLES `Disciplina` WRITE;
/*!40000 ALTER TABLE `Disciplina` DISABLE KEYS */;
INSERT INTO `Disciplina` VALUES (1,1,'MANUTENÇÃO E EVOLUÇÃO DE SOFTWARE','MES',80),(2,1,'SEGURANÇA DA INFORMAÇÃO','SEGURANÇA',40),(3,1,'SISTEMAS OPERACIONAIS','SO',80),(4,5,'ALGORITMOS','ALG',80);
/*!40000 ALTER TABLE `Disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Instituicao`
--

DROP TABLE IF EXISTS `Instituicao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Instituicao` (
  `idInstituicao` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(300) NOT NULL,
  `Sigla` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idInstituicao`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Instituicao`
--

LOCK TABLES `Instituicao` WRITE;
/*!40000 ALTER TABLE `Instituicao` DISABLE KEYS */;
INSERT INTO `Instituicao` VALUES (1,'CENTRO DE ENSINO SUPERIOR DE JUIZ DE FORA','CESJF'),(2,'INSTITUTO FEDERAL DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA DO SUDESTE DE MINAS GERAIS - CAMPUS JUIZ DE FORA','IF SUDESTE MG'),(3,'UNIVERSIDADE FEDERAL DE JUIZ DE FORA','UFJF'),(4,'PONTIFÍCIA UNIVERSIDADE CATÓLICA DO RIO DE JANEIRO','PUC-RIO');
/*!40000 ALTER TABLE `Instituicao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Professor`
--

DROP TABLE IF EXISTS `Professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Professor` (
  `idProfessor` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `Cargo` varchar(45) DEFAULT 'PROFESSOR ASSISTENTE I',
  PRIMARY KEY (`idProfessor`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Professor`
--

LOCK TABLES `Professor` WRITE;
/*!40000 ALTER TABLE `Professor` DISABLE KEYS */;
INSERT INTO `Professor` VALUES (1,'TASSIO FERENZINI MARTINS SIRQUEIRA','PROFESSOR ASSISTENTE II'),(2,'JACIMAR TAVARES','PROFESSOR ASSISTENTE II'),(3,'CARLOS ALBERTO','PROFESSOR ASSISTENTE II'),(4,'MARCO ANTÔNIO ARAÚJO','PROFESSOR TITUTLAR I'),(5,'DAVES MARCIO SILVA MARTINS','PROFESSOR ADJUNTO I'),(6,'GERALDO BESSA','PROFESSOR ASSISTENTE I');
/*!40000 ALTER TABLE `Professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Professor_has_Curso`
--

DROP TABLE IF EXISTS `Professor_has_Curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Professor_has_Curso` (
  `Professor_idProfessor` int(11) NOT NULL,
  `Curso_idCurso` int(11) NOT NULL,
  PRIMARY KEY (`Professor_idProfessor`,`Curso_idCurso`),
  KEY `fk_Professor_has_Curso_Curso1_idx` (`Curso_idCurso`),
  KEY `fk_Professor_has_Curso_Professor_idx` (`Professor_idProfessor`),
  CONSTRAINT `fk_Professor_has_Curso_Curso1` FOREIGN KEY (`Curso_idCurso`) REFERENCES `Curso` (`idCurso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Professor_has_Curso_Professor` FOREIGN KEY (`Professor_idProfessor`) REFERENCES `Professor` (`idProfessor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Professor_has_Curso`
--

LOCK TABLES `Professor_has_Curso` WRITE;
/*!40000 ALTER TABLE `Professor_has_Curso` DISABLE KEYS */;
INSERT INTO `Professor_has_Curso` VALUES (1,1);
/*!40000 ALTER TABLE `Professor_has_Curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Turma`
--

DROP TABLE IF EXISTS `Turma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Turma` (
  `idTurma` int(11) NOT NULL AUTO_INCREMENT,
  `Disciplina_idDisciplina` int(11) NOT NULL,
  `Nome` varchar(45) NOT NULL,
  PRIMARY KEY (`idTurma`),
  KEY `fk_Turma_Disciplina1_idx` (`Disciplina_idDisciplina`),
  CONSTRAINT `fk_Turma_Disciplina1` FOREIGN KEY (`Disciplina_idDisciplina`) REFERENCES `Disciplina` (`idDisciplina`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Turma`
--

LOCK TABLES `Turma` WRITE;
/*!40000 ALTER TABLE `Turma` DISABLE KEYS */;
INSERT INTO `Turma` VALUES (1,1,'MES20191'),(2,3,'SO0001'),(3,2,'SEG001');
/*!40000 ALTER TABLE `Turma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuario`
--

DROP TABLE IF EXISTS `Usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `Usuario` varchar(255) NOT NULL,
  `Senha` varchar(255) NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Resetar` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario`
--

LOCK TABLES `Usuario` WRITE;
/*!40000 ALTER TABLE `Usuario` DISABLE KEYS */;
INSERT INTO `Usuario` VALUES (1,'admin','d033e22ae348aeb5660fc2140aec35850c4da997','Tassio Sirqueira','tassio@tassio.eti.br',0);
/*!40000 ALTER TABLE `Usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-07 12:23:23
