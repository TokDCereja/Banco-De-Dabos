-- Tabela usuario
CREATE TABLE usuario (
    id_usuario INT PRIMARY KEY IDENTITY,
    tipoDePlano VARCHAR(10) NOT NULL,
    data_Cadastro DATE NOT NULL,
    nome VARCHAR(100) NOT NULL,
    email NVARCHAR(50) NOT NULL,
    senha NVARCHAR(20) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    TipoCadastro VARCHAR(20),
    CHECK(TipoCadastro IN ('Google', 'Facebook')),
    Plano_id_Plano INT FOREIGN KEY REFERENCES Plano(id_Plano)
);

-- Tabela FormaDePagamento
CREATE TABLE FormaDePagamento (
    id_FormaDePagamento INT PRIMARY KEY IDENTITY,
    nomeTitular VARCHAR(50) NOT NULL,
    valor FLOAT NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    TipoPlano VARCHAR(10) NOT NULL,
    datahoraPagamento DATE NOT NULL,
    banco VARCHAR(100) NOT NULL,
    tipoPagamento VARCHAR(11) NOT NULL,
    numeroparcelas INT NOT NULL,
    CHECK (TipoPlano IN ('Basico', 'Premium'))
);

-- Tabela Plano
CREATE TABLE Plano (
    id_Plano INT PRIMARY KEY IDENTITY,
    NomePlano NVARCHAR(50) NOT NULL,
    Preco DECIMAL(18, 2) NOT NULL,
    Descricao NVARCHAR(300) NOT NULL
);

-- Tabela Feedback
CREATE TABLE Feedback (
    id_Feedback INT PRIMARY KEY IDENTITY,
    avaliacao NVARCHAR(300) NOT NULL,
    datafeedback DATE NOT NULL,
    hora TIME NOT NULL,
    usuario_id_usuario INT FOREIGN KEY REFERENCES usuario(id_usuario)
);

-- Tabela Ferramenta
CREATE TABLE Ferramenta (
    id_Ferramenta INT PRIMARY KEY IDENTITY
);

-- Tabela Aprendizado
CREATE TABLE Aprendizado (
    id_Aprendizado INT PRIMARY KEY IDENTITY,
    nome VARCHAR(100) NOT NULL,
    descricao NVARCHAR(300) NOT NULL,
    titulo VARCHAR(50) NOT NULL,
    conteudo VARCHAR(50) NOT NULL,
    dataPublicacao DATE NOT NULL,
    categoria VARCHAR(100) NOT NULL,
    Ferramenta_id_Ferramenta INT FOREIGN KEY REFERENCES Ferramenta(id_Ferramenta)
);

-- Tabela Caixa
CREATE TABLE Caixa (
    id_Caixa INT PRIMARY KEY IDENTITY,
    custoFixo MONEY NOT NULL,
    custoUnidade MONEY NOT NULL,
    totalVenda MONEY NOT NULL,
    fundoDeReserva MONEY NOT NULL,
    capitalDeGiro MONEY NOT NULL,
    DataUltimaAtualizacao DATE NOT NULL,
    Ferramenta_id_Ferramenta INT FOREIGN KEY REFERENCES Ferramenta(id_Ferramenta)
);

-- Tabela Estoque
CREATE TABLE Estoque (
    id_Estoque INT PRIMARY KEY IDENTITY,
    ingrediente VARCHAR(100) NOT NULL,
    quantidadeMin DECIMAL(18, 2) NOT NULL,
    quantidadeMax DECIMAL(18, 2) NOT NULL,
    quantidadeAtual DECIMAL(18, 2) NOT NULL,
    medida VARCHAR(10) NOT NULL,
    DataUltimaAtualizacao DATE NOT NULL,
    Ferramenta_id_Ferramenta INT FOREIGN KEY REFERENCES Ferramenta(id_Ferramenta)
);

-- Tabela Precificacao
CREATE TABLE Precificacao (
    id_Precificacao INT PRIMARY KEY IDENTITY,
    custoReceita DECIMAL(18, 2) NOT NULL,
    maoDeObra DECIMAL(18, 2) NOT NULL,
    custoFixoUnitario DECIMAL(18, 2) NOT NULL,
    custoVariavelUnitario DECIMAL(18, 2) NOT NULL,
    precoVenda DECIMAL(18, 2) NOT NULL,
    margemLucro DECIMAL(18, 2) NOT NULL,
    Ferramenta_id_Ferramenta INT FOREIGN KEY REFERENCES Ferramenta(id_Ferramenta)
);

-- Tabela TabelaNutricional
CREATE TABLE TabelaNutricional (
    id_TabelaNutricional INT PRIMARY KEY IDENTITY,
    NomeReceita VARCHAR(50) NOT NULL,
    Carboidrato DECIMAL(18, 2) NOT NULL,
    Proteina DECIMAL(18, 2) NOT NULL,
    GorduraSaturada DECIMAL(18, 2) NOT NULL,
    GorduraTotais DECIMAL(18, 2) NOT NULL,
    Sodio DECIMAL(18, 2) NOT NULL,
    AcucaresTotais DECIMAL(18, 2) NOT NULL,
    ValorEnergetico DECIMAL(18, 2) NOT NULL,
    porcao NVARCHAR(10) NOT NULL,
    dataFabricacao DATE NOT NULL,
    dataValidade DATE NOT NULL,
    quantidade INT NOT NULL,
    gramas DECIMAL(18, 2) NOT NULL,
    tipoprodutoFinal VARCHAR(50) NOT NULL,
    Ferramenta_id_Ferramenta INT FOREIGN KEY REFERENCES Ferramenta(id_Ferramenta)
);

-- Tabela Agenda
CREATE TABLE Agenda (
    id_agenda INT PRIMARY KEY IDENTITY,
    dataCompromisso DATE NOT NULL,
    hora TIME NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    Ferramenta_id_Ferramenta INT FOREIGN KEY REFERENCES Ferramenta(id_Ferramenta)
);

-- Tabela Historico
CREATE TABLE Historico (
    id_historico INT PRIMARY KEY IDENTITY,
    Aprendizado_id_Aprendizado INT FOREIGN KEY REFERENCES Aprendizado(id_Aprendizado),
    Ferramenta_id_Ferramenta INT FOREIGN KEY REFERENCES Ferramenta(id_Ferramenta),
    Agenda_id_agenda INT FOREIGN KEY REFERENCES Agenda(id_agenda),
    TabelaNutricional_id_TabelaNutricional INT FOREIGN KEY REFERENCES TabelaNutricional(id_TabelaNutricional),
    Precificacao_id_Precificacao INT FOREIGN KEY REFERENCES Precificacao(id_Precificacao),
    Estoque_id_Estoque INT FOREIGN KEY REFERENCES Estoque(id_Estoque),
    Caixa_id_Caixa INT FOREIGN KEY REFERENCES Caixa(id_Caixa)
);

-- Tabela LivroDeReceita
CREATE TABLE LivroDeReceita (
    id_Livro INT PRIMARY KEY IDENTITY,
    Historico_id_historico INT FOREIGN KEY REFERENCES Historico(id_historico)
);

-- Tabela HistoricoCaixa
CREATE TABLE HistoricoCaixa (
    id_HistoricoCaixa INT PRIMARY KEY IDENTITY,
    dataHistoricoCaixa DATE NOT NULL,
    valor MONEY NOT NULL,
    Caixa_id_Caixa INT FOREIGN KEY REFERENCES Caixa(id_Caixa)
);

-- Tabela Vitrine
CREATE TABLE Vitrine (
    id_vitrine INT PRIMARY KEY IDENTITY,
    nomeProduto VARCHAR(50) NOT NULL,
    imagemProduto VARBINARY(MAX) NOT NULL,
    categoriaProduto NVARCHAR(50) NOT NULL,
    descricao NVARCHAR(100),
    usuario_id_usuario INT FOREIGN KEY REFERENCES usuario(id_usuario)
);
