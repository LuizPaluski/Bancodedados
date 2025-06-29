-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Tempo de geração: 06/06/2025 às 14:19
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
-- Banco de dados: `banconovo`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `cidade`
--

CREATE TABLE `cidade` (
  `codCidade` int NOT NULL,
  `nome` varchar(50) NOT NULL,
  `siglaEstado` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `cidade`
--

INSERT INTO `cidade` (`codCidade`, `nome`, `siglaEstado`) VALUES
(1, 'Guarapuava', 'PR'),
(2, 'Florianopolis', 'SC'),
(3, 'Curitiba', 'PR'),
(4, 'Apucarana', 'PR');

-- --------------------------------------------------------

--
-- Estrutura para tabela `classe`
--

CREATE TABLE `classe` (
  `codClasse` int NOT NULL,
  `sigla` varchar(12) DEFAULT NULL,
  `nome` varchar(40) NOT NULL,
  `descricao` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `classe`
--

INSERT INTO `classe` (`codClasse`, `sigla`, `nome`, `descricao`) VALUES
(1, 'Acab', 'Acabamentos', 'acabamentos hehe'),
(2, 'Com', 'Comida', 'comidas diferenciadas');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `codCliente` int NOT NULL,
  `endereco` varchar(60) DEFAULT NULL,
  `codCidade` int NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `tipo` char(1) DEFAULT NULL,
  `dataCadastro` date DEFAULT (curdate()),
  `cep` char(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`codCliente`, `endereco`, `codCidade`, `telefone`, `tipo`, `dataCadastro`, `cep`) VALUES
(1, 'Rua Marechal Floriano, 56', 1, '123455', 'F', '1988-01-09', '85012090'),
(2, 'Rua Marechal Floriano, 57', 1, '123455', 'F', '1988-01-09', '85012090'),
(3, 'Rua Marechal Floriano, 56', 1, '123455', 'J', '1988-01-09', '85012090');

-- --------------------------------------------------------

--
-- Estrutura para tabela `clienteFisico`
--

CREATE TABLE `clienteFisico` (
  `codCliente` int NOT NULL,
  `nome` varchar(50) NOT NULL,
  `dataNascimento` date DEFAULT NULL,
  `cpf` varchar(11) NOT NULL,
  `rg` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `clienteFisico`
--

INSERT INTO `clienteFisico` (`codCliente`, `nome`, `dataNascimento`, `cpf`, `rg`) VALUES
(1, 'Cleber', '2000-10-10', '12345678900', '12345678'),
(2, 'Rosa', '2001-10-10', '12345678901', '12345678');

-- --------------------------------------------------------

--
-- Estrutura para tabela `clienteJuridico`
--

CREATE TABLE `clienteJuridico` (
  `codCliente` int NOT NULL,
  `nomeFantasia` varchar(80) DEFAULT NULL,
  `razaoSocial` varchar(80) NOT NULL,
  `ie` varchar(20) NOT NULL,
  `cgc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `clienteJuridico`
--

INSERT INTO `clienteJuridico` (`codCliente`, `nomeFantasia`, `razaoSocial`, `ie`, `cgc`) VALUES
(3, 'Gelinski', 'Gelinski da silva', 'aaa', 'bbb');

-- --------------------------------------------------------

--
-- Estrutura para tabela `contasPagar`
--

CREATE TABLE `contasPagar` (
  `codTitulo` int NOT NULL,
  `dataVencimento` date NOT NULL,
  `parcela` int DEFAULT NULL,
  `codPedido` int DEFAULT NULL,
  `valor` decimal(20,2) DEFAULT NULL,
  `dataPagamento` date DEFAULT NULL,
  `localPagamento` varchar(80) DEFAULT NULL,
  `juros` decimal(12,2) DEFAULT NULL,
  `correcaoMonetaria` decimal(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `contasPagar`
--

INSERT INTO `contasPagar` (`codTitulo`, `dataVencimento`, `parcela`, `codPedido`, `valor`, `dataPagamento`, `localPagamento`, `juros`, `correcaoMonetaria`) VALUES
(1, '2020-10-10', 1, 1, 10.00, '1234-09-29', 'loteria', 40.00, 30.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `contasReceber`
--

CREATE TABLE `contasReceber` (
  `codTitulo` int NOT NULL,
  `dataVencimento` date NOT NULL,
  `codVenda` int NOT NULL,
  `parcela` int DEFAULT NULL,
  `codPedido` int DEFAULT NULL,
  `valor` decimal(20,2) DEFAULT NULL,
  `dataPagamento` date DEFAULT NULL,
  `localPagamento` varchar(80) DEFAULT NULL,
  `juros` decimal(12,2) DEFAULT NULL,
  `correcaoMonetaria` decimal(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `contasReceber`
--

INSERT INTO `contasReceber` (`codTitulo`, `dataVencimento`, `codVenda`, `parcela`, `codPedido`, `valor`, `dataPagamento`, `localPagamento`, `juros`, `correcaoMonetaria`) VALUES
(1, '2000-10-10', 1, 1, 1, 20.00, '2000-11-11', 'loteria', 50.00, 50.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `departamento`
--

CREATE TABLE `departamento` (
  `codDepartamento` int NOT NULL,
  `nome` varchar(40) NOT NULL,
  `descricaoFuncional` varchar(80) DEFAULT NULL,
  `localizacao` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `departamento`
--

INSERT INTO `departamento` (`codDepartamento`, `nome`, `descricaoFuncional`, `localizacao`) VALUES
(1, 'JD', 'Juridico', 'Predio 3C, Sala 2'),
(2, 'CM', 'Comercial', 'Predio 3C, Sala 3'),
(3, 'PD', 'Produto', 'Predio 3C, Sala 1'),
(4, 'MK', 'Marketing', 'Predio 3C, Sala 4');

-- --------------------------------------------------------

--
-- Estrutura para tabela `estado`
--

CREATE TABLE `estado` (
  `siglaEstado` char(2) NOT NULL,
  `nome` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `estado`
--

INSERT INTO `estado` (`siglaEstado`, `nome`) VALUES
('AC', 'Acre'),
('PR', 'Parana'),
('SC', 'Santa Catarina'),
('SP', 'São Paulo');

-- --------------------------------------------------------

--
-- Estrutura para tabela `fornecedor`
--

CREATE TABLE `fornecedor` (
  `codFornecedor` int NOT NULL,
  `nomeFantasia` varchar(80) DEFAULT NULL,
  `razaoSocial` varchar(80) DEFAULT NULL,
  `ie` varchar(20) NOT NULL,
  `cgc` varchar(20) NOT NULL,
  `endereco` varchar(60) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `codCidade` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `fornecedor`
--

INSERT INTO `fornecedor` (`codFornecedor`, `nomeFantasia`, `razaoSocial`, `ie`, `cgc`, `endereco`, `telefone`, `codCidade`) VALUES
(1, 'Incepa', 'Incepa', 'Incepa', 'Incepa', 'Incepa', '1234675', 1),
(2, 'forn2', 'forn2', 'forn2', 'forn2', 'forn2', '1234675', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `itemPedido`
--

CREATE TABLE `itemPedido` (
  `codPedido` int NOT NULL,
  `codProduto` int NOT NULL,
  `quantidade` decimal(14,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `itemPedido`
--

INSERT INTO `itemPedido` (`codPedido`, `codProduto`, `quantidade`) VALUES
(1, 1, 10.00),
(2, 3, 100.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `itemVenda`
--

CREATE TABLE `itemVenda` (
  `codVenda` int NOT NULL,
  `codProduto` int NOT NULL,
  `numeroLote` int NOT NULL,
  `quantidade` decimal(14,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `itemVenda`
--

INSERT INTO `itemVenda` (`codVenda`, `codProduto`, `numeroLote`, `quantidade`) VALUES
(1, 1, 1, 1.00),
(5, 3, 2, 10.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido`
--

CREATE TABLE `pedido` (
  `codPedido` int NOT NULL,
  `dataRealizacao` date DEFAULT (curdate()),
  `dataEntrega` date DEFAULT NULL,
  `codFornecedor` int DEFAULT NULL,
  `valor` decimal(20,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `pedido`
--

INSERT INTO `pedido` (`codPedido`, `dataRealizacao`, `dataEntrega`, `codFornecedor`, `valor`) VALUES
(1, '2014-10-10', '2014-10-10', 1, 100000.00),
(2, '2014-11-10', '2014-10-10', 2, 9700.00),
(3, '2013-11-10', NULL, 2, 300.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

CREATE TABLE `produto` (
  `codProduto` int NOT NULL,
  `descricao` varchar(40) NOT NULL,
  `unidadeMedida` char(2) DEFAULT NULL,
  `embalagem` varchar(15) DEFAULT 'Fardo',
  `codClasse` int DEFAULT NULL,
  `precoVenda` decimal(14,2) DEFAULT NULL,
  `estoqueMinimo` decimal(14,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `produto`
--

INSERT INTO `produto` (`codProduto`, `descricao`, `unidadeMedida`, `embalagem`, `codClasse`, `precoVenda`, `estoqueMinimo`) VALUES
(1, 'Produto 1', 'Kg', 'Fardo', 2, 100.34, 123.00),
(2, 'Produto 2', 'Kg', 'Fardo', 2, 100.34, 123.00),
(3, 'Cal', 'Kg', 'Fardo', 1, 100.34, 123.00);

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

--
-- Despejando dados para a tabela `produtoLote`
--

INSERT INTO `produtoLote` (`codProduto`, `numeroLote`, `quantidadeAdquirida`, `quantidadeVendida`, `precoCusto`, `dataValidade`) VALUES
(1, 1, 100.00, 50.00, 300.00, '2000-10-10'),
(3, 2, 100.00, 50.00, 300.00, '2000-10-10');

-- --------------------------------------------------------

--
-- Estrutura para tabela `venda`
--

CREATE TABLE `venda` (
  `codVenda` int NOT NULL,
  `codCliente` int DEFAULT NULL,
  `codVendedor` int DEFAULT '100',
  `dataVenda` date DEFAULT (curdate()),
  `enderecoEntrega` varchar(60) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `venda`
--

INSERT INTO `venda` (`codVenda`, `codCliente`, `codVendedor`, `dataVenda`, `enderecoEntrega`, `status`) VALUES
(1, 1, 1, '2004-10-10', 'rua', 'Despachada'),
(2, 1, 1, '2003-10-10', 'rua', 'Despachada'),
(3, 1, 1, '2003-10-10', 'rua', 'Cancelada'),
(4, 3, 2, '2022-10-10', 'casa do cliente', 'Finalizada'),
(5, 1, 1, '2003-10-10', 'rua', 'Finalizada');

-- --------------------------------------------------------

--
-- Estrutura para tabela `vendedor`
--

CREATE TABLE `vendedor` (
  `codVendedor` int NOT NULL,
  `nome` varchar(60) NOT NULL,
  `dataNascimento` date DEFAULT NULL,
  `endereco` varchar(60) DEFAULT NULL,
  `cep` char(8) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `codCidade` int DEFAULT '1',
  `dataContratacao` date DEFAULT (curdate()),
  `codDepartamento` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `vendedor`
--

INSERT INTO `vendedor` (`codVendedor`, `nome`, `dataNascimento`, `endereco`, `cep`, `telefone`, `codCidade`, `dataContratacao`, `codDepartamento`) VALUES
(1, 'João', '2000-03-14', 'Rua Vicente Machado', '85012250', '1234546', 1, '2017-03-14', 1),
(2, 'Maria', '2000-03-24', 'Rua Vicente Machado', '85012250', '1234546', 1, '2017-03-04', 2),
(3, 'Joao de apucarana', '2000-03-24', 'Rua de apucarana', '85012250', '1234546', 4, '2017-03-04', 3);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cidade`
--
ALTER TABLE `cidade`
  ADD PRIMARY KEY (`codCidade`),
  ADD UNIQUE KEY `nome` (`nome`),
  ADD KEY `siglaEstado` (`siglaEstado`);

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
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices de tabela `clienteJuridico`
--
ALTER TABLE `clienteJuridico`
  ADD PRIMARY KEY (`codCliente`),
  ADD UNIQUE KEY `razaoSocial` (`razaoSocial`),
  ADD UNIQUE KEY `ie` (`ie`),
  ADD UNIQUE KEY `cgc` (`cgc`),
  ADD UNIQUE KEY `nomeFantasia` (`nomeFantasia`);

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
  ADD UNIQUE KEY `nome` (`nome`);

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
  ADD UNIQUE KEY `ie` (`ie`),
  ADD UNIQUE KEY `cgc` (`cgc`),
  ADD UNIQUE KEY `nomeFantasia` (`nomeFantasia`),
  ADD UNIQUE KEY `razaoSocial` (`razaoSocial`),
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
  ADD PRIMARY KEY (`codVenda`,`numeroLote`,`codProduto`),
  ADD KEY `fk_itemV_lote` (`codProduto`,`numeroLote`);

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
  ADD KEY `fk_prod_class` (`codClasse`);

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
  ADD KEY `fk_venda_vende` (`codVendedor`),
  ADD KEY `fk_venda_cliente` (`codCliente`);

--
-- Índices de tabela `vendedor`
--
ALTER TABLE `vendedor`
  ADD PRIMARY KEY (`codVendedor`),
  ADD UNIQUE KEY `nome` (`nome`),
  ADD KEY `codDepartamento` (`codDepartamento`),
  ADD KEY `codCidade` (`codCidade`);

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
  MODIFY `codClasse` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `codCliente` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `departamento`
--
ALTER TABLE `departamento`
  MODIFY `codDepartamento` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `codPedido` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `codProduto` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `vendedor`
--
ALTER TABLE `vendedor`
  MODIFY `codVendedor` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `cidade`
--
ALTER TABLE `cidade`
  ADD CONSTRAINT `cidade_ibfk_1` FOREIGN KEY (`siglaEstado`) REFERENCES `estado` (`siglaEstado`) ON UPDATE CASCADE;

--
-- Restrições para tabelas `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `fk_cli_cid` FOREIGN KEY (`codCidade`) REFERENCES `cidade` (`codCidade`) ON UPDATE CASCADE;

--
-- Restrições para tabelas `clienteFisico`
--
ALTER TABLE `clienteFisico`
  ADD CONSTRAINT `fk_clif_clie` FOREIGN KEY (`codCliente`) REFERENCES `cliente` (`codCliente`) ON UPDATE CASCADE;

--
-- Restrições para tabelas `clienteJuridico`
--
ALTER TABLE `clienteJuridico`
  ADD CONSTRAINT `fk_clieJ_clie` FOREIGN KEY (`codCliente`) REFERENCES `cliente` (`codCliente`) ON UPDATE CASCADE;

--
-- Restrições para tabelas `contasPagar`
--
ALTER TABLE `contasPagar`
  ADD CONSTRAINT `contasPagar_ibfk_1` FOREIGN KEY (`codPedido`) REFERENCES `pedido` (`codPedido`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `contasReceber`
--
ALTER TABLE `contasReceber`
  ADD CONSTRAINT `contasReceber_ibfk_1` FOREIGN KEY (`codVenda`) REFERENCES `venda` (`codVenda`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD CONSTRAINT `fornecedor_ibfk_1` FOREIGN KEY (`codCidade`) REFERENCES `cidade` (`codCidade`) ON UPDATE CASCADE;

--
-- Restrições para tabelas `itemPedido`
--
ALTER TABLE `itemPedido`
  ADD CONSTRAINT `fk_ip_pedido` FOREIGN KEY (`codPedido`) REFERENCES `pedido` (`codPedido`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `itemVenda`
--
ALTER TABLE `itemVenda`
  ADD CONSTRAINT `fk_itemV_lote` FOREIGN KEY (`codProduto`,`numeroLote`) REFERENCES `produtoLote` (`codProduto`, `numeroLote`),
  ADD CONSTRAINT `fk_itemV_venda` FOREIGN KEY (`codVenda`) REFERENCES `venda` (`codVenda`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`codFornecedor`) REFERENCES `fornecedor` (`codFornecedor`) ON DELETE CASCADE ON UPDATE SET NULL;

--
-- Restrições para tabelas `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `fk_prod_class` FOREIGN KEY (`codClasse`) REFERENCES `classe` (`codClasse`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Restrições para tabelas `produtoLote`
--
ALTER TABLE `produtoLote`
  ADD CONSTRAINT `fk_prodLote_prod` FOREIGN KEY (`codProduto`) REFERENCES `produto` (`codProduto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `fk_venda_cliente` FOREIGN KEY (`codCliente`) REFERENCES `cliente` (`codCliente`),
  ADD CONSTRAINT `fk_venda_vende` FOREIGN KEY (`codVendedor`) REFERENCES `vendedor` (`codVendedor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `vendedor`
--
ALTER TABLE `vendedor`
  ADD CONSTRAINT `vendedor_ibfk_1` FOREIGN KEY (`codDepartamento`) REFERENCES `departamento` (`codDepartamento`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `vendedor_ibfk_2` FOREIGN KEY (`codCidade`) REFERENCES `cidade` (`codCidade`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;