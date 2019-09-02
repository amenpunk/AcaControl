create table admin_login(
    id_admin int IDENTITY(1,1) not null,
    nombre_admin VARCHAR(250),
    email VARCHAR(250),
    pass varchar(250),
    rol int,

    CONSTRAINT pk_ad PRIMARY KEY(id_admin),
    CONSTRAINT uq_email UNIQUE(email)
)


create table paciente(

    id_paciente int IDENTITY (1,1)  not null,
    primer_nombre varchar(50),
    segundo_nombre varchar(50),
    primer_apellido varchar(50),
    segundo_apellido varchar(50),
    apellido_casada varchar(50),
    genero char(1),
    fecha_nacimiento date,
    no_id varchar(50),
    tipo_encargado varchar(50),
    nombre_encargado varchar(50),
    numero_tel varchar(20),
    id_admin int,

    CONSTRAINT pk_pa PRIMARY KEY(id_paciente),
    CONSTRAINT fk_ad FOREIGN KEY(id_admin) REFERENCES admin_login(id_admin)
)


create table cita(

    id_cita int IDENTITY (1,1) not null,
    id_paciente int,
    estado varchar(20),
    fecha_inicio DATETIME,
    fecha_final DATETIME,

    CONSTRAINT pk_ci PRIMARY KEY(id_cita),
    CONSTRAINT fk_pa FOREIGN KEY(id_paciente) REFERENCES paciente(id_paciente)
)

create table expediente(
    id_expediente int IDENTITY(1,1) not null,
    fecha_gen date,
    id_paciente int,
    CONSTRAINT pk_exp PRIMARY KEY(id_expediente),
    CONSTRAINT fk_pac FOREIGN KEY(id_paciente) REFERENCES paciente(id_paciente)
)


create table doctor(
    id_doctor int IDENTITY(1,1) not null,
    no_colegiado int,
    nombre varchar(350),

    CONSTRAINT pk_doc PRIMARY KEY(id_doctor)
)


CREATE table enfermera(
    id_enfermera int IDENTITY(1,1) not null,
    nombre varchar(350),
    estado char(1),

    CONSTRAINT pk_enf PRIMARY KEY(id_enfermera)
)

create table signos(
    id_medicion int IDENTITY(1,1) not null, 
    estatura FLOAT,
    peso FLOAT,
    temp FLOAT,
    pulso FLOAT,
    presion_art FLOAT,
    frec_cardiaca FLOAT,
    frec_respiratoria FLOAT,
    id_enfermera int,
    fecha date
    
    CONSTRAINT pk_sig PRIMARY KEY(id_medicion),
    CONSTRAINT fk_enf FOREIGN KEY(id_enfermera) REFERENCES enfermera(id_enfermera)
)

CREATE table consulta(
    id_consulta int,
    id_medicion int,
    id_doctor int,
    asunto varchar(450),
    monto_caja FLOAT,
    fecha datetime,
    tipo_consulta varchar(100),
    id_expediente int,

    CONSTRAINT pk_con PRIMARY KEY(id_consulta),
    CONSTRAINT fk_sig FOREIGN KEY(id_medicion)  REFERENCES signos(id_medicion),
    CONSTRAINT fk_doc FOREIGN KEY(id_doctor) REFERENCES doctor(id_doctor),
    CONSTRAINT fk_exp FOREIGN KEY(id_expediente) REFERENCES expediente(id_expediente)
)


CREATE TABLE diagnostico(
    id_diagnostico int,
    id_cie VARCHAR(250),
    id_consulta int,
    
    CONSTRAINT pk_diag PRIMARY KEY(id_diagnostico),
    CONSTRAINT fk_con FOREIGN KEY (id_consulta) REFERENCES consulta(id_consulta)
)