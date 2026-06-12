CREATE TABLE proveedor (

    id BIGSERIAL PRIMARY KEY,

    razon_social VARCHAR(150) NOT NULL,

    contacto VARCHAR(100),

    email VARCHAR(150),

    telefono VARCHAR(50),

    dias_credito INTEGER NOT NULL DEFAULT 0,

    estado BOOLEAN NOT NULL DEFAULT TRUE,

    fecha_creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP

);