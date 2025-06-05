-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Tempo de geração: 05/06/2025 às 14:07
-- Versão do servidor: 9.0.1
-- Versão do PHP: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bancodedados`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `cidade`
--

CREATE TABLE `cidade` (
  `codCidade` int NOT NULL,
  `nome` varchar(50) NOT NULL,
  `siglaEstado` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `classe`
--

CREATE TABLE `classe` (
  `codClasse` int NOT NULL,
  `sigla` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nome` varchar(40) NOT NULL,
  `descricao` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `codCliente` int NOT NULL,
  `endereco` varchar(60) DEFAULT NULL,
  `codCidade` int NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `tipo` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `dataCadastro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cep` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `clienteFisico`
--

CREATE TABLE `clienteFisico` (
  `codCliente` int NOT NULL,
  `nome` varchar(50) NOT NULL,
  `dataNascimento` date DEFAULT NULL,
  `cpf` varchar(11) NOT NULL,
  `rg` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `clienteJuridico`
--

CREATE TABLE `clienteJuridico` (
  `codCliente` int NOT NULL,
  `nomeFantasia` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `razaoSocial` varchar(80) NOT NULL,
  `ie` varchar(20) NOT NULL,
  `cgc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `contasPagar`
--

CREATE TABLE `contasPagar` (
  `codTitulo` int NOT NULL,
  `dataVencimento` date NOT NULL,
  `parcela` int NOT NULL,
  `codPedido` int NOT NULL,
  `valor` decimal(20,0) NOT NULL,
  `dataPagamento` date NOT NULL,
  `localPagamento` varchar(80) NOT NULL,
  `juros` decimal(12,2) NOT NULL,
  `correcaoMonetaria` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `contasReceber`
--

CREATE TABLE `contasReceber` (
  `codTitulo` int NOT NULL,
  `dataVencimento` date NOT NULL,
  `codVenda` int NOT NULL,
  `parcela` int DEFAULT NULL,
  `valor` decimal(20,2) DEFAULT NULL,
  `dataPagamento` date DEFAULT NULL,
  `localPagamento` varchar(80) DEFAULT NULL,
  `juros` decimal(12,2) DEFAULT NULL,
  `correcaoMonetaria` decimal(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `departamento`
--

CREATE TABLE `departamento` (
  `codDepartamento` int NOT NULL,
  `nome` varchar(40) NOT NULL,
  `descricaoFuncional` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `localizacao` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `estado`
--

CREATE TABLE `estado` (
  `siglaEstado` char(2) NOT NULL,
  `nome` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `fornecedor`
--

CREATE TABLE `fornecedor` (
  `codFornecedor` int NOT NULL,
  `nomeFantasia` varchar(80) NOT NULL,
  `razaoSocial` varchar(80) NOT NULL,
  `ie` varchar(20) NOT NULL,
  `cgc` varchar(20) NOT NULL,
  `endereco` varchar(60) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `codCidade` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `itemPedido`
--

CREATE TABLE `itemPedido` (
  `codPedido` int NOT NULL,
  `codProduto` int NOT NULL,
  `quantidade` decimal(14,2) NOT NULL
) ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `itemVenda`
--

CREATE TABLE `itemVenda` (
  `codVenda` int NOT NULL,
  `codProduto` int NOT NULL,
  `numeroLote` int NOT NULL,
  `quantidade` decimal(14,2) NOT NULL
) ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido`
--

CREATE TABLE `pedido` (
  `codPedido` int NOT NULL,
  `dataRealizacao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dataEntrega` date DEFAULT NULL,
  `codFornecedor` int DEFAULT NULL,
  `valor` decimal(20,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

CREATE TABLE `produto` (
  `codProduto` int NOT NULL,
  `descrição` varchar(40) NOT NULL,
  `unidadeMedida` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `embalagem` varchar(15) NOT NULL DEFAULT 'Fardo',
  `codClasse` int DEFAULT NULL,
  `precoVenda` decimal(14,2) DEFAULT NULL,
  `estoqueMinimo` decimal(14,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtoLote`
--

CREATE TABLE `produtoLote` (
  `codProduto` int NOT NULL,
  `numeroLote` int NOT NULL,
  `quantidadeAdquirida` decimal(14,2) DEFAULT NULL,
  `quantidadeVendida` decimal(14,2) DEFAULT NULL,
  `precoCusto` decimal(14,2) DEFAULT NULL,
  `dataValidade` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `venda`
--

CREATE TABLE `venda` (
  `codVenda` int NOT NULL,
  `codCliente` int DEFAULT NULL,
  `codVendedor` int DEFAULT NULL,
  `dataVenda` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `enderecoEntrega` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `vendedor`
--

CREATE TABLE `vendedor` (
  `codVendedor` int NOT NULL,
  `nome` varchar(60) NOT NULL,
  `dataNascimento` date DEFAULT NULL,
  `endereco` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `cep` int DEFAULT NULL,
  `telefone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `codCidade` int DEFAULT NULL,
  `dataContratacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `codDepartamento` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cidade`
--
ALTER TABLE `cidade`
  ADD PRIMARY KEY (`codCidade`) USING BTREE,
  ADD UNIQUE KEY `nome` (`nome`),
  ADD UNIQUE KEY `siglaEstado` (`siglaEstado`);

--
-- Índices de tabela `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`codClasse`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`codCliente`),
  ADD KEY `fk_cli_cid` (`codCidade`);

--
-- Índices de tabela `clienteFisico`
--
ALTER TABLE `clienteFisico`
  ADD PRIMARY KEY (`codCliente`),
  ADD UNIQUE KEY `cpf` (`cpf`,`rg`);

--
-- Índices de tabela `clienteJuridico`
--
ALTER TABLE `clienteJuridico`
  ADD PRIMARY KEY (`codCliente`),
  ADD UNIQUE KEY `nomeFantasia` (`nomeFantasia`,`razaoSocial`,`ie`,`cgc`);

--
-- Índices de tabela `contasPagar`
--
ALTER TABLE `contasPagar`
  ADD PRIMARY KEY (`codTitulo`),
  ADD KEY `codPedido` (`codPedido`);

--
-- Índices de tabela `contasReceber`
--
ALTER TABLE `contasReceber`
  ADD PRIMARY KEY (`codTitulo`),
  ADD KEY `codVenda` (`codVenda`);

--
-- Índices de tabela `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`codDepartamento`),
  ADD UNIQUE KEY `nome` (`nome`),
  ADD UNIQUE KEY `nome_2` (`nome`);

--
-- Índices de tabela `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`siglaEstado`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Índices de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`codFornecedor`),
  ADD UNIQUE KEY `nomeFantasia` (`nomeFantasia`),
  ADD UNIQUE KEY `razaoSocial` (`razaoSocial`),
  ADD UNIQUE KEY `ie` (`ie`),
  ADD UNIQUE KEY `cgc` (`cgc`),
  ADD UNIQUE KEY `nomeFantasia_2` (`nomeFantasia`),
  ADD UNIQUE KEY `razaoSocial_2` (`razaoSocial`,`ie`,`cgc`),
  ADD KEY `codCidade` (`codCidade`);

--
-- Índices de tabela `itemPedido`
--
ALTER TABLE `itemPedido`
  ADD PRIMARY KEY (`codPedido`,`codProduto`);

--
-- Índices de tabela `itemVenda`
--
ALTER TABLE `itemVenda`
  ADD PRIMARY KEY (`codVenda`,`codProduto`,`numeroLote`),
  ADD KEY `codProduto` (`codProduto`,`numeroLote`);

--
-- Índices de tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`codPedido`),
  ADD KEY `codFornecedor` (`codFornecedor`);

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`codProduto`),
  ADD KEY `codClasse` (`codClasse`);

--
-- Índices de tabela `produtoLote`
--
ALTER TABLE `produtoLote`
  ADD PRIMARY KEY (`codProduto`,`numeroLote`);

--
-- Índices de tabela `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`codVenda`),
  ADD KEY `codCliente` (`codCliente`),
  ADD KEY `codVendedor` (`codVendedor`);

--
-- Índices de tabela `vendedor`
--
ALTER TABLE `vendedor`
  ADD PRIMARY KEY (`codVendedor`),
  ADD KEY `codCidade` (`codCidade`),
  ADD KEY `codDepartamento` (`codDepartamento`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cidade`
--
ALTER TABLE `cidade`
  MODIFY `codCidade` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `classe`
--
ALTER TABLE `classe`
  MODIFY `codClasse` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `departamento`
--
ALTER TABLE `departamento`
  MODIFY `codDepartamento` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `codPedido` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `codProduto` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `vendedor`
--
ALTER TABLE `vendedor`
  MODIFY `codVendedor` int NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `cidade`
--
ALTER TABLE `cidade`
  ADD CONSTRAINT `cidade_ibfk_1` FOREIGN KEY (`siglaEstado`) REFERENCES `estado` (`siglaEstado`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Restrições para tabelas `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`codCliente`) REFERENCES `cidade` (`codCidade`),
  ADD CONSTRAINT `cliente_ibfk_2` FOREIGN KEY (`codCidade`) REFERENCES `cidade` (`codCidade`),
  ADD CONSTRAINT `fk_cli_cid` FOREIGN KEY (`codCidade`) REFERENCES `cidade` (`codCidade`) ON UPDATE CASCADE;

--
-- Restrições para tabelas `clienteFisico`
--
ALTER TABLE `clienteFisico`
  ADD CONSTRAINT `clienteFisico_ibfk_1` FOREIGN KEY (`codCliente`) REFERENCES `cliente` (`codCliente`),
  ADD CONSTRAINT `fk_clif_clie` FOREIGN KEY (`codCliente`) REFERENCES `cliente` (`codCliente`) ON UPDATE CASCADE;

--
-- Restrições para tabelas `clienteJuridico`
--
ALTER TABLE `clienteJuridico`
  ADD CONSTRAINT `clienteJuridico_ibfk_1` FOREIGN KEY (`codCliente`) REFERENCES `cliente` (`codCliente`),
  ADD CONSTRAINT `fk_clieJ_clie` FOREIGN KEY (`codCliente`) REFERENCES `cliente` (`codCliente`) ON UPDATE CASCADE;

--
-- Restrições para tabelas `contasPagar`
--
ALTER TABLE `contasPagar`
  ADD CONSTRAINT `contasPagar_ibfk_1` FOREIGN KEY (`codPedido`) REFERENCES `pedido` (`codPedido`);

--
-- Restrições para tabelas `contasReceber`
--
ALTER TABLE `contasReceber`
  ADD CONSTRAINT `contasReceber_ibfk_1` FOREIGN KEY (`codVenda`) REFERENCES `venda` (`codVenda`);

--
-- Restrições para tabelas `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD CONSTRAINT `fornecedor_ibfk_1` FOREIGN KEY (`codCidade`) REFERENCES `cidade` (`codCidade`);

--
-- Restrições para tabelas `itemVenda`
--
ALTER TABLE `itemVenda`
  ADD CONSTRAINT `itemVenda_ibfk_1` FOREIGN KEY (`codVenda`) REFERENCES `venda` (`codVenda`),
  ADD CONSTRAINT `itemVenda_ibfk_2` FOREIGN KEY (`codProduto`,`numeroLote`) REFERENCES `produtoLote` (`codProduto`, `numeroLote`);

--
-- Restrições para tabelas `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`codFornecedor`) REFERENCES `fornecedor` (`codFornecedor`);

--
-- Restrições para tabelas `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`codClasse`) REFERENCES `classe` (`codClasse`);

--
-- Restrições para tabelas `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `venda_ibfk_1` FOREIGN KEY (`codCliente`) REFERENCES `cliente` (`codCliente`),
  ADD CONSTRAINT `venda_ibfk_2` FOREIGN KEY (`codVendedor`) REFERENCES `vendedor` (`codVendedor`);

--
-- Restrições para tabelas `vendedor`
--
ALTER TABLE `vendedor`
  ADD CONSTRAINT `vendedor_ibfk_1` FOREIGN KEY (`codCidade`) REFERENCES `cidade` (`codCidade`),
  ADD CONSTRAINT `vendedor_ibfk_2` FOREIGN KEY (`codDepartamento`) REFERENCES `departamento` (`codDepartamento`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
