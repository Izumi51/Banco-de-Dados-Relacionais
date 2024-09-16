CREATE TABLE bem_movel (
    idbm          INTEGER NOT NULL,
    situacao      VARCHAR2(20 CHAR) NOT NULL,
    nomedono      VARCHAR2(30 CHAR) NOT NULL,
    descricao     VARCHAR2(150 CHAR),
    datacompra    DATE NOT NULL,
    valor         FLOAT NOT NULL,
    setor_idsetor VARCHAR2(10) NOT NULL
);

ALTER TABLE bem_movel ADD CONSTRAINT bem_movel_pk PRIMARY KEY ( idbm );

CREATE TABLE dano (
    iddano      INTEGER NOT NULL,
    tipo        VARCHAR2(15 CHAR) NOT NULL,
    descricao   VARCHAR2(150 CHAR),
    ocorrencias INTEGER
);

ALTER TABLE dano ADD CONSTRAINT dano_pk PRIMARY KEY ( iddano );

CREATE TABLE departamento (
    iddepartamento VARCHAR2(10) NOT NULL
);

ALTER TABLE departamento ADD CONSTRAINT departamento_pk PRIMARY KEY ( iddepartamento );

CREATE TABLE ocorrencia (
    idocorrencia   INTEGER NOT NULL,
    dataoco        DATE NOT NULL,
    situacao       VARCHAR2(20) NOT NULL,
    dano_iddano    INTEGER NOT NULL,
    bem_movel_idbm INTEGER NOT NULL,
    setor_idsetor  VARCHAR2(10) NOT NULL
);

ALTER TABLE ocorrencia ADD CONSTRAINT ocorrencia_pk PRIMARY KEY ( idocorrencia );

CREATE TABLE setor (
    idsetor                     VARCHAR2(10) NOT NULL,
    nome                        VARCHAR2(30) NOT NULL,
    departamento_iddepartamento VARCHAR2(10) NOT NULL
);

ALTER TABLE setor ADD CONSTRAINT setor_pk PRIMARY KEY ( idsetor );

ALTER TABLE bem_movel
    ADD CONSTRAINT bem_movel_setor_fk FOREIGN KEY ( setor_idsetor )
        REFERENCES setor ( idsetor );

ALTER TABLE ocorrencia
    ADD CONSTRAINT ocorrencia_bem_movel_fk FOREIGN KEY ( bem_movel_idbm )
        REFERENCES bem_movel ( idbm );

ALTER TABLE ocorrencia
    ADD CONSTRAINT ocorrencia_dano_fk FOREIGN KEY ( dano_iddano )
        REFERENCES dano ( iddano );

ALTER TABLE ocorrencia
    ADD CONSTRAINT ocorrencia_setor_fk FOREIGN KEY ( setor_idsetor )
        REFERENCES setor ( idsetor );

ALTER TABLE setor
    ADD CONSTRAINT setor_departamento_fk FOREIGN KEY ( departamento_iddepartamento )
        REFERENCES departamento ( iddepartamento );
