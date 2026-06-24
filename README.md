# ERP Stock

Proyecto de gestión de stock para pequeños comercios.

Fundador: Nicolás Gallardo
Año: 2026 
📚 Resumen Arquitectónico Oficial
Proyecto Izac V1
Módulos construidos
Maestros
01_categoria
02_marca
03_proveedor
04_unidad_medida
05_rol
06_usuario
07_producto
08_tipo_movimiento
10_metodo_pago
Inventario
09_movimiento_stock
14_lote
Ventas
11_venta
12_detalle_venta
13_detalle_pago_venta
Decisiones Arquitectónicas Importantes
Producto
1 producto
↓
1 categoría

1 producto
↓
1 marca

1 producto
↓
1 proveedor principal

Decisión tomada:

Simple para V1
Escalable para V2
Stock

Decisión tomada:

NO guardar negativos

Entradas = positivas
Salidas = positivas

La lógica determina
si suma o resta

Ejemplo:

COMP 100

VEN 15

No:

COMP 100

VEN -15
Movimiento de stock

Decisión tomada:

1 único motor

Tabla:

movimiento_stock

Preparada para futuro:

lote_id NULL

cuando incorporemos FEFO completo.

No creamos:

movimiento_lote

porque generaría dos motores de inventario.

Ventas

Modelo elegido:

venta
↓
detalle_venta

Permite:

1 venta
muchos productos
Métodos de pago

Modelo elegido:

venta
↓
detalle_pago_venta
↓
metodo_pago

Permite:

$30.000 efectivo

$20.000 transferencia

en una misma venta.

Estado de venta

Decisión tomada:

PENDIENTE
CONFIRMADA
ANULADA
Anulación

Decisión tomada:

NO borrar venta

NO borrar detalle

NO borrar pagos

Se conserva auditoría.

Y se devuelve stock mediante movimiento inverso.

Cantidades

Decisión tomada:

NUMERIC(12,2)

en movimientos y ventas.

Permite:

1 martillo

2.5 metros cable

1.75 litros pintura

0.5 kg alimento

sin modificar estructura.

Lotes
Activación

Decisión tomada:

producto.usa_lotes

Permite:

Ferretería
↓
usa_lotes = FALSE

Farmacia
↓
usa_lotes = TRUE
Número de lote

Decisión tomada:

UNIQUE
(
    producto_id,
    numero_lote
)

No:

UNIQUE(numero_lote)

porque distintos proveedores pueden reutilizar nomenclaturas.

Vencimiento

Decisión tomada:

fecha_vencimiento NULL

porque muchos productos:

herramientas
repuestos
electrónica

no vencen.

Estado lote
ACTIVO
AGOTADO
VENCIDO
BLOQUEADO
Agotamiento

Decisión tomada:

NO borrar lote

Se conserva para:

auditoría
recall
costos históricos
trazabilidad
FEFO

Decisión tomada:

Automático

El usuario NO elige lote manualmente.

El sistema elegirá:

First Expired
First Out
Problema detectado y corregido

Durante las pruebas encontramos:

Venta manual -15

Venta automática -15

Resultado:

100 - 15 - 15 = 70

en lugar de:

85

Acción:

Auditoría
Detección
Corrección
Validación

Resultado final:

Stock = 85
Estado actual de Proyecto Izac
14 tablas

Inventario funcionando

Ventas funcionando

Pagos múltiples funcionando

Control de lotes funcionando

Trazabilidad funcionando

Integridad validada


## Decisiones Arquitectónicas - Lotes

### Fuente Única de Verdad

El stock NO se almacena en:

- producto
- lote

El stock se calcula exclusivamente desde:

- movimiento_stock

### Uso de Lotes

Si producto.usa_lotes = TRUE:

- Todo movimiento debe tener lote_id.

Si producto.usa_lotes = FALSE:

- lote_id debe ser NULL.

### Trazabilidad

La tabla lote almacena únicamente:

- identidad del lote
- proveedor
- fechas
- estado

Nunca cantidades.

Las cantidades viven exclusivamente en movimiento_stock.