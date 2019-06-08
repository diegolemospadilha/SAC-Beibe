SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

# CRIANDO BANCO DE DADOS 
CREATE SCHEMA IF NOT EXISTS `beibe` DEFAULT CHARACTER SET utf8 ;
USE `beibe` ;

# CRIANDO tb_estado
CREATE TABLE IF NOT EXISTS `beibe`.`tb_estado` (
  `id_estado` INT NOT NULL AUTO_INCREMENT,
   `sigla` char(2) NOT NULL,
  `nome_estado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_estado`))
ENGINE = InnoDB;

# CRIANDO`tb_cidade`

CREATE TABLE IF NOT EXISTS `beibe`.`tb_cidade` (
  `id_cidade` INT NOT NULL AUTO_INCREMENT,
  `id_estado` INT NOT NULL,
  `nome_cidade` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_cidade`),
  INDEX `fk_tb_cidade_1_idx` (`id_estado` ASC),
  CONSTRAINT `fk_tb_cidade_1`
    FOREIGN KEY (`id_estado`)
    REFERENCES `beibe`.`tb_estado` (`id_estado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

# CRIANDO `tb_usuario`

CREATE TABLE IF NOT EXISTS `beibe`.`tb_usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `cpf` CHAR(11) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(255) NOT NULL,
  `telefone` VARCHAR(13) NOT NULL,
  `nome_rua` VARCHAR(100) NOT NULL,
  `numero_rua` INT NOT NULL,
  `complemento` VARCHAR(45) NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `cep` VARCHAR(10) NOT NULL,
  `tipo_usuario` CHAR(1) NOT NULL,
  `id_cidade` INT NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  INDEX `fk_tb_usuario_1_idx` (`id_cidade` ASC),
  CONSTRAINT `fk_tb_usuario_1`
    FOREIGN KEY (`id_cidade`)
    REFERENCES `beibe`.`tb_cidade` (`id_cidade`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

# CRIANDO  `tb_categoria`

CREATE TABLE IF NOT EXISTS `beibe`.`tb_categoria` (
  `id_categoria` INT NOT NULL AUTO_INCREMENT,
  `nome_categoria` VARCHAR(45) NOT NULL  UNIQUE,
  PRIMARY KEY (`id_categoria`))
ENGINE = InnoDB;

# CRIANDO `tb_produto`

CREATE TABLE IF NOT EXISTS `beibe`.`tb_produto` (
  `id_produto` INT NOT NULL AUTO_INCREMENT,
  `nome_produto` VARCHAR(45) NOT NULL,
  `peso_produto` DECIMAL(10,2) NULL,
  `id_categoria` INT NOT NULL,
  PRIMARY KEY (`id_produto`),
  INDEX `fk_tb_produto_1_idx` (`id_categoria` ASC),
  UNIQUE INDEX `nome_produto_UNIQUE` (`nome_produto` ASC),
  CONSTRAINT `fk_tb_produto_1`
    FOREIGN KEY (`id_categoria`)
    REFERENCES `beibe`.`tb_categoria` (`id_categoria`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

# CRIANDO`tb_tipo_atendimento`

CREATE TABLE IF NOT EXISTS `beibe`.`tb_tipo_atendimento` (
  `id_tipo_atendimento` INT NOT NULL AUTO_INCREMENT,
  `nome_tipo_atendimento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_tipo_atendimento`),
  UNIQUE INDEX `id_tipo_atendimento_UNIQUE` (`id_tipo_atendimento` ASC))
ENGINE = InnoDB;

# CRIANDO `tb_atendimento`

CREATE TABLE IF NOT EXISTS `beibe`.`tb_atendimento` (
  `id_atendimento` INT NOT NULL AUTO_INCREMENT,
  `data_atendimento` DATETIME NOT NULL,
  `descricao_atendimento` VARCHAR(200) NOT NULL,
  `situacao_atendimento` CHAR(1) NOT NULL,
  `solucao_apresentada` VARCHAR(200) NULL,
  `id_usuario` INT NOT NULL,
  `id_produto` INT NOT NULL,
  `id_tipo_atendimento` INT NOT NULL,
  PRIMARY KEY (`id_atendimento`),
  INDEX `fk_tb_atendimento_1_idx` (`id_produto` ASC),
  INDEX `fk_tb_atendimento_3_idx` (`id_tipo_atendimento` ASC),
  INDEX `fk_tb_atendimento_2_idx` (`id_usuario` ASC),
  CONSTRAINT `fk_tb_atendimento_1`
    FOREIGN KEY (`id_produto`)
    REFERENCES `beibe`.`tb_produto` (`id_produto`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_tb_atendimento_3`
    FOREIGN KEY (`id_tipo_atendimento`)
    REFERENCES `beibe`.`tb_tipo_atendimento` (`id_tipo_atendimento`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_tb_atendimento_2`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `beibe`.`tb_usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO `beibe`.`tb_estado` VALUES (null, 'AC', 'Acre');
INSERT INTO `beibe`.`tb_estado` VALUES (null, 'AL', 'Alagoas');
INSERT INTO `beibe`.`tb_estado` VALUES (null, 'AM', 'Amazonas');
INSERT INTO `beibe`.`tb_estado` VALUES (null, 'AP', 'Amapá');
INSERT INTO `beibe`.`tb_estado` VALUES (null, 'BA', 'Bahia');
INSERT INTO `beibe`.`tb_estado` VALUES (null, 'CE', 'Ceará');
INSERT INTO `beibe`.`tb_estado` VALUES (null, 'DF', 'Distrito Federal');
INSERT INTO `beibe`.`tb_estado` VALUES (null, 'ES', 'Espírito Santo');
INSERT INTO `beibe`.`tb_estado` VALUES (null, 'GO', 'Goiás');
INSERT INTO `beibe`.`tb_estado` VALUES (null, 'MA', 'Maranhão');
INSERT INTO `beibe`.`tb_estado` VALUES (null, 'MG', 'Minas Gerais');
INSERT INTO `beibe`.`tb_estado` VALUES (null, 'MS', 'Mato Grosso do Sul');
INSERT INTO `beibe`.`tb_estado` VALUES (null, 'MT', 'Mato Grosso');
INSERT INTO `beibe`.`tb_estado` VALUES (null, 'PA', 'Pará');
INSERT INTO `beibe`.`tb_estado` VALUES (null, 'PB', 'Paraíba');
INSERT INTO `beibe`.`tb_estado` VALUES (null, 'PE', 'Pernambuco');
INSERT INTO `beibe`.`tb_estado` VALUES (null, 'PI', 'Piauí');
INSERT INTO `beibe`.`tb_estado` VALUES (null, 'PR', 'Paraná');
INSERT INTO `beibe`.`tb_estado` VALUES (null, 'RJ', 'Rio de Janeiro');
INSERT INTO `beibe`.`tb_estado` VALUES (null, 'RN', 'Rio Grande do Norte');
INSERT INTO `beibe`.`tb_estado` VALUES (null, 'RO', 'Rondônia');
INSERT INTO `beibe`.`tb_estado` VALUES (null, 'RR', 'Roraima');
INSERT INTO `beibe`.`tb_estado` VALUES (null, 'RS', 'Rio Grande do Sul');
INSERT INTO `beibe`.`tb_estado` VALUES (null, 'SC', 'Santa Catarina');
INSERT INTO `beibe`.`tb_estado` VALUES (null, 'SE', 'Sergipe');
INSERT INTO `beibe`.`tb_estado` VALUES (null, 'SP', 'São Paulo');
INSERT INTO `beibe`.`tb_estado` VALUES (null, 'TO', 'Tocantins');

#INSERÇÃO DE CIDADES

INSERT INTO `beibe`.`tb_cidade` VALUES (null, 01, 'Acrelandia');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 01, 'Assis Brasil');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 01, 'Brasileia');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 01, 'Bujari');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 01, 'Capixaba');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 01, 'Cruzeiro do Sul');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 01, 'Epitaciolandia');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 01, 'Feijo');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 01, 'Jordao');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 01, 'Xapuri');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 02, 'Agua Branca');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 02, 'Alazao');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 02, 'Alecrim');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 02, 'Anadia');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 02, 'Anel');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 02, 'Anum Novo');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 02, 'Anum Velho');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 02, 'Arapiraca');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 02, 'Atalaia');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 02, 'Baixa da Onca');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 02, 'Baixa do Capim');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 02, 'Balsamo');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 02, 'Bananeiras');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 02, 'Barra de Santo Antonio');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 02, 'Barra de Sao Miguel');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 02, 'Barra do Bonifacio');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 02, 'Barra Grande');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 02, 'Batalha');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 02, 'Vila Sao Francisco');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 03, 'Alvaraes');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 03, 'Amatari');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 03, 'Amatura');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 03, 'Anama');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 03, 'Anori');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 03, 'Apui');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 03, 'Mocambo');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 03, 'Moura');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 03, 'Murutinga');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 03, 'Nhamunda');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 03, 'Nova Olinda do Norte');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 03, 'Novo Airao');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 03, 'Novo Aripuana');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 03, 'Osorio da Fonseca');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 03, 'Parintins');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 03, 'Pauini');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 03, 'Pedras');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 03, 'Presidente Figueiredo');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 03, 'Repartimento');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 03, 'Rio Preto da Eva');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 03, 'Santa Isabel do Rio Negro');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 03, 'Santa Rita');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 03, 'Santo Antonio do Ica');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 03, 'Sao Felipe');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 03, 'Sao Gabriel da Cachoeira');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 03, 'Sao Paulo de Olivenca');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 03, 'Sao Sebastiao do Uatuma');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 03, 'Silves');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 03, 'Tabatinga');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 03, 'Tapaua');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 03, 'Tefe');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 03, 'Tonantins');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 03, 'Uarini');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 03, 'Urucara');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 03, 'Urucurituba');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 03, 'Vila Pitinga');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 04, 'Abacate da Pedreira');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 04, 'Agua Branca do Amapari');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 04, 'Amapa');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 04, 'Amapari');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 04, 'Ambe');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 04, 'Aporema');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 04, 'Ariri');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 04, 'Bailique');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 04, 'Boca do Jari');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 04, 'Calcoene');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 04, 'Cantanzal');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 04, 'Carmo');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 04, 'Clevelandia do Norte');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 04, 'Corre Agua');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 04, 'Cunani');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 04, 'Curiau');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 04, 'Cutias');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 04, 'Fazendinha');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 04, 'Ferreira Gomes');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 04, 'Fortaleza');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 04, 'Gaivota');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 04, 'Gurupora');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 04, 'Vila Velha');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 04, 'Vitoria do Jari');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 05, 'Abadia');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 05, 'Abaira');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 05, 'Abare');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 05, 'Abelhas');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 05, 'Abobora');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 05, 'Abrantes');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 05, 'Acajutiba');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 05, 'Acu da Torre');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 05, 'Acudina');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 05, 'Acupe');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 05, 'Adustina');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 05, 'Afligidos');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 05, 'Afranio Peixoto');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 05, 'Agua Doce');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 05, 'Agua Fria');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 05, 'Aguas do Paulista');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 06, 'Anjinhos');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 06, 'Antonina do Norte');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 06, 'Antonio Bezerra');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 06, 'Antonio Diogo');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 06, 'Antonio Marques');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 06, 'Aprazivel');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 06, 'Apuiares');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 06, 'Aquinopolis');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 06, 'Aquiraz');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 06, 'Aracas');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 06, 'Aracati');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 06, 'Aracatiacu');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 06, 'Aracatiara');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 06, 'Aracoiaba');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 06, 'Arajara');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 06, 'Aranau');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 06, 'Arapa');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 06, 'Arapari');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 07, 'Brasilia');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 07, 'Brazlandia');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 07, 'Candangolandia');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 07, 'Ceilandia');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 07, 'Cruzeiro');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 07, 'Gama');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 07, 'Guara');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 07, 'Lago Norte');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 07, 'Lago Sul');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 07, 'Nucleo Bandeirante');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 07, 'Paranoa');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 07, 'Planaltina');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 07, 'Recanto das Emas');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 07, 'Riacho Fundo');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 07, 'Samambaia');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 07, 'Santa Maria');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 07, 'Sao Sebastiao');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 07, 'Sobradinho');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 07, 'Taguatinga');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 08, 'Acioli');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 08, 'Afonso Claudio');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 08, 'Agha');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 08, 'Agua Doce do Norte');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 08, 'Aguia Branca');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 08, 'Airituba');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 08, 'Alegre');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 08, 'Alfredo Chaves');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 08, 'Alto Calcado');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 08, 'Alto Caldeirao');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 08, 'Alto Mutum Preto');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 08, 'Alto Rio Novo');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 08, 'Alto Santa Maria');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 08, 'Anchieta');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 08, 'Angelo Frechiani');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 08, 'Anutiba');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 08, 'Apiaca');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 08, 'Aracatiba');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 08, 'Arace');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 08, 'Aracruz');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 08, 'Aracui');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 08, 'Araguaia');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 09, 'Brazabrantes');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 09, 'Britania');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 09, 'Buenolandia');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 09, 'Buriti Alegre');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 09, 'Buriti de Goias');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 09, 'Buritinopolis');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 09, 'Cabeceiras');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 09, 'Cachoeira Alta');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 09, 'Cachoeira de Goias');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 09, 'Cachoeira Dourada');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 09, 'Cacu');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 09, 'Caiaponia');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 09, 'Caicara');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 09, 'Calcilandia');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 09, 'Caldas Novas');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 09, 'Caldazinha');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 09, 'Calixto');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 09, 'Campestre de Goias');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 09, 'Campinacu');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 09, 'Campinorte');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 09, 'Campo Alegre de Goias');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 09, 'Campo Limpo');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 09, 'Campolandia');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 09, 'Campos Belos');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 09, 'Campos Verdes');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 09, 'Cana Brava');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 09, 'Canada');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 09, 'Capelinha');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 09, 'Caraiba');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 09, 'Carmo do Rio Verde');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 09, 'Castelandia');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 09, 'Castrinopolis');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 09, 'Catalao');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 09, 'Caturai');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 09, 'Cavalcante');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 09, 'Cavalheiro');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 10, 'Sao Joao dos Patos');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 10, 'Sao Joaquim dos Melos');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 10, 'Sao Jose de Ribamar');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 10, 'Sao Jose dos Basilios');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 10, 'Sao Luis');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 10, 'Sao Luis Gonzaga do Maranhao');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 10, 'Sao Mateus do Maranhao');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 10, 'Sao Pedro da Agua Branca');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 10, 'Sao Pedro dos Crentes');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 10, 'Sao Raimundo das Mangabeiras');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 10, 'Sao Raimundo de Codo');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 10, 'Sao Raimundo do Doca Bezerra');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 10, 'Sao Roberto');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 10, 'Sao Vicente Ferrer');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 10, 'Satubinha');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 10, 'Senador Alexandre Costa');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 10, 'Senador La Rocque');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 10, 'Serrano do Maranhao');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 10, 'Sitio Novo');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 10, 'Sucupira do Norte');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 10, 'Ze Doca');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 11, 'Abadia dos Dourados');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 11, 'Abaete');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 11, 'Abaete dos Mendes');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 11, 'Abaiba');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 11, 'Abre Campo');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 11, 'Abreus');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 11, 'Acaiaca');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 11, 'Acucena');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 11, 'Acurui');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 11, 'Adao Colares');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 11, 'Agua Boa');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 11, 'Agua Branca de Minas');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 11, 'Agua Comprida');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 11, 'Agua Viva');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 11, 'Aguanil');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 11, 'Aguas de Araxa');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 11, 'Aguas de Contendas');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 11, 'Aguas Ferreas');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 11, 'Aguas Formosas');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 11, 'Aguas Vermelhas');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 11, 'Aimores');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 11, 'Aiuruoca');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 11, 'Alagoa');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 11, 'Albertina');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 11, 'Alberto Isaacson');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 11, 'Albertos');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 11, 'Aldeia');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 11, 'Alegre');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 11, 'Alegria');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 11, 'Alem Paraiba');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 11, 'Alexandrita');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 11, 'Alfenas');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 11, 'Alfredo Vasconcelos');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 11, 'Almeida');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 11, 'Almenara');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 11, 'Alpercata');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 11, 'Alpinopolis');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 11, 'Alterosa');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 11, 'Alto Caparao');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 11, 'Alto Capim');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 11, 'Alto de Santa Helena');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 11, 'Alto Jequitiba');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 11, 'Alto Maranhao');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 11, 'Alto Rio Doce');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 11, 'Altolandia');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 11, 'Alvacao');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 11, 'Alvarenga');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 11, 'Alvinopolis');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 11, 'Alvorada');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 11, 'Alvorada de Minas');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 11, 'Amanda');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 12, 'Arvore Grande');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 12, 'Baianopolis');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 12, 'Balsamo');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 12, 'Bandeirantes');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 12, 'Bataguassu');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 12, 'Bataipora');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 12, 'Baus');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 12, 'Bela Vista');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 12, 'Bocaja');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 12, 'Bodoquena');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 12, 'Bom Fim');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 12, 'Bonito');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 12, 'Boqueirao');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 12, 'Brasilandia');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 12, 'Caarapo');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 13, 'Campo Verde');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 13, 'Campos de Julio');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 13, 'Campos Novos');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 13, 'Canabrava do Norte');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 13, 'Canarana');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 13, 'Cangas');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 13, 'Capao Grande');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 13, 'Capao Verde');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 13, 'Caramujo');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 13, 'Caravagio');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 13, 'Carlinda');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 13, 'Cassununga');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 13, 'Castanheira');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 13, 'Catuai');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 13, 'Chapada dos Guimaraes');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 13, 'Cidade Morena');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 14, 'Araquaim');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 14, 'Arco-iris');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 14, 'Areias');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 14, 'Arumanduba');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 14, 'Aruri');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 14, 'Aturiai');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 14, 'Augusto Correa');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 14, 'Aurora do Para');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 14, 'Aveiro');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 14, 'Bagre');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 14, 'Baiao');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 14, 'Bannach');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 14, 'Barcarena');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 14, 'Barreira Branca');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 14, 'Barreira dos Campos');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 14, 'Barreiras');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 14, 'Baturite');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 14, 'Beja');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 14, 'Bela Vista do Caracol');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 14, 'Belem');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 15, 'Brejo dos Santos');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 15, 'Caapora');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 15, 'Cabaceiras');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 15, 'Cabedelo');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 15, 'Cachoeira');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 15, 'Cachoeira dos Indios');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 15, 'Cachoeirinha');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 15, 'Cacimba de Areia');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 15, 'Cacimba de Dentro');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 15, 'Cacimbas');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 15, 'Caicara');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 15, 'Cajazeiras');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 15, 'Cajazeirinhas');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 15, 'Caldas Brandao');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 15, 'Camalau');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 15, 'Campina Grande');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 15, 'Campo Alegre');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 15, 'Campo Grande');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 15, 'Camurupim');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 15, 'Capim');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 16, 'Bengalas');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 16, 'Bentivi');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 16, 'Bernardo Vieira');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 16, 'Betania');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 16, 'Bezerros');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 16, 'Bizarra');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 16, 'Boas Novas');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 16, 'Bodoco');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 16, 'Bom Conselho');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 16, 'Bom Jardim');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 16, 'Bom Nome');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 16, 'Bonfim');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 16, 'Bonito');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 16, 'Brejao');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 16, 'Brejinho');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 16, 'Brejo da Madre de Deus');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 17, 'Campinas do Piaui');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 17, 'Campo Alegre do Fidalgo');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 17, 'Campo Grande do Piaui');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 17, 'Campo Largo do Piaui');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 17, 'Campo Maior');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 17, 'Canavieira');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 17, 'Canto do Buriti');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 17, 'Capitao de Campos');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 17, 'Capitao Gervasio Oliveira');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 17, 'Caracol');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 17, 'Caraubas do Piaui');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 17, 'Caridade do Piaui');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 17, 'Castelo do Piaui');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 17, 'Caxingo');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 17, 'Cocal');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 17, 'Cocal de Telha');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 17, 'Cocal dos Alves');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 17, 'Coivaras');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 17, 'Colonia do Gurgueia');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 17, 'Colonia do Piaui');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 17, 'Conceicao do Caninde');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 17, 'Coronel Jose Dias');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 17, 'Corrente');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 18, 'Aquidaban');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 18, 'Aranha');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 18, 'Cascatinha');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 18, 'Cascavel');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 18, 'Castro');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 18, 'Catanduvas');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 18, 'Catanduvas do Sul');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 18, 'Catarinenses');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 18, 'Caxambu');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 18, 'Cedro');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 18, 'Centenario');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 18, 'Centenario do Sul');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 18, 'Central Lupion');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 18, 'Centralito');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 18, 'Centro Novo');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 18, 'Cerne');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 18, 'Cerrado Grande');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 18, 'Cerro Azul');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 18, 'Cerro Velho');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 18, 'Ceu Azul');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 18, 'Chopinzinho');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 18, 'Cianorte');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 18, 'Cidade Gaucha');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 18, 'Cintra Pimentel');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 18, 'Clevelandia');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 18, 'Coitinho');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 18, 'Colombo');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 18, 'Colonia Acioli');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 18, 'Colonia Castelhanos');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 18, 'Colonia Castrolanda');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 18, 'Colonia Centenario');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 18, 'Colonia Cristina');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 18, 'Colonia Dom Carlos');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 18, 'Colonia Esperanca');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 18, 'Curitiba');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 18, 'Curiuva');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 18, 'Curucaca');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 18, 'Deputado Jose Afonso');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 18, 'Despique');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 18, 'Despraiado');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 18, 'Dez de Maio');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 18, 'Diamante');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 18, 'Diamante D''oeste');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 18, 'Diamante do Norte');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 18, 'Diamante do Sul');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 18, 'Doce Grande');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 18, 'Dois Irmaos');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 18, 'Dois Marcos');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 18, 'Dois Vizinhos');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 18, 'Dom Rodrigo');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 18, 'Dorizon');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 19, 'Cantagalo');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 19, 'Carabucu');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 19, 'Carapebus');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 19, 'Cardoso Moreira');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 19, 'Carmo');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 19, 'Cascatinha');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 19, 'Casimiro de Abreu');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 19, 'Cava');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 19, 'Coelho da Rocha');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 19, 'Colonia');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 19, 'Comendador Levy Gasparian');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 19, 'Comendador Venancio');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 19, 'Conceicao de Jacarei');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 19, 'Conceicao de Macabu');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 19, 'Conrado');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 19, 'Conselheiro Paulino');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 19, 'Conservatoria');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 19, 'Cordeiro');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 19, 'Coroa Grande');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 19, 'Correas');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 19, 'Corrego da Prata');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 19, 'Corrego do Ouro');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 19, 'Correntezas');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 20, 'Galinhos');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 20, 'Gameleira');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 20, 'Goianinha');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 20, 'Governador Dix-sept Rosado');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 20, 'Grossos');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 20, 'Guamare');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 20, 'Ielmo Marinho');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 20, 'Igreja Nova');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 20, 'Ipanguacu');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 20, 'Ipiranga');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 20, 'Ipueira');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 20, 'Itaja');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 20, 'Itau');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 20, 'Jacana');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 20, 'Jandaira');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 20, 'Janduis');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 20, 'Japi');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 20, 'Jardim de Angicos');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 20, 'Jardim de Piranhas');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 20, 'Jardim do Serido');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 20, 'Joao Camara');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 20, 'Vicosa');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 20, 'Vila Flor');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 21, 'Rio Crespo');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 21, 'Riozinho');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 21, 'Rolim de Moura');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 21, 'Santa Luzia do Oeste');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 21, 'Sao Felipe D''oeste');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 21, 'Sao Francisco do Guapore');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 21, 'Sao Miguel do Guapore');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 21, 'Seringueiras');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 21, 'Tabajara');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 21, 'Teixeiropolis');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 21, 'Theobroma');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 21, 'Urupa');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 21, 'Vale do Anari');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 21, 'Vale do Paraiso');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 21, 'Vila Extrema');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 21, 'Vilhena');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 21, 'Vista Alegre do Abuna');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 22, 'Alto Alegre');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 22, 'Amajari');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 22, 'Boa Vista');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 22, 'Bonfim');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 22, 'Canta');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 22, 'Caracarai');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 22, 'Caroebe');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 22, 'Iracema');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 22, 'Mucajai');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 22, 'Normandia');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 22, 'Pacaraima');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 22, 'Rorainopolis');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 22, 'Sao Joao da Baliza');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 22, 'Sao Luiz');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 22, 'Uiramuta');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 23, 'Acegua');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 23, 'Afonso Rodrigues');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 23, 'Agua Santa');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 23, 'Aguas Claras');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 23, 'Agudo');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 23, 'Ajuricaba');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 23, 'Albardao');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 23, 'Alecrim');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 23, 'Alegrete');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 23, 'Alegria');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 23, 'Alfredo Brenner');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 23, 'Almirante Tamandare');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 23, 'Alpestre');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 23, 'Alto Alegre');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 23, 'Alto da Uniao');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 23, 'Alto Feliz');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 23, 'Alto Paredao');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 23, 'Alto Recreio');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 23, 'Alto Uruguai');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 23, 'Alvorada');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 23, 'Amaral Ferrador');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 23, 'Ametista do Sul');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 23, 'Andre da Rocha');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 23, 'Anta Gorda');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 23, 'Antonio Kerpel');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 23, 'Antonio Prado');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 23, 'Arambare');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 23, 'Ararica');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 23, 'Aratiba');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 23, 'Arco Verde');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 24, 'Apiuna');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 24, 'Arabuta');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 24, 'Araquari');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 24, 'Ararangua');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 24, 'Armazem');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 24, 'Arnopolis');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 24, 'Arroio Trinta');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 24, 'Arvoredo');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 24, 'Ascurra');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 24, 'Atalanta');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 24, 'Aterrado Torto');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 24, 'Aurora');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 24, 'Azambuja');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 24, 'Baia Alta');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 24, 'Balneario Arroio do Silva');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 24, 'Balneario Barra do Sul');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 24, 'Balneario Camboriu');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 24, 'Balneario Gaivota');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 24, 'Balneario Morro dos Conventos');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 24, 'Bandeirante');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 24, 'Barra Bonita');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 24, 'Barra Clara');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 25, 'Riachao do Dantas');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 25, 'Riachuelo');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 25, 'Ribeiropolis');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 25, 'Rosario do Catete');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 25, 'Salgado');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 25, 'Samambaia');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 25, 'Santa Luzia do Itanhy');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 25, 'Santa Rosa de Lima');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 25, 'Santana do Sao Francisco');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 25, 'Santo Amaro das Brotas');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 25, 'Sao Cristovao');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 25, 'Sao Domingos');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 25, 'Sao Francisco');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 25, 'Sao Jose');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 25, 'Sao Mateus da Palestina');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 25, 'Sao Miguel do Aleixo');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 25, 'Simao Dias');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 25, 'Siriri');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 25, 'Telha');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 25, 'Tobias Barreto');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 25, 'Tomar do Geru');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 25, 'Umbauba');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Adamantina');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Adolfo');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Agisse');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Agua Vermelha');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Aguai');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Aguas da Prata');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Aguas de Lindoia');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Aguas de Santa Barbara');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Aguas de Sao Pedro');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Agudos');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Agulha');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Ajapi');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Alambari');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Alberto Moreira');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Aldeia');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Aldeia de Carapicuiba');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Alfredo Guedes');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Alfredo Marcondes');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Altair');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Altinopolis');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Alto Alegre');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Alto Pora');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Aluminio');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Alvares Florence');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Alvares Machado');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Alvaro de Carvalho');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Alvinlandia');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Amadeu Amaral');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Amandaba');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Ameliopolis');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Americana');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Americo Brasiliense');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Americo de Campos');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Amparo');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Ana Dias');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Analandia');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Anapolis');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Andes');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Andradina');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Angatuba');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Anhembi');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Anhumas');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Aparecida');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Aparecida D''oeste');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Aparecida de Monte Alto');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Aparecida de Sao Manuel');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Sao Lourenco do Turvo');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Sao Luis do Paraitinga');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Sao Luiz do Guaricanga');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Sao Manuel');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Sao Martinho D''oeste');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Sao Miguel Arcanjo');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Sao Paulo');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Sao Pedro');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Sao Pedro do Turvo');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Sao Roque');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 26, 'Sao Roque da Fartura');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 27, 'Monte do Carmo');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 27, 'Monte Lindo');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 27, 'Monte Santo do Tocantins');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 27, 'Mosquito');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 27, 'Muricilandia');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 27, 'Natal');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 27, 'Natividade');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 27, 'Nazare');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 27, 'Nova Olinda');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 27, 'Nova Rosalandia');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 27, 'Novo Acordo');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 27, 'Novo Alegre');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 27, 'Novo Horizonte');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 27, 'Novo Jardim');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 27, 'Oliveira de Fatima');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 27, 'Palmas');
INSERT INTO `beibe`.`tb_cidade` VALUES (null, 27, 'Palmeirante');

INSERT INTO tb_usuario VALUES(NULL, 'Beibe ADMIN','09922334512','admin','passwd','41989852525','Rua Colombo',111,null,'Bairro Novo','81310000','F',22);

INSERT INTO tb_usuario VALUES(NULL, 'Beibe ADMIN','09922334512','admin','passwd','41989852525','Rua Colombo',111,null,'Bairro Novo','81310000','F',22);
INSERT INTO tb_usuario VALUES(NULL, 'Beibe cliente','09922334512','cliente','passwd','41989852525','Rua Colombo',111,null,'Bairro Novo','81310000','F',22);