CREATE TABLE producto (

    id BIGSERIAL PRIMARY KEY,

    codigo_interno VARCHAR(20) NOT NULL UNIQUE,

    codigo_barras VARCHAR(50) UNIQUE,

    nombre VARCHAR(255) NOT NULL UNIQUE,

    descripcion TEXT,

    categoria_id BIGINT NOT NULL,

    marca_id BIGINT NOT NULL,

    proveedor_id BIGINT NOT NULL,

    unidad_medida_id BIGINT NOT NULL,

    precio_compra_actual NUMERIC(12,2) NOT NULL,

    precio_venta_actual NUMERIC(12,2) NOT NULL,

    precio_sugerido NUMERIC(12,2),

    stock_minimo NUMERIC(10,2) NOT NULL DEFAULT 0,

    estado BOOLEAN NOT NULL DEFAULT TRUE,

    fecha_creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    usuario_modificacion BIGINT,

    CONSTRAINT fk_producto_categoria
        FOREIGN KEY (categoria_id)
        REFERENCES categoria(id),

    CONSTRAINT fk_producto_marca
        FOREIGN KEY (marca_id)
        REFERENCES marca(id),

    CONSTRAINT fk_producto_proveedor
        FOREIGN KEY (proveedor_id)
        REFERENCES proveedor(id),

    CONSTRAINT fk_producto_unidad_medida
        FOREIGN KEY (unidad_medida_id)
        REFERENCES unidad_medida(id),

    CONSTRAINT fk_producto_usuario
        FOREIGN KEY (usuario_modificacion)
        REFERENCES usuario(id)

);