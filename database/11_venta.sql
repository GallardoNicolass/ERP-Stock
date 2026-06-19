CREATE TABLE venta (

    id BIGSERIAL PRIMARY KEY,

    numero_venta VARCHAR(20) NOT NULL UNIQUE,

    fecha_venta TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    usuario_id BIGINT NOT NULL,

    cliente_id BIGINT,

    total NUMERIC(12,2) NOT NULL CHECK (total >= 0),

    estado VARCHAR(20) NOT NULL DEFAULT 'CONFIRMADA',

    observacion TEXT,

    fecha_creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_venta_usuario
        FOREIGN KEY (usuario_id)
        REFERENCES usuario(id)

);