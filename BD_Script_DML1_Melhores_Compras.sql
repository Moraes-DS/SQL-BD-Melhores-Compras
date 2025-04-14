--Resposta do comando SQL item a)
--Item a: Populando a tabela MC_DEPTO

--Inserindo os dados na tabela MC_DEPTO (pelo menos 3 Departamentos)
INSERT INTO MC_DEPTO (CD_DEPTO, NM_DEPTO, ST_DEPTO)
    VALUES (SQ_CD_DEPTO.NEXTVAL, 'Comercial', 'A');
INSERT INTO MC_DEPTO (CD_DEPTO, NM_DEPTO, ST_DEPTO)
    VALUES (SQ_CD_DEPTO.NEXTVAL, 'Financeiro', 'A');
INSERT INTO MC_DEPTO (CD_DEPTO, NM_DEPTO, ST_DEPTO)
    VALUES (SQ_CD_DEPTO.NEXTVAL, 'SAC (SERVIÇO DE ATENDIMENTO AO CLIENTE)', 'A');

--Visualizando a Tabela MC_DEPTO
SELECT * FROM MC_DEPTO;

--ROLLBACK;
COMMIT;

--Resposta do comando SQL item b)
--Item b: Populando a tabela MC_FUNCIONARIO com 3 funcionários de 2 departamentos 

--Inserindo os dados de Funcionários na tabela MC_FUNCIONARIO
--Funcionário 1
INSERT INTO MC_FUNCIONARIO (
    CD_FUNCIONARIO, CD_DEPTO, CD_GERENTE, NM_FUNCIONARIO, DT_NASCIMENTO, FL_SEXO_BIOLOGICO, 
    DS_GENERO, DS_CARGO, VL_SALARIO, DS_EMAIL, ST_FUNC, DT_CADASTRAMENTO, DT_DESLIGAMENTO
)
    VALUES (
    SQ_CD_FUNCIONARIO.NEXTVAL,  --Sequência para CD_FUNCIONARIO
    1,  --Exemplo de código de departamento
    NULL,  --Gerente principal (sem gerente acima dele)
    'Carlos Gerente Depto 1',  --Nome do gerente
    TO_DATE('15-01-1980', 'DD-MM-YYYY'),  --Data de nascimento
    'M',  -- Sexo biológico
    'Masculino',  --Gênero
    'Gerente',  --Cargo
    8000.00,  --Salário
    'carlos.gerente@email.com',  --E-mail
    'A',  --Status (Ativo)
    TO_DATE('05-10-2024' , 'DD-MM-YYYY'),  --Data de cadastramento 
    NULL  --Data de desligamento
);
--Funcionário 2
INSERT INTO MC_FUNCIONARIO (
    CD_FUNCIONARIO, CD_DEPTO, CD_GERENTE, NM_FUNCIONARIO, DT_NASCIMENTO, FL_SEXO_BIOLOGICO, 
    DS_GENERO, DS_CARGO, VL_SALARIO, DS_EMAIL, ST_FUNC, DT_CADASTRAMENTO, DT_DESLIGAMENTO
)
    VALUES (
    SQ_CD_FUNCIONARIO.NEXTVAL,  --Sequência para CD_FUNCIONARIO
    1,  --Exemplo de código de departamento
    1,  --Gerente é o Carlos Gerente
    'Marcos Funcionário Depto 1',  --Nome do funcionário
    TO_DATE('01-10-1994', 'DD-MM-YYYY'),  --Data de nascimento
    'M',  --Sexo biológico
    'Masculino',  --Gênero
    'Vendedor',  --Cargo 
    3000.00,  --Salário
    'marcos.vendedor@email.com',  --E-mail
    'A',  --Status (Ativo)
    TO_DATE('05-10-2024' , 'DD-MM-YYYY'),  --Data de cadastramento 
    NULL  --Data de desligamento
);
--Funcionário 3
INSERT INTO MC_FUNCIONARIO (
    CD_FUNCIONARIO, CD_DEPTO, CD_GERENTE, NM_FUNCIONARIO, DT_NASCIMENTO, FL_SEXO_BIOLOGICO, 
    DS_GENERO, DS_CARGO, VL_SALARIO, DS_EMAIL, ST_FUNC, DT_CADASTRAMENTO, DT_DESLIGAMENTO
)
    VALUES (
    SQ_CD_FUNCIONARIO.NEXTVAL,  --Sequência para CD_FUNCIONARIO
    2,  --Exemplo de código de departamento
    NULL,  --Gerente do Departamento Financeiro
    'Fernando Gerente Depto 2',  --Nome do Gerente
    TO_DATE('22-03-1984', 'DD-MM-YYYY'),  --Data de nascimento
    'M',  --Sexo biológico
    'Masculino',  --Gênero
    'Gerente',  --Cargo 
    9500.00,  --Salário
    'fernando.gerente@email.com',  --E-mail
    'A',  --Status (Ativo)
    TO_DATE('05-10-2024' , 'DD-MM-YYYY'),  --Data de cadastramento 
    NULL  --Data de desligamento
);

--Visualização da Tabela MC_FUNCIONARIO
SELECT * FROM MC_FUNCIONARIO
--ROLLBACK;
COMMIT;

--Resposta do comando SQL item c)
--Item c: Populando as tabelas MC_ESTADO, MC_CIDADE, MC_BAIRRO, MC_LOGRADOURO
--C1: Inserindo dados na tabela MC_ESTADO
INSERT INTO MC_ESTADO (SG_ESTADO, NM_ESTADO)
    VALUES('SP', 'SÃO PAULO');
INSERT INTO MC_ESTADO (SG_ESTADO, NM_ESTADO)
    VALUES('PR', 'PARANÁ');
    
--Visualização da tabela MC_ESTADO
SELECT * FROM MC_ESTADO;

--C2: Inserindo dados na tabela MC_CIDADE

--Inserindo os dados na tabela MC_CIDADE
INSERT INTO MC_CIDADE (CD_CIDADE, SG_ESTADO, NM_CIDADE, CD_IBGE, NR_DDD)
    VALUES(SQ_CD_CIDADE.NEXTVAL, 'SP', 'SÃO PAULO', 3550308, 11);
INSERT INTO MC_CIDADE (CD_CIDADE, SG_ESTADO, NM_CIDADE, CD_IBGE, NR_DDD)
    VALUES(SQ_CD_CIDADE.NEXTVAL, 'SP', 'CAMPINAS', 3509502, 19);
INSERT INTO MC_CIDADE (CD_CIDADE, SG_ESTADO, NM_CIDADE, CD_IBGE, NR_DDD)
    VALUES(SQ_CD_CIDADE.NEXTVAL, 'PR', 'CURITIBA', 4106902, 41);
INSERT INTO MC_CIDADE (CD_CIDADE, SG_ESTADO, NM_CIDADE, CD_IBGE, NR_DDD)
    VALUES(SQ_CD_CIDADE.NEXTVAL, 'PR', 'CASCAVEL', 4104808, 45);

--Visualização da tabela MC_CIDADE
SELECT * FROM MC_CIDADE;

--C3: Inserção dos dados da tabela MC_BAIRRO (1 bairro por cidade)

--Inserindo os dados na tabela MC_BAIRRO (1 bairro por cidade)
INSERT INTO MC_BAIRRO (CD_BAIRRO, CD_CIDADE, NM_BAIRRO, NM_ZONA_BAIRRO)
    VALUES(SQ_CD_BAIRRO.NEXTVAL, 1, 'BELA VISTA', 'CENTRAL');
INSERT INTO MC_BAIRRO (CD_BAIRRO, CD_CIDADE, NM_BAIRRO, NM_ZONA_BAIRRO)
    VALUES(SQ_CD_BAIRRO.NEXTVAL, 2, 'JARDIM DO LAGO', 'CENTRAL');
INSERT INTO MC_BAIRRO (CD_BAIRRO, CD_CIDADE, NM_BAIRRO, NM_ZONA_BAIRRO)
    VALUES(SQ_CD_BAIRRO.NEXTVAL, 3, 'BATEL', 'CENTRAL');
INSERT INTO MC_BAIRRO (CD_BAIRRO, CD_CIDADE, NM_BAIRRO, NM_ZONA_BAIRRO)
    VALUES(SQ_CD_BAIRRO.NEXTVAL, 4, 'CENTRO', 'CENTRAL');
    
--Visualização da tabela MC_BAIRRO
SELECT * FROM MC_BAIRRO;
--ROLLBACK;

--C4: Inserindo os dados na tabela MC_LOGRADOURO

--Inserindo os dados para logradouro (2 logradouros por bairro)
--Bela Vista - São Paulo
INSERT INTO MC_LOGRADOURO (CD_LOGRADOURO, CD_BAIRRO, NM_LOGRADOURO, NR_CEP)
    VALUES(SQ_CD_LOGRADOURO.NEXTVAL, 1, 'Avenida Paulista', 01311000);
INSERT INTO MC_LOGRADOURO (CD_LOGRADOURO, CD_BAIRRO, NM_LOGRADOURO, NR_CEP)
    VALUES(SQ_CD_LOGRADOURO.NEXTVAL, 1, 'Treze de Maio', 04849529);
--Jardim do Lago - Campinas
INSERT INTO MC_LOGRADOURO (CD_LOGRADOURO, CD_BAIRRO, NM_LOGRADOURO, NR_CEP)
    VALUES(SQ_CD_LOGRADOURO.NEXTVAL, 2, 'Rua dos Gráficos', 13050916);
INSERT INTO MC_LOGRADOURO (CD_LOGRADOURO, CD_BAIRRO, NM_LOGRADOURO, NR_CEP)
    VALUES(SQ_CD_LOGRADOURO.NEXTVAL, 2, 'Avenida Carlos Stela Neto', 13051010);
--Batel - Curitiba
INSERT INTO MC_LOGRADOURO (CD_LOGRADOURO, CD_BAIRRO, NM_LOGRADOURO, NR_CEP)
    VALUES(SQ_CD_LOGRADOURO.NEXTVAL, 3, 'Avenida do Batel', 80420090);
INSERT INTO MC_LOGRADOURO (CD_LOGRADOURO, CD_BAIRRO, NM_LOGRADOURO, NR_CEP)
    VALUES(SQ_CD_LOGRADOURO.NEXTVAL, 3, 'Alameda Dom Pedro II', 80420060);
--Centro - Cascavel
INSERT INTO MC_LOGRADOURO (CD_LOGRADOURO, CD_BAIRRO, NM_LOGRADOURO, NR_CEP)
    VALUES(SQ_CD_LOGRADOURO.NEXTVAL, 4, 'Avenida Brasil', 85801010);
INSERT INTO MC_LOGRADOURO (CD_LOGRADOURO, CD_BAIRRO, NM_LOGRADOURO, NR_CEP)
    VALUES(SQ_CD_LOGRADOURO.NEXTVAL, 4, 'Rua Paraná', 85812011);    
    
--Visualizando a tabela MC_LOGRADOURO
SELECT * FROM MC_LOGRADOURO;
COMMIT;

--Resposta do comando SQL item d)
--Item d: Populando a tabela MC_END_FUNC (Endereços para 2 funionários)
--Funcionário 1 = Carlos, Av. Paulista, 1106 - 7° ANDAR - Bela Vista - São Paulo - SP
INSERT INTO MC_END_FUNC (CD_FUNCIONARIO, CD_LOGRADOURO, NR_END, DS_COMPLEMENTO_END,
DT_INICIO, DT_TERMINO, ST_END)
    VALUES ( 1, 1, 1106, '7° ANDAR', '16/10/1990', NULL, 'A');
--Funcionário 1 = Carlos, Av. Carlos Stela Neto, 101 - Jardim do Lago - Campinas - SP
INSERT INTO MC_END_FUNC (CD_FUNCIONARIO, CD_LOGRADOURO, NR_END, DS_COMPLEMENTO_END,
DT_INICIO, DT_TERMINO, ST_END)
    VALUES ( 1, 4, 101, 'CASA', '16/10/1990', NULL, 'A');
--Funcionário 2 = Marcos, Av. do Batel, 1323 - Batel - Curitiba - PR
INSERT INTO MC_END_FUNC (CD_FUNCIONARIO, CD_LOGRADOURO, NR_END, DS_COMPLEMENTO_END,
DT_INICIO, DT_TERMINO, ST_END)
    VALUES ( 2, 5, 1323, 'CASA', '16/10/1990', NULL, 'A');    

--Visualizando os dados da tabela MC_END_FUNC
SELECT * FROM MC_END_FUNC;

--Tentando entender o erro:
--SELECT * FROM MC_FUNCIONARIO WHERE CD_FUNCIONARIO = 2;
COMMIT;

--Resposta do comando SQL item e)
--Item e: Cadastrar pelo menos: 2 Clientes Pessoa Física e 1 Cliente Pessoa Jurídica
-- + associar um endereço para cada cliente.
--E1: Cadastrando Clientes Pessoa Física

--Inserindo os dados na tabela MC_CLIENTE
INSERT INTO MC_CLIENTE (NR_CLIENTE, NM_CLIENTE, QT_ESTRELAS, VL_MEDIO_COMPRA, ST_CLIENTE,
    DS_EMAIL, NR_TELEFONE, NM_LOGIN, DS_SENHA)
    VALUES (SQ_NR_CLIENTE.NEXTVAL, 'BILBO BOLSEIRO', 5, NULL, 'A', 'bolseiro@terramedia.com',
    NULL, 'BOLSEIROB', 'MEUPRECIOSO');
INSERT INTO MC_CLIENTE (NR_CLIENTE, NM_CLIENTE, QT_ESTRELAS, VL_MEDIO_COMPRA, ST_CLIENTE,
    DS_EMAIL, NR_TELEFONE, NM_LOGIN, DS_SENHA)
    VALUES (SQ_NR_CLIENTE.NEXTVAL, 'SMEAGOL', 5, NULL, 'A', 'gollum@terramedia.com',
    NULL, 'GOLLUMS', 'MEUPRECIOSOMEUPRECIOSO');
INSERT INTO MC_CLIENTE (NR_CLIENTE, NM_CLIENTE, QT_ESTRELAS, VL_MEDIO_COMPRA, ST_CLIENTE,
    DS_EMAIL, NR_TELEFONE, NM_LOGIN, DS_SENHA)
    VALUES (SQ_NR_CLIENTE.NEXTVAL, 'MORDOR SA', 4, 10000, 'A', 'mordorsa@terramedia.com',
    NULL, 'SAURON', 'PERDICAOSA');
    
--Visualização da tabela MC_CLIENTE
SELECT * FROM MC_CLIENTE;

--E2: Inserindo os dados de Pessoas Físicas na tabela MC_CLI_FISICA
INSERT INTO MC_CLI_FISICA (NR_CLIENTE, DT_NASCIMENTO, FL_SEXO_BIOLOGICO,
    DS_GENERO, NR_CPF)
    VALUES ((SELECT NR_CLIENTE FROM MC_CLIENTE WHERE NM_CLIENTE = 'BILBO BOLSEIRO'),
    TO_DATE('01/01/1700','DD-MM-YYYY'), 'M', 'MASCULINO', '123456789-01');
 INSERT INTO MC_CLI_FISICA (NR_CLIENTE, DT_NASCIMENTO, FL_SEXO_BIOLOGICO,
    DS_GENERO, NR_CPF)
    VALUES ((SELECT NR_CLIENTE FROM MC_CLIENTE WHERE NM_CLIENTE = 'SMEAGOL'),
    TO_DATE('25/08/1502','DD-MM-YYYY'), 'M', 'MASCULINO', '098765432-10');

--Visualizando a tabela MC_CLI_FISICA
SELECT * FROM MC_CLI_FISICA;

--E3: Inserindo os dados de Pessoas Físicas na tabela MC_CLI_JURIDICA 
INSERT INTO MC_CLI_JURIDICA (NR_CLIENTE, DT_FUNDACAO, NR_CNPJ,
    NR_INSCR_EST)
    VALUES ((SELECT NR_CLIENTE FROM MC_CLIENTE WHERE NM_CLIENTE = 'MORDOR SA'),
    TO_DATE('29/02/1000','DD-MM-YYYY'), 'XX.XXX.XXX/0001-XX', NULL);

--Visualizando a tabela MC_CLI_JURIDICA
SELECT * FROM MC_CLI_JURIDICA;
COMMIT;

--E4: Associando um endereço a cada Cliente Pessoa Física
INSERT INTO MC_END_CLI (NR_CLIENTE, CD_LOGRADOURO_CLI, NR_END, DS_COMPLEMENTO_END,
    DT_INICIO, DT_TERMINO, ST_END)
VALUES (
    (SELECT NR_CLIENTE FROM MC_CLIENTE WHERE NM_CLIENTE = 'BILBO BOLSEIRO'), 
    (SELECT CD_LOGRADOURO FROM MC_LOGRADOURO WHERE NM_LOGRADOURO = 'Alameda Dom Pedro II'),
    1003, 'APARTAMENTO 101', NULL, NULL, 'A');
INSERT INTO MC_END_CLI (NR_CLIENTE, CD_LOGRADOURO_CLI, NR_END, DS_COMPLEMENTO_END,
    DT_INICIO, DT_TERMINO, ST_END)
VALUES (
    (SELECT NR_CLIENTE FROM MC_CLIENTE WHERE NM_CLIENTE = 'SMEAGOL'), 
    (SELECT CD_LOGRADOURO FROM MC_LOGRADOURO WHERE NM_LOGRADOURO = 'Avenida Brasil'),
    2345, 'CASA', NULL, NULL, 'A');
INSERT INTO MC_END_CLI (NR_CLIENTE, CD_LOGRADOURO_CLI, NR_END, DS_COMPLEMENTO_END,
    DT_INICIO, DT_TERMINO, ST_END)
VALUES (
    (SELECT NR_CLIENTE FROM MC_CLIENTE WHERE NM_CLIENTE = 'MORDOR SA'), 
    (SELECT CD_LOGRADOURO FROM MC_LOGRADOURO WHERE NM_LOGRADOURO = 'Avenida Brasil'),
    1899, 'LOJA 01', NULL, NULL, 'A');

--Visualizando a tabela MC_END_CLI
SELECT * FROM MC_END_CLI;
COMMIT;

--Resposta do comando SQL item f)
--Item f: Cadastrar um novo Cliente com mesmo login e senha já cadastrado anteriormente
INSERT INTO MC_CLIENTE (NR_CLIENTE, NM_CLIENTE, QT_ESTRELAS, VL_MEDIO_COMPRA, ST_CLIENTE,
    DS_EMAIL, NR_TELEFONE, NM_LOGIN, DS_SENHA)
VALUES (SQ_NR_CLIENTE.NEXTVAL, 'GANDALF', 5, 200, 'A', 'gandalf@terramedia.com', NULL, 'BOLSEIROB', 'MEUPRECIOSO');

--Visualizar a tabela MC_CLIENTE
SELECT * FROM MC_CLIENTE;
COMMIT;

--Resposta do comando SQL item g)
--Item g: Cadastrar um novo Cliente com mesmo login e senha já cadastrado anteriormente

--Cadastrando as novas categorias
INSERT INTO MC_CATEGORIA_PROD (CD_CATEGORIA, TP_CATEGORIA, DS_CATEGORIA, DT_INICIO,
    DT_TERMINO, ST_CATEGORIA)
    VALUES (SQ_CD_CATEGORIA.NEXTVAL, 'P', 'Eletrônicos', TO_DATE('06/10/2024','DD-MM-YYYY'),
    NULL, 'A');
INSERT INTO MC_CATEGORIA_PROD (CD_CATEGORIA, TP_CATEGORIA, DS_CATEGORIA, DT_INICIO,
    DT_TERMINO, ST_CATEGORIA)
    VALUES (SQ_CD_CATEGORIA.NEXTVAL, 'P', 'Esporte e Lazer', TO_DATE('06/10/2024','DD-MM-YYYY'),
    NULL, 'A');
INSERT INTO MC_CATEGORIA_PROD (CD_CATEGORIA, TP_CATEGORIA, DS_CATEGORIA, DT_INICIO,
    DT_TERMINO, ST_CATEGORIA)
    VALUES (SQ_CD_CATEGORIA.NEXTVAL, 'P', 'Pet Shop', TO_DATE('06/10/2024','DD-MM-YYYY'),
    NULL, 'A');
    

--Visualizar a tabela MC_CATEGORIA_PROD
SELECT * FROM MC_CATEGORIA_PROD;
COMMIT;

--Resposta do comando SQL item h)
--Item h: Cadastrar 5 produtos e associar a categoria
    
--Inserindo os dados na tabela
INSERT INTO MC_PRODUTO (CD_PRODUTO, CD_CATEGORIA, NR_CD_BARRAS_PROD, DS_PRODUTO, 
    VL_UNITARIO, TP_EMBALAGEM, ST_PRODUTO, VL_PERC_LUCRO, DS_COMPLETA_PROD)
    VALUES (SQ_CD_PRODUTO.NEXTVAL, (SELECT CD_CATEGORIA FROM MC_CATEGORIA_PROD WHERE DS_CATEGORIA = 'Eletrônicos'),
    NULL, 'Videocassete', '800', NULL, 'A', 100, 'Aparelho tocador de VHS');
INSERT INTO MC_PRODUTO (CD_PRODUTO, CD_CATEGORIA, NR_CD_BARRAS_PROD, DS_PRODUTO, 
    VL_UNITARIO, TP_EMBALAGEM, ST_PRODUTO, VL_PERC_LUCRO, DS_COMPLETA_PROD)
    VALUES (SQ_CD_PRODUTO.NEXTVAL, (SELECT CD_CATEGORIA FROM MC_CATEGORIA_PROD WHERE DS_CATEGORIA = 'Eletrônicos'),
    NULL, 'CD Player', '350', NULL, 'A', 100, 'Aparelho tocador de CD');
INSERT INTO MC_PRODUTO (CD_PRODUTO, CD_CATEGORIA, NR_CD_BARRAS_PROD, DS_PRODUTO, 
    VL_UNITARIO, TP_EMBALAGEM, ST_PRODUTO, VL_PERC_LUCRO, DS_COMPLETA_PROD)
    VALUES (SQ_CD_PRODUTO.NEXTVAL, (SELECT CD_CATEGORIA FROM MC_CATEGORIA_PROD WHERE DS_CATEGORIA = 'Esporte e Lazer'),
    NULL, 'Barraca 5 pessoas', '2700', NULL, 'A', 900, 'Barraca para camping para 5 pessoas');
INSERT INTO MC_PRODUTO (CD_PRODUTO, CD_CATEGORIA, NR_CD_BARRAS_PROD, DS_PRODUTO, 
    VL_UNITARIO, TP_EMBALAGEM, ST_PRODUTO, VL_PERC_LUCRO, DS_COMPLETA_PROD)
    VALUES (SQ_CD_PRODUTO.NEXTVAL, (SELECT CD_CATEGORIA FROM MC_CATEGORIA_PROD WHERE DS_CATEGORIA = 'Esporte e Lazer'),
    NULL, 'Bola de Basquete', '230', NULL, 'A', 50, 'Bola tamanho oficial de basquete');
INSERT INTO MC_PRODUTO (CD_PRODUTO, CD_CATEGORIA, NR_CD_BARRAS_PROD, DS_PRODUTO, 
    VL_UNITARIO, TP_EMBALAGEM, ST_PRODUTO, VL_PERC_LUCRO, DS_COMPLETA_PROD)
    VALUES (SQ_CD_PRODUTO.NEXTVAL, (SELECT CD_CATEGORIA FROM MC_CATEGORIA_PROD WHERE DS_CATEGORIA = 'Pet Shop'),
    NULL, 'Ração 15Kg Meu Pet', '240', NULL, 'A', 50, 'Saco de ração para cães de 15 Kg da marca Meu Pet');
 
--Visualizando a tabela MC_PRODUTO
SELECT * FROM MC_PRODUTO;
COMMIT;

--Resposta do comando SQL item i)
--Item i: Cadastrar 2 categorias de vídeo de produtos
INSERT INTO MC_CATEGORIA_PROD (CD_CATEGORIA, TP_CATEGORIA, DS_CATEGORIA, DT_INICIO,
    DT_TERMINO, ST_CATEGORIA)
    VALUES (SQ_CD_CATEGORIA.NEXTVAL, 'V', 'Instalação do Produto', TO_DATE('06/10/2024','DD-MM-YYYY'),
    NULL, 'A');
INSERT INTO MC_CATEGORIA_PROD (CD_CATEGORIA, TP_CATEGORIA, DS_CATEGORIA, DT_INICIO,
    DT_TERMINO, ST_CATEGORIA)
    VALUES (SQ_CD_CATEGORIA.NEXTVAL, 'V', 'Uso no cotidiano', TO_DATE('06/10/2024','DD-MM-YYYY'),
    NULL, 'A');
    
--Visualizando a tabela MC_CATEGORIA_PROD
SELECT * FROM MC_CATEGORIA_PROD;
COMMIT;

--Resposta do comando SQL item j)
--Item j: Cadastrar 2 vídeos de produtos e associar os dois a um único produto, assim como a categorias.

--Inserindo dados na tabela
INSERT INTO MC_SGV_PRODUTO_VIDEO (CD_PRODUTO, NR_SEQUENCIA, CD_CATEGORIA, VD_PRODUTO,
    TP_VIDEO_PROD, DS_PATH_VIDEO_PROD, ST_VIDEO_PROD)
    VALUES((SELECT CD_PRODUTO FROM MC_PRODUTO WHERE DS_PRODUTO = 'Barraca 5 pessoas'),
    (SQ_NR_SEQUENCIA.NEXTVAL), (SELECT CD_CATEGORIA FROM MC_PRODUTO WHERE DS_PRODUTO = 'Barraca 5 pessoas'),
    NULL, 'LONGO', NULL, 'A');
INSERT INTO MC_SGV_PRODUTO_VIDEO (CD_PRODUTO, NR_SEQUENCIA, CD_CATEGORIA, VD_PRODUTO,
    TP_VIDEO_PROD, DS_PATH_VIDEO_PROD, ST_VIDEO_PROD)
    VALUES((SELECT CD_PRODUTO FROM MC_PRODUTO WHERE DS_PRODUTO = 'Barraca 5 pessoas'),
    (SQ_NR_SEQUENCIA.NEXTVAL), (SELECT CD_CATEGORIA FROM MC_PRODUTO WHERE DS_PRODUTO = 'Barraca 5 pessoas'),
    NULL, 'CURTO', NULL, 'A');    

--Visualizando a tabela MC_SGV_PRODUTO_VIDEO
SELECT * FROM MC_SGV_PRODUTO_VIDEO;
COMMIT;

--Resposta do comando SQL item k)
--Item k: Cadastrar 2 visualizações de vídeos de produtos na tabela MC_SGV_VISUALIZACAO_VIDEO e associar a um cliente.

--Inserindo os dados na tabela
INSERT INTO MC_SGV_VISUALIZACAO_VIDEO (CD_VISUALIZACAO_VIDEO, NR_CLIENTE, CD_PRODUTO,
    NR_SEQUENCIA, DT_VISUALIZACAO, NR_HORA_VISUALIZACAO, NR_MINUTO_VIDEO, NR_SEGUNDO_VIDEO)
    VALUES ((SQ_CD_VISUALIZACAO_VIDEO.NEXTVAL), (SELECT NR_CLIENTE FROM MC_CLIENTE WHERE NM_CLIENTE = 'SMEAGOL'),
    (SELECT CD_PRODUTO FROM MC_PRODUTO WHERE DS_PRODUTO = 'Barraca 5 pessoas'), 
    (SELECT NR_SEQUENCIA FROM MC_SGV_PRODUTO_VIDEO WHERE TP_VIDEO_PROD = 'LONGO'), TO_DATE('06/10/2024','DD-MM-YYYY'),
    16, 26, 54);
INSERT INTO MC_SGV_VISUALIZACAO_VIDEO (CD_VISUALIZACAO_VIDEO, NR_CLIENTE, CD_PRODUTO,
    NR_SEQUENCIA, DT_VISUALIZACAO, NR_HORA_VISUALIZACAO, NR_MINUTO_VIDEO, NR_SEGUNDO_VIDEO)
    VALUES ((SQ_CD_VISUALIZACAO_VIDEO.NEXTVAL), (SELECT NR_CLIENTE FROM MC_CLIENTE WHERE NM_CLIENTE = 'BILBO BOLSEIRO'),
    (SELECT CD_PRODUTO FROM MC_PRODUTO WHERE DS_PRODUTO = 'Barraca 5 pessoas'), 
    (SELECT NR_SEQUENCIA FROM MC_SGV_PRODUTO_VIDEO WHERE TP_VIDEO_PROD = 'LONGO'), TO_DATE('06/10/2024','DD-MM-YYYY'),
    23, 37, 04);

--Visualizando a tabela MC_SGV_VISUALIZACAO_VIDEO
SELECT * FROM MC_SGV_VISUALIZACAO_VIDEO;
--Item L)
COMMIT;

--m) Selecione um específico funcionário e atualize o cargo e aplique 12% de aumento de salário.
UPDATE MC_FUNCIONARIO SET NM_FUNCIONARIO = ' Carlos Diretor Depto 1', DS_CARGO = 'Diretor', VL_SALARIO = VL_SALARIO+(VL_SALARIO*0.12) WHERE CD_FUNCIONARIO = 1;
SELECT NM_FUNCIONARIO, DS_CARGO, VL_SALARIO FROM MC_FUNCIONARIO WHERE CD_FUNCIONARIO = 1;

--n) Atualize o nome de um departamento a sua escolha, utilizando como filtro o nome de departamento antes de ser atualizado.
SELECT NM_DEPTO FROM MC_DEPTO WHERE NM_DEPTO = 'Comercial';
UPDATE MC_DEPTO SET NM_DEPTO = 'Inteligência Comercial' where NM_DEPTO = 'Comercial';
SELECT NM_DEPTO FROM MC_DEPTO WHERE NM_DEPTO = 'Inteligência Comercial';

--o) Atualize a data de nascimento de um cliente pessoa física. Defina a nova data como sendo 18/05/2002.
UPDATE MC_CLI_FISICA SET DT_NASCIMENTO = TO_DATE('18/05/2002','DD/MM/YYYY') WHERE NR_CLIENTE = 1; 
SELECT NR_CLIENTE, DT_NASCIMENTO FROM MC_CLI_FISICA WHERE NR_CLIENTE = 1;

--p) Desative um funcionário colocando o status como I(nativo) e também a data de desligamento sendo a data de hoje (sysdate).
UPDATE MC_FUNCIONARIO SET ST_FUNC = 'I', DT_DESLIGAMENTO = SYSDATE WHERE CD_FUNCIONARIO = 2;
SELECT NM_FUNCIONARIO, ST_FUNC, DT_DESLIGAMENTO FROM MC_FUNCIONARIO WHERE CD_FUNCIONARIO = 2;

--q) Selecione um endereço de cliente e coloque o status como I(nativo) e preencha a data de término como sendo a data limite de entrega do trabalho(14/10/2024). Utilize a função to_date para registrar esse novo valor da data.
UPDATE MC_END_CLI SET ST_END = 'I', DT_TERMINO = TO_DATE('14/10/2024', 'DD/MM/YYYY') WHERE NR_CLIENTE = 1;
SELECT NR_CLIENTE, ST_END, DT_TERMINO FROM MC_END_CLI WHERE NR_CLIENTE = 1;

--r) Tente eliminar um estado que tenha uma cidade cadastrada. Isso foi possível? Justifique o motivo.
DELETE FROM MC_ESTADO WHERE SG_ESTADO = 'SP';
--Não foi possível pois contem uma restrição da chave estrangeira onde está referenciando na tabela cidade. 

--s) Selecione um produto e tente atualizar o status do produto com status X. Isso foi possível? Justifique o motivo.
UPDATE MC_PRODUTO SET ST_PRODUTO = 'X' WHERE CD_PRODUTO = 1;
--Não foi possível pois contém uma restrição que só aceita status A e I sendo assim o status X um status inválido.

--t) Confirme todas as transações pendentes.

COMMIT;
