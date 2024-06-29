# Banco De Dados Tok D' Cereja

# Modelo Conceitual
O modelo conceitual é uma representação abstrata do banco de dados, focada em definir as entidades principais e os relacionamentos entre elas sem entrar em detalhes técnicos. Ele é usado para garantir que todos os requisitos de negócios sejam atendidos e que todas as entidades necessárias sejam identificadas.

![Captura de tela 2024-06-29 134935](https://github.com/TokDCereja/Banco-De-Dabos/assets/147439694/c9354f87-b1f3-444c-93c1-93a59afdfd12)

## Entidades e Relacionamentos

####  Ferramenta
   -  Descrição: Armazena informações sobre as ferramentas utilizadas no sistema, incluindo dados de identificação, tipo, fabricante, data de aquisição, custo, preço de venda e margem de lucro.
   -  Relacionamentos*: Conecta-se a várias outras tabelas, como Estoque, TabelaNutricional, Precificacao, Agenda, Aprendizado, entre outras, indicando que essas entidades podem estar relacionadas ao uso ou características das ferramentas.

##  Estoque
   -  Descrição: Gerencia o inventário de itens, registrando o nome do item, quantidade disponível, unidades e a data da última atualização.
   -  Relacionamentos*: Possui uma chave estrangeira que referencia a tabela Ferramenta, indicando que os itens em estoque estão associados a ferramentas específicas.

##  Caixa
   -  Descrição: Controla o saldo financeiro do sistema, armazenando o saldo atual do caixa.
   -  Relacionamentos*: Está relacionada à tabela HistóricoCaixa, que armazena o histórico de movimentações financeiras.

##  HistóricoCaixa
   -  Descrição: Registra as transações financeiras, incluindo data, valor, tipo (entrada/saída) e referência ao Caixa.
   -  Relacionamentos*: Conecta-se ao Caixa, documentando as movimentações financeiras que afetam o saldo do caixa.

##  Agenda
   -  Descrição: Armazena eventos e atividades agendadas, com informações de data, hora, descrição e a ferramenta associada.
   -  Relacionamentos: Possui uma chave estrangeira que referencia a tabela Ferramenta, indicando que eventos na agenda podem estar associados a determinadas ferramentas.

##  Aprendizado
   -  Descrição: Gerencia módulos de aprendizado, contendo nome e descrição do conteúdo educativo.
   -  Relacionamentos: Conecta-se a Ferramenta e inclui conteúdos educativos adicionais como Vídeo e Artigo.

##  Vídeo
   -  Descrição: Armazena informações sobre vídeos educativos, incluindo título, URL e data de publicação.
   -  Relacionamentos: Está associado à tabela Aprendizado, indicando que vídeos fazem parte do conteúdo educativo.

##  Artigo
   -  Descrição: Registra artigos educativos, com título, conteúdo e data de publicação.
   -  Relacionamentos: Também está associado à tabela Aprendizado, complementando o material educativo com artigos.

## TabelaNutricional
   - Descrição: Armazena informações nutricionais de receitas, incluindo valores de carboidrato, proteína, gorduras, sódio, açúcar e valor energético.
   - Relacionamentos: Possui uma chave estrangeira que referencia a tabela Ferramenta, indicando que as tabelas nutricionais podem estar associadas a receitas feitas com determinadas ferramentas.

## LivroDeReceitas
   - Descrição: Agrupa receitas documentadas e suas relações históricas.
   - Relacionamentos: Conecta-se à tabela Histórico, registrando a relação entre receitas e o histórico de uso.

##  Histórico
   -  Descrição: Documenta o histórico de diversas atividades e entidades no sistema.
   -  Relacionamentos: Conecta-se a várias tabelas como Ferramenta, TabelaNutricional, LivroDeReceitas, Precificacao, Aprendizado, Agenda, Caixa, e HistóricoCaixa, indicando um registro abrangente de atividades e mudanças no sistema.

##  Precificacao
   -  Descrição: Armazena dados de precificação, incluindo preço de venda, custo e margem de lucro.
   -  Relacionamentos: Possui uma chave estrangeira que referencia a tabela Ferramenta, indicando que a precificação está associada a ferramentas específicas.

##  Usuario
   -  Descrição: Gerencia informações dos usuários do sistema, como nome, email, senha, data de cadastro e plano de assinatura.
   -  Relacionamentos: Conecta-se a Plano e VitrineVirtual, indicando a associação dos usuários a planos de assinatura e produtos na vitrine virtual.

##  Plano
   -  Descrição: Armazena informações sobre os planos de assinatura, incluindo nome e tipo.
   -  Relacionamentos: Está associado à tabela FormaDePagamento, indicando as formas de pagamento relacionadas a cada plano.

##  FormaDePagamento
   -  Descrição: Gerencia as formas de pagamento, com informações sobre valor, tipo de pagamento, banco e número de parcelas.
   -  Relacionamentos: Conecta-se a Plano, indicando as opções de pagamento disponíveis para os planos de assinatura.

## VitrineVirtual
   - Descrição: Armazena informações sobre produtos na vitrine virtual, incluindo nome, imagem, categoria e descrição do produto.
   - Relacionamentos: Conecta-se a Usuario, indicando os produtos que os usuários podem visualizar ou adquirir.

##  Feedback
   -  Descrição: Registra feedback dos usuários, com descrição, avaliação, data e hora.
   -  Relacionamentos: Possui uma chave estrangeira que referencia a tabela Usuario, associando o feedback aos usuários específicos.


# Modelo Lógico

O modelo lógico detalha como os dados são organizados e relacionados no sistema, fornecendo uma base clara para a implementação do banco de dados físico. Cada entidade e relacionamento descrito garante que as operações e consultas no banco de dados sejam eficientes e reflitam corretamente as necessidades do negócio.

![Captura de tela 2024-06-29 164912](https://github.com/TokDCereja/Banco-De-Dabos/assets/147439694/c54f9f36-6d74-4f5a-8b91-90fd0edf2273)
![Captura de tela 2024-06-29 164923](https://github.com/TokDCereja/Banco-De-Dabos/assets/147439694/ae73678c-82c8-414c-aed9-c05753b9138f)


## Tabelas e Atributos

 
 ##Usuário
 Campos:

ID Usuário (INTEGER, PK)
Nome (VARCHAR)
Senha (VARCHAR)
Data de Cadastro (DATE)
Email (VARCHAR)
Tipo de Plano (CHAR)
CPF (NUMERIC)
Telefone (VARCHAR)
ID Plano (FK)
Descrição: Armazena informações pessoais dos usuários e detalhes do plano ao qual estão associados.

## Plano
Campos:

ID Plano (INTEGER, PK)
Tipo de Plano (VARCHAR)
Detalhes do Plano (VARCHAR)
Descrição: Exibe os tipos de planos disponíveis para os usuários.

## Forma de Pagamento
Campos:

ID Forma de Pagamento (INTEGER, PK)
Data e Hora do Pagamento (DATE)
Tipo de Plano (VARCHAR)
CPF (VARCHAR)
Nome do Titular (VARCHAR)
Valor (FLOAT)
Banco (VARCHAR)
Número de Parcelas (INTEGER)
Tipo de Pagamento (VARCHAR)
Descrição: Fornece opções de pagamento para os clientes e regista os compradores.

## Feedback
Campos:

ID Feedback (INTEGER, PK)
Descrição (VARCHAR)
Avaliação (VARCHAR)
Data (DATE)
Hora (TIME)
ID Usuário (FK)
Descrição: Coleta feedback dos usuários.

## Vitrine
Campos:

Nome do Produto (VARCHAR)
Imagem do Produto (INTEGER)
ID Vitrine (INTEGER, PK)
Categoria do Produto (VARCHAR)
ID Usuário (FK)
Descrição: Exibe produtos dos confeiteiros disponíveis para visualização dos clientes.

## Ferramenta
Campos:

ID Ferramenta (INTEGER, PK)
Nome Ferramenta (VARCHAR)
Data de Criação (DATE)
Descrição: Representa as ferramentas disponíveis para os usuários.

## Tabela Nutricional
Campos:

ID Tabela Nutricional (INTEGER, PK)
Nome do Alimento (VARCHAR)
Valor Energético (FLOAT)
Colesterol (FLOAT)
Proteína (FLOAT)
Gordura Saturada (FLOAT)
Gordura Total (FLOAT)
Açúcar (FLOAT)
Sódio (FLOAT)
ID Ferramenta (FK)
Descrição: Oferece a criação de uma tabela nutricional com base na receita do úsuario.

##Estoque
Campos:

ID Estoque (INTEGER, PK)
Nome do Item (VARCHAR)
Quantidade (NUMERIC)
Unidade (VARCHAR)
Data da Última Atualização (DATE)
ID Ferramenta (FK)
Descrição: Gerencia a quantidade de itens disponíveis em estoque.

## Caixa
Campos:

ID Caixa (INTEGER, PK)
Saldo Atual (FLOAT)
Data da Última Atualização (DATE)
ID Ferramenta (FK)
Descrição: Gerencia o saldo financeiro do sistema.

## Histórico de Caixa
Campos:

ID Histórico de Caixa (INTEGER, PK)
Data (DATE)
Valor (FLOAT)
Tipo (VARCHAR)
ID Caixa (FK)
Descrição: Mantém um registro de todas as transações financeiras da caixa.

## Agenda
Campos:

ID Agenda (INTEGER, PK)
Data (DATE)
Hora (TIME)
Descrição (VARCHAR)
ID Ferramenta (FK)
Descrição: Gerencia eventos e compromissos dos usuários.

## Aprendizado
Campos:

ID Aprendizado (INTEGER, PK)
Nome (VARCHAR)
Descrição (VARCHAR)
ID Ferramenta (FK)
Descrição: Representa módulos ou conteúdos educacionais disponíveis para os usuários.

## Artigo
Campos:

ID Artigo (INTEGER, PK)
Título (VARCHAR)
Conteúdo (VARCHAR)
Data de Publicação (DATE)
ID Aprendizado (FK)
Descrição: Armazena artigos informativos ou educacionais.

## Vídeo
Campos:

ID Vídeo (INTEGER, PK)
Título (VARCHAR)
URL (VARCHAR)
Data de Publicação (DATE)
ID Aprendizado (FK)
Descrição: Armazena vídeos informativos ou educacionais.

## Histórico
Campos:

ID Histórico (INTEGER, PK)
Data (DATE)
Descrição (VARCHAR)
ID Ferramenta (FK)
Descrição: Registra o histórico de uso das ferramentas.

## Livro de Receitas
Campos:

ID Livro (INTEGER, PK)
Nome (VARCHAR)
Descrição (VARCHAR)
ID Histórico (FK)
Descrição: Armazena os dados das ferramentas usadas recentemente no histórico.

## Precificação
Campos:

ID Preço (INTEGER, PK)
Nome do Item (VARCHAR)
Preço de Venda (FLOAT)
Margem de Lucro (FLOAT)
Custo (FLOAT)
ID Ferramenta (FK)
Descrição: Gerencia os preços dos itens disponíveis.


# Modelo Físico

O modelo físico de um banco de dados descreve a estrutura concreta e detalhada de como os dados são armazenados dentro do sistema. Ele inclui:

Tabelas: São entidades principais que armazenam os dados. Cada tabela possui colunas que definem os tipos de dados que podem ser armazenados e as restrições aplicáveis a esses dados.

Colunas: Representam os campos individuais de dados dentro de cada tabela. Cada coluna possui um tipo de dado específico (como VARCHAR, INT, DECIMAL) e pode ter restrições como NOT NULL, UNIQUE, PRIMARY KEY, FOREIGN KEY, entre outras.

Chaves Primárias e Estrangeiras: As chaves primárias são campos únicos que identificam cada registro exclusivamente dentro de uma tabela. Chaves estrangeiras são usadas para estabelecer relacionamentos entre tabelas, ligando uma coluna de uma tabela à chave primária de outra.

Índices: Estruturas que melhoram a velocidade de recuperação de dados, permitindo acesso mais rápido a registros específicos com base em critérios definidos.

Restrições: Define regras adicionais sobre os dados que podem ser armazenados, como restrições de integridade referencial (garantindo que não haja referências a registros inexistentes) e outras restrições de validação.

Relacionamentos: Indica como as tabelas estão interconectadas através de chaves estrangeiras, permitindo consultas complexas que combinam dados de várias fontes relacionadas.

Em resumo, o modelo físico não apenas define a estrutura das tabelas e seus campos, mas também especifica como os dados serão armazenados fisicamente no banco de dados, proporcionando uma base sólida para a implementação e gerenciamento eficiente dos dados do sistema.

## Comandos de Criação

Os comandos de criação de tabelas são utilizados para definir a estrutura de uma tabela em um banco de dados relacional. Cada comando é projetado para especificar os detalhes dos campos que compõem a tabela, bem como quaisquer restrições ou relacionamentos com outras tabelas. 


![Captura de tela 2024-06-29 172052](https://github.com/TokDCereja/Banco-De-Dabos/assets/147439694/d0bc718b-24f4-47f0-83b7-a2e72d8ef750)

# Criação das tabelas e processos

Quando você cria os comandos SQL para criar tabelas (CREATE TABLE ...) e os executa em seu sistema de gerenciamento de banco de dados (SGBD), o que acontece é o seguinte processo:

Envio e Execução dos Comandos SQL: Você envia os comandos SQL para o SGBD, seja através de uma interface gráfica (como MySQL Workbench, SQL Server Management Studio) ou por scripts SQL executados diretamente no console do banco de dados.

Análise e Processamento: O SGBD recebe os comandos e realiza uma análise sintática para garantir que a sintaxe esteja correta e compreensível. Isso envolve verificar a estrutura dos comandos para garantir que eles sigam as regras e convenções da linguagem SQL.

Criação Física da Tabela: Se os comandos forem válidos e estiverem livres de erros, o SGBD procede à criação física da tabela. Isso envolve reservar espaço de armazenamento no disco para a tabela e seus índices, se aplicável. O SGBD define a estrutura de armazenamento para cada coluna, de acordo com o tipo de dado especificado.

Aplicação de Restrições e Chaves: Durante o processo de criação da tabela, o SGBD aplica as restrições definidas, como chaves primárias, chaves estrangeiras, restrições de integridade referencial, restrições de tipo de dado (como NOT NULL), entre outras. Isso garante que os dados inseridos na tabela atendam aos critérios especificados, mantendo a integridade dos dados.

Finalização e Pronto para Uso: Após a conclusão bem-sucedida do processo de criação, a tabela está pronta para ser utilizada. Você pode começar a inserir dados (INSERT), realizar consultas (SELECT), atualizar registros (UPDATE) e deletar informações (DELETE) conforme necessário para as operações do seu sistema.

Portanto, depois de criar e executar os comandos SQL para criar tabelas, o SGBD cuida dos detalhes técnicos para garantir que a estrutura de dados seja estabelecida corretamente e esteja pronta para suportar as operações de manipulação de dados conforme definido pela sua aplicação ou sistema.


![Captura de tela 2024-06-29 172312](https://github.com/TokDCereja/Banco-De-Dabos/assets/147439694/931ff04c-07d5-4787-aae8-d8dec40aa476)










