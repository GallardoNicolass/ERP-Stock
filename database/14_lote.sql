CREATE TABLE lote (

    id BIGSERIAL PRIMARY KEY,

    producto_id BIGINT NOT NULL,

    proveedor_id BIGINT NOT NULL,

    numero_lote VARCHAR(100) NOT NULL,

    fecha_ingreso DATE NOT NULL,

    fecha_vencimiento DATE,

    estado VARCHAR(20) NOT NULL DEFAULT 'ACTIVO',

    fecha_agotamiento DATE,

    fecha_creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_lote_producto
        FOREIGN KEY (producto_id)
        REFERENCES producto(id),

    CONSTRAINT fk_lote_proveedor
        FOREIGN KEY (proveedor_id)
        REFERENCES proveedor(id),

    CONSTRAINT uq_lote_producto_numero
        UNIQUE (producto_id, numero_lote),

    CONSTRAINT chk_lote_estado
        CHECK (
            estado IN (
                'ACTIVO',
                'AGOTADO',
                'VENCIDO',
                'BLOQUEADO'
            )
        )

);