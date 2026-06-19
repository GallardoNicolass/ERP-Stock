CREATE TABLE detalle_pago_venta (

    id BIGSERIAL PRIMARY KEY,

    venta_id BIGINT NOT NULL,

    metodo_pago_id BIGINT NOT NULL,

    importe NUMERIC(12,2) NOT NULL CHECK (importe > 0),

    CONSTRAINT fk_pago_venta
        FOREIGN KEY (venta_id)
        REFERENCES venta(id),

    CONSTRAINT fk_pago_metodo
        FOREIGN KEY (metodo_pago_id)
        REFERENCES metodo_pago(id)

);