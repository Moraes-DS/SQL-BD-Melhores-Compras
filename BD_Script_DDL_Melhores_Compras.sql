/*
Script SQL-DDL para criação do Banco de Dados relacional 
via Oracle Data Modeler do Melhores Compres (e-commerce)
*/

DROP TABLE mc_cliente CASCADE CONSTRAINTS;
DROP TABLE mc_depto CASCADE CONSTRAINTS;
DROP TABLE mc_video_produto CASCADE CONSTRAINTS;
DROP TABLE mc_produto CASCADE CONSTRAINTS;
DROP TABLE mc_produto_cliente CASCADE CONSTRAINTS;
DROP TABLE mc_visu_video CASCADE CONSTRAINTS;
DROP TABLE mc_sgv_sac CASCADE CONSTRAINTS;
DROP TABLE mc_end_func CASCADE CONSTRAINTS;
DROP TABLE mc_end_cli CASCADE CONSTRAINTS;
DROP TABLE mc_logradouro CASCADE CONSTRAINTS;
DROP TABLE mc_bairro CASCADE CONSTRAINTS;
DROP TABLE mc_cidade CASCADE CONSTRAINTS;
DROP TABLE mc_estado CASCADE CONSTRAINTS;
DROP TABLE mc_cli_fisica CASCADE CONSTRAINTS;
DROP TABLE mc_cli_juridica CASCADE CONSTRAINTS;
DROP TABLE mc_funcionario CASCADE CONSTRAINTS;
DROP TABLE assistir CASCADE CONSTRAINTS;
DROP TABLE mc_categoria_video CASCADE CONSTRAINTS;
DROP TABLE mc_categoria_prod CASCADE CONSTRAINTS;
DROP SEQUENCE mc_sgv_sac_sequence;
DROP SEQUENCE mc_produto_sequence;
DROP SEQUENCE mc_categoria_prod_sequence;


CREATE TABLE mc_estado (
    sg_estado CHAR(2)  PRIMARY KEY,
    nm_estado VARCHAR2(30) NOT NULL
);

CREATE TABLE mc_cidade (
    cd_cidade NUMBER(8)  PRIMARY KEY,
    sg_estado CHAR(2) NOT NULL,
    nm_cidade VARCHAR2(60) NOT NULL,
    cd_ibge   NUMBER(8),
    nr_ddd    NUMBER(3)
);

CREATE TABLE mc_bairro (
    cd_bairro      NUMBER(8) PRIMARY KEY,
    cd_cidade      NUMBER(8) NOT NULL,
    nm_bairro      VARCHAR2(45),
    nm_zona_bairro VARCHAR2(20)
);

CREATE TABLE mc_logradouro (
    mc_logradouro_id NUMBER PRIMARY KEY,
    cd_logradouro    NUMBER(10) NOT NULL,
    cd_bairro        NUMBER(8) NOT NULL,
    nm_logradouro    VARCHAR2(160) NOT NULL,
    nr_cep           NUMBER(8)
);

ALTER TABLE mc_logradouro ADD CONSTRAINT mc_logradouro_cd_logradouro_un UNIQUE ( cd_logradouro );

CREATE TABLE mc_depto (
    cd_depto NUMBER(3) PRIMARY KEY,
    nm_depto VARCHAR2(100) NOT NULL,
    st_depto CHAR(1) NOT NULL
);

CREATE TABLE mc_funcionario (
    cd_funcionario    NUMBER(10) PRIMARY KEY,
    cd_depto          NUMBER(3) NOT NULL,
    cd_funcionario1   NUMBER(10),
    cd_gerente        NUMBER,
    nm_funcionario    VARCHAR2(160) NOT NULL,
    dt_nascimento     DATE NOT NULL,
    fl_sexo_biologico CHAR(1),
    ds_genero         VARCHAR2(100),
    ds_cargo          VARCHAR2(80) NOT NULL,
    vl_salario        NUMBER(10, 2),
    ds_email          VARCHAR2(80),
    st_func           CHAR(1),
    dt_cadastramento  DATE,
    dt_desligamento   DATE,
);

CREATE TABLE mc_end_func (
    cd_logradouro_func NUMBER PRIMARY KEY,
    cd_funcionario     NUMBER(10) NOT NULL,
    nr_end             NUMBER(8) NOT NULL,
    ds_complemento_end VARCHAR2(80),
    dt_inicio          DATE NOT NULL,
    dt_termino         DATE,
    st_end             CHAR(1) NOT NULL,
    mc_logradouro_id   NUMBER NOT NULL
);

CREATE TABLE mc_sgv_sac (
    nr_sac                   NUMBER(10) PRIMARY KEY,
    cd_funcionario           NUMBER(10) NOT NULL,
    cd_produto               NUMBER(10) NOT NULL,
    nr_cliente               NUMBER(10) NOT NULL,
    ds_detalhada_sac         CLOB NOT NULL,
    dt_abertura_sac          DATE NOT NULL,
    hr_abertura_sac          NUMBER(2) NOT NULL,
    dt_atendimento           DATE,
    hr_atendimento_sac       NUMBER(2),
    nr_tempo_total_sac       NUMBER(10),
    ds_detalhada_retorno_sac CLOB,
    tp_sac                   CHAR(2) NOT NULL,
    st_sac                   CHAR(1) NOT NULL,
    nr_indice_satisfacao     NUMBER(2)
);

CREATE SEQUENCE mc_sgv_sac_sequence 
INCREMENT BY 1 
START WITH 1
MAXVALUE 999
NOCACHE 
CYCLE;
ALTER TABLE mc_sgv_sac ADD CONSTRAINT st_sac_ck CHECK (st_sac IN ('A', 'E','C','F','X'));
ALTER TABLE mc_sgv_sac ADD CONSTRAINT nr_indice_satisfacao_ck CHECK (nr_indice_satisfacao BETWEEN 1 AND 10);
ALTER TABLE mc_sgv_sac ADD CONSTRAINT tp_sac_ck CHECK (tp_sac IN ('T1', 'T2'));

CREATE TABLE mc_cliente (
    nr_cliente      NUMBER(10) PRIMARY KEY,
    nm_cliente      VARCHAR2(160) NOT NULL,
    qt_estrelas     NUMBER(1),
    vl_medio_compra NUMBER(10, 2),
    st_cliente      CHAR(1),
    ds_email        VARCHAR2(100),
    nr_telefone     VARCHAR2(20),
    nm_login        VARCHAR2(50) NOT NULL,
    ds_senha        VARCHAR2(50) NOT NULL
);
ALTER TABLE mc_cliente ADD CONSTRAINT uk_mc_cliente_nome_cliente UNIQUE ( nm_cliente );
ALTER TABLE mc_cliente ADD CONSTRAINT mc_cliente_ck CHECK (st_cliente IN ('F', 'J'));

CREATE TABLE mc_end_cli (
    cd_logradouro_cli  NUMBER PRIMARY KEY,
    nr_cliente         NUMBER(10) NOT NULL,
    cd_logradouro      NUMBER(10) NOT NULL,
    nr_end             NUMBER(8) NOT NULL,
    ds_complemento_end VARCHAR2(80),
    dt_inicio          DATE,
    dt_termino         DATE,
    st_end             CHAR(1)
);

CREATE TABLE mc_cli_fisica (
    nr_cliente        NUMBER(10) PRIMARY KEY,
    dt_nascimento     DATE NOT NULL,
    fl_sexo_biologico CHAR(1) NOT NULL,
    ds_genero         VARCHAR2(100),
    nr_cpf            VARCHAR2(14) NOT NULL
);

CREATE TABLE mc_cli_juridica (
    nr_cliente   NUMBER(10) NOT NULL,
    dt_fundacao  DATE,
    nr_cnpj      VARCHAR2(20),
    nr_inscr_est VARCHAR2(15)
);

CREATE TABLE mc_produto (
    cd_produto        NUMBER(10) PRIMARY KEY,
    cd_categoria      NUMBER NOT NULL,
    ds_produto        VARCHAR2(80) NOT NULL,
    nr_cd_barras_prod VARCHAR2(50),
    vl_unitario       NUMBER(8, 2) NOT NULL,
    tp_embalagem      VARCHAR2(15),
    st_produto        CHAR(1),
    vl_perc_lucro     NUMBER(8, 2),
    ds_completa_prod  VARCHAR2(4000) NOT NULL
);

CREATE SEQUENCE mc_produto_sequence 
INCREMENT BY 1 
START WITH 1
MAXVALUE 999 
NOCACHE 
CYCLE;

ALTER TABLE mc_produto ADD CONSTRAINT ds_produto_uk UNIQUE ( ds_produto );

CREATE TABLE mc_produto_cliente (
    cd_produto NUMBER(10) NOT NULL,
    nr_cliente NUMBER(10) NOT NULL
);

ALTER TABLE mc_produto_cliente ADD CONSTRAINT comprar_pk PRIMARY KEY ( cd_produto,
                                                                       nr_cliente );

CREATE TABLE mc_video_produto (
    nm_video_produto VARCHAR2 (100) PRIMARY KEY,
    nm_classificacao VARCHAR2 (100) NOT NULL,
    cd_produto       NUMBER(10) NOT NULL,
    dt_video_produto DATE NOT NULL,
    st_video_produto CHAR(1) NOT NULL
);
ALTER TABLE mc_video_produto ADD CONSTRAINT st_video_produto_ck CHECK (st_video_produto IN ('A', 'I'));

CREATE TABLE mc_visu_video (
    nr_visu_video    NUMBER PRIMARY KEY,
    nm_video_produto VARCHAR2 (100) NOT NULL,
    cd_produto       NUMBER(10) NOT NULL,
    dt_hr_visu_video TIMESTAMP NOT NULL,
    st_video_produto CHAR(1) NOT NULL, 
    nr_cliente       NUMBER 
);

CREATE TABLE assistir (
    nm_video_produto VARCHAR2 (100) NOT NULL,
    nr_cliente       NUMBER(10) NOT NULL
);

ALTER TABLE assistir ADD CONSTRAINT assistir_pk PRIMARY KEY ( nm_video_produto,
                                                              nr_cliente );
CREATE TABLE mc_categoria_prod (
    cd_categoria NUMBER PRIMARY KEY,
    ds_categoria VARCHAR2(500) NOT NULL,
    tp_categoria CHAR(1) NOT NULL,
    dt_inicio    DATE NOT NULL,
    dt_termino   DATE,
    st_categoria CHAR(1) NOT NULL
);

CREATE SEQUENCE mc_categoria_prod_sequence 
INCREMENT BY 1 
START WITH 1
MAXVALUE 999 
NOCACHE 
CYCLE;
ALTER TABLE mc_categoria_prod ADD CONSTRAINT ds_categoria_uk UNIQUE ( ds_categoria );
ALTER TABLE mc_categoria_prod ADD CONSTRAINT st_categoria_ck CHECK (st_categoria IN ('A', 'I'));

CREATE TABLE mc_categoria_video (
    nm_classificacao VARCHAR2 (100) PRIMARY KEY,
    ds_classificacao VARCHAR2 (100) NOT NULL
);

ALTER TABLE assistir
    ADD CONSTRAINT assistir_mc_cliente_fk FOREIGN KEY ( nr_cliente )
        REFERENCES mc_cliente ( nr_cliente );

ALTER TABLE assistir
    ADD CONSTRAINT assistir_mc_video_produto_fk FOREIGN KEY ( nm_video_produto )
        REFERENCES mc_video_produto ( nm_video_produto );

ALTER TABLE mc_produto_cliente
    ADD CONSTRAINT comprar_mc_cliente_fk FOREIGN KEY ( nr_cliente )
        REFERENCES mc_cliente ( nr_cliente );

ALTER TABLE mc_produto_cliente
    ADD CONSTRAINT comprar_mc_produto_fk FOREIGN KEY ( cd_produto )
        REFERENCES mc_produto ( cd_produto );

ALTER TABLE mc_video_produto
    ADD CONSTRAINT conter FOREIGN KEY ( cd_produto )
        REFERENCES mc_produto ( cd_produto );

ALTER TABLE mc_end_func
    ADD CONSTRAINT fk_mc_end_func_logradouro FOREIGN KEY ( mc_logradouro_id )
        REFERENCES mc_logradouro ( mc_logradouro_id );

ALTER TABLE mc_visu_video
    ADD CONSTRAINT haver FOREIGN KEY ( cd_produto )
        REFERENCES mc_produto ( cd_produto );

ALTER TABLE mc_bairro
    ADD CONSTRAINT mc_bairro_cidade FOREIGN KEY ( cd_cidade )
        REFERENCES mc_cidade ( cd_cidade );

ALTER TABLE mc_cidade
    ADD CONSTRAINT mc_cidade_estado FOREIGN KEY ( sg_estado )
        REFERENCES mc_estado ( sg_estado );

ALTER TABLE mc_end_cli
    ADD CONSTRAINT mc_cliente_end_cli FOREIGN KEY ( nr_cliente )
        REFERENCES mc_cliente ( nr_cliente );

ALTER TABLE mc_funcionario
    ADD CONSTRAINT mc_depto_funcionario FOREIGN KEY ( cd_depto )
        REFERENCES mc_depto ( cd_depto );

ALTER TABLE mc_end_cli
    ADD CONSTRAINT mc_end_cli_logradouro FOREIGN KEY ( cd_logradouro )
        REFERENCES mc_logradouro ( cd_logradouro );

ALTER TABLE mc_end_func
    ADD CONSTRAINT mc_funcionario_end FOREIGN KEY ( cd_funcionario )
        REFERENCES mc_funcionario ( cd_funcionario );

ALTER TABLE mc_sgv_sac
    ADD CONSTRAINT mc_funcionario_sac FOREIGN KEY ( cd_funcionario )
        REFERENCES mc_funcionario ( cd_funcionario );

ALTER TABLE mc_logradouro
    ADD CONSTRAINT mc_logradouro_bairro FOREIGN KEY ( cd_bairro )
        REFERENCES mc_bairro ( cd_bairro );

ALTER TABLE mc_produto
    ADD CONSTRAINT mc_produto_categoria FOREIGN KEY ( cd_categoria )
        REFERENCES mc_categoria_prod ( cd_categoria );

ALTER TABLE mc_sgv_sac
    ADD CONSTRAINT mc_produto_sac FOREIGN KEY ( cd_produto )
        REFERENCES mc_produto ( cd_produto );

ALTER TABLE mc_visu_video
    ADD CONSTRAINT mc_visu_video_produto FOREIGN KEY ( nm_video_produto )
        REFERENCES mc_video_produto ( nm_video_produto );

ALTER TABLE mc_sgv_sac
    ADD CONSTRAINT fk_mc_cliente FOREIGN KEY ( nr_cliente )
        REFERENCES mc_cliente ( nr_cliente );

ALTER TABLE mc_funcionario
    ADD CONSTRAINT fk_mc_funcionario FOREIGN KEY ( cd_funcionario1 )
        REFERENCES mc_funcionario ( cd_funcionario );

ALTER TABLE mc_cli_juridica
    ADD CONSTRAINT fk_mc_cli_juridica_cliente FOREIGN KEY ( nr_cliente )
        REFERENCES mc_cliente ( nr_cliente );

ALTER TABLE mc_cli_fisica
    ADD CONSTRAINT fk_mc_cli_fisica_cliente FOREIGN KEY ( nr_cliente )
        REFERENCES mc_cliente ( nr_cliente );

ALTER TABLE mc_video_produto
    ADD CONSTRAINT ter FOREIGN KEY ( nm_classificacao )
        REFERENCES mc_categoria_video ( nm_classificacao );












