CREATE TABLE movimiento_stock (

    id BIGSERIAL PRIMARY KEY,

    producto_id BIGINT NOT NULL,

    tipo_movimiento_id BIGINT NOT NULL,

    cantidad NUMERIC(12,2) NOT NULL CHECK (cantidad > 0),

    precio_unitario NUMERIC(12,2),

    observacion TEXT,

    fecha_movimiento TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    usuario_id BIGINT NOT NULL,

    CONSTRAINT fk_movimiento_producto
        FOREIGN KEY (producto_id)
        REFERENCES producto(id),

    CONSTRAINT fk_movimiento_tipo
        FOREIGN KEY (tipo_movimiento_id)
        REFERENCES tipo_movimiento(id),

    CONSTRAINT fk_movimiento_usuario
        FOREIGN KEY (usuario_id)
        REFERENCES usuario(id)

);