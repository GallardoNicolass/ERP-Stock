CREATE TABLE rol (

    id BIGSERIAL PRIMARY KEY,

    nombre VARCHAR(50) NOT NULL UNIQUE,

    descripcion TEXT,

    estado BOOLEAN NOT NULL DEFAULT TRUE,

    fecha_creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP

);

INSERT INTO rol (
    nombre,
    descripcion
)
VALUES
(
    'Administrador',
    'Acceso completo al sistema'
),
(
    'Vendedor',
    'Gestion de ventas y consulta de productos'
),
(
    'Deposito',
    'Gestion de stock y movimientos de inventario'
);