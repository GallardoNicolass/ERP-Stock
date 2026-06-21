CREATE TABLE detalle_venta (

    id BIGSERIAL PRIMARY KEY,

    venta_id BIGINT NOT NULL,

    producto_id BIGINT NOT NULL,

    cantidad NUMERIC(12,2)
        NOT NULL
        CHECK (cantidad > 0),

    precio_unitario NUMERIC(12,2)
        NOT NULL
        CHECK (precio_unitario >= 0),

    subtotal NUMERIC(12,2)
        NOT NULL
        CHECK (subtotal >= 0),

    observacion TEXT,

    CONSTRAINT fk_detalle_venta
        FOREIGN KEY (venta_id)
        REFERENCES venta(id),

    CONSTRAINT fk_detalle_producto
        FOREIGN KEY (producto_id)
        REFERENCES producto(id)

);