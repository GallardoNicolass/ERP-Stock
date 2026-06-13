CREATE TABLE usuario (

    id BIGSERIAL PRIMARY KEY,

    nombre VARCHAR(100) NOT NULL,

    apellido VARCHAR(100) NOT NULL,

    email VARCHAR(150) NOT NULL UNIQUE,

    password_hash VARCHAR(255) NOT NULL,

    rol_id BIGINT NOT NULL,

    estado BOOLEAN NOT NULL DEFAULT TRUE,

    ultimo_acceso TIMESTAMP,

    fecha_creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_usuario_rol
        FOREIGN KEY (rol_id)
        REFERENCES rol(id)

);