-- =========================================================================
-- PROYECTO: DASHBOARD DE OPTIMIZACIÓN DE INVENTARIOS (ANÁLISIS ABC-XYZ)

-- FASE 1: DEFINICIÓN DE LA ESTRUCTURA DE LA BASE DE DATOS (DDL)
-- =========================================================================
USE inventory_analytics;
-- 1. Crear la tabla de Productos
CREATE TABLE Productos (
    producto_id INT PRIMARY KEY,
    nombre_producto VARCHAR(100),
    categoria VARCHAR(50),
    costo_unitario DECIMAL(10,2)
);

-- 2. Crear la tabla de Inventario
CREATE TABLE Inventario (
    producto_id INT,
    stock_actual INT,
    stock_seguridad INT, -- Lo mínimo que deberías tener para no quebrar stock
    codigo_almacen VARCHAR(10),
    FOREIGN KEY (producto_id) REFERENCES Productos(producto_id)
);

-- 3. Crear la tabla de Historial de Ventas
CREATE TABLE Ventas (
    venta_id INT PRIMARY KEY,
    producto_id INT,
    fecha_venta DATE,
    cantidad_vendida INT,
    precio_final_venta DECIMAL(10,2),
    FOREIGN KEY (producto_id) REFERENCES Productos(producto_id)
);

-- FASE 2: INSERCIÓN DE DATOS
-- =========================================================================
INSERT INTO Productos VALUES 
(101, 'Laptop Corporativa i7', 'Tecnología', 850.00),
(102, 'Mouse Inalámbrico Ergonómico', 'Accesorios', 25.00),
(103, 'Monitor Gamer 27 Pulgadas', 'Tecnología', 320.00),
(104, 'Teclado Mecánico RGB', 'Accesorios', 65.00),
(105, 'Cable HDMI 2.0 (3 metros)', 'Conectividad', 12.00),
(106, 'Disco Duro Externo 2TB', 'Almacenamiento', 90.00),
(107, 'Memoria RAM DDR4 16GB', 'Componentes', 55.00),
(108, 'Silla Ergonómica de Oficina', 'Mobiliario', 210.00),
(109, 'Cámara Web Full HD 1080p', 'Accesorios', 45.00),
(110, 'Audífonos Bluetooth con ANC', 'Audio', 130.00),
(111, 'Hub USB-C 7 en 1', 'Conectividad', 35.00),
(112, 'Impresora Láser Monocromática', 'Tecnología', 180.00),
(113, 'Soporte para Monitor Dual', 'Mobiliario', 40.00),
(114, 'Power Bank 20000mAh', 'Accesorios', 28.00),
(115, 'Escáner de Documentos Portátil', 'Tecnología', 220.00);

INSERT INTO Inventario VALUES 
(101, 12, 15, 'ALM-CENTRAL'),
(102, 150, 30, 'ALM-ACCESORIOS'),
(103, 8, 10, 'ALM-CENTRAL'),
(104, 45, 10, 'ALM-ACCESORIOS'),
(105, 300, 50, 'ALM-NORD'),
(106, 60, 15, 'ALM-CENTRAL'),
(107, 85, 20, 'ALM-CENTRAL'),
(108, 15, 4, 'ALM-MUEBLES'),
(109, 40, 10, 'ALM-ACCESORIOS'),
(110, 25, 30, 'ALM-CENTRAL'),
(111, 95, 15, 'ALM-NORD'),
(112, 7, 3, 'ALM-CENTRAL'),
(113, 20, 5, 'ALM-MUEBLES'),
(114, 110, 20, 'ALM-ACCESORIOS'),
(115, 4, 2, 'ALM-CENTRAL');

INSERT INTO Ventas VALUES 
(1, 101, '2026-01-15', 10, 8500.00),
(2, 101, '2026-02-18', 12, 10200.00),
(3, 101, '2026-03-12', 11, 9350.00),
(4, 102, '2026-01-05', 80, 2000.00),
(5, 102, '2026-01-20', 45, 1125.00),
(6, 102, '2026-02-10', 85, 2125.00),
(7, 102, '2026-02-25', 60, 1500.00),
(8, 102, '2026-03-11', 78, 1950.00),
(9, 102, '2026-03-29', 90, 2250.00),
(10, 103, '2026-01-20', 5, 1600.00),
(11, 103, '2026-02-15', 15, 4800.00),
(12, 103, '2026-03-05', 4, 1280.00),
(13, 104, '2026-01-11', 30, 1950.00),
(14, 104, '2026-02-28', 2, 130.00),
(15, 104, '2026-03-15', 45, 2925.00),
(16, 105, '2026-01-02', 120, 1440.00),
(17, 105, '2026-01-22', 95, 1140.00),
(18, 105, '2026-02-14', 115, 1380.00),
(19, 105, '2026-02-28', 130, 1560.00),
(20, 105, '2026-03-20', 125, 1500.00),
(21, 105, '2026-03-30', 110, 1320.00),
(22, 106, '2026-01-18', 20, 1800.00),
(23, 106, '2026-02-19', 40, 3600.00),
(24, 106, '2026-03-25', 15, 1350.00),
(25, 107, '2026-01-22', 35, 1925.00),
(26, 107, '2026-02-22', 38, 2090.00),
(27, 107, '2026-03-22', 36, 1980.00),
(28, 108, '2026-01-05', 2, 420.00),
(29, 108, '2026-01-26', 1, 210.00),
(30, 108, '2026-02-12', 18, 3780.00),
(31, 108, '2026-03-19', 1, 210.00),
(32, 109, '2026-01-30', 12, 540.00),
(33, 109, '2026-02-27', 25, 1125.00),
(34, 109, '2026-03-28', 14, 630.00),
(35, 110, '2026-01-14', 15, 1950.00),
(36, 110, '2026-02-14', 16, 2080.00),
(37, 110, '2026-03-14', 14, 1820.00),
(38, 111, '2026-01-08', 50, 1750.00),
(39, 111, '2026-02-05', 5, 175.00),
(40, 111, '2026-03-11', 65, 2275.00),
(41, 112, '2026-01-10', 4, 720.00),
(42, 112, '2026-02-11', 5, 900.00),
(43, 112, '2026-03-12', 4, 720.00),
(44, 113, '2026-01-25', 8, 320.00),
(45, 113, '2026-02-20', 16, 640.00),
(46, 113, '2026-03-15', 7, 280.00),
(47, 114, '2026-01-03', 60, 1680.00),
(48, 114, '2026-02-04', 62, 1736.00),
(49, 114, '2026-03-05', 59, 1652.00),
(50, 115, '2026-02-01', 8, 1760.00);


-- FASE 3: CONSULTAS DE ANÁLISIS EXPLICATIVAS
-- =========================================================================
-- Estas consultas intermedias sirvieron para validar la integridad del modelo 
-- y desarrollar las reglas de negocio iniciales requeridas por la gerencia.

-- Consulta 3.1: 
/*El Gerente de Operaciones te pide un reporte urgente porque sospecha que hay dinero 
"muerto" en el almacén (productos que no se venden) y, al mismo tiempo, clientes insatisfechos 
porque no hay stock de lo que sí se vende.

Escribe una consulta SQL que devuelva una sola tabla con las siguientes columnas:
	1. producto_id y nombre_producto.
	2. stock_actual.
	3. total_unidades_vendidas (la suma de todo lo vendido en el histórico).
	4. estado_stock: Una columna condicional (CASE WHEN) que diga:
		-'CRÍTICO' si el stock actual es 0.
		-'REORDENAR' si el stock actual es menor al stock_seguridad.
		-'OK' si el stock es suficiente.*/
WITH Ventas_Productos_CTE AS
(
SELECT producto_id, SUM(cantidad_vendida) as ventas_producto
FROM ventas
GROUP BY producto_id
)
SELECT 
	p.producto_id, 
    p.nombre_producto, 
    i.stock_actual, 
    coalesce(v.ventas_producto,0) as unidades_vendidas,
	CASE
		WHEN i.stock_actual = 0 THEN 'CRITICO'
		WHEN i.stock_actual < i.stock_seguridad THEN 'REORDENAR'
		ELSE 'OK'
	END AS estado_actual
FROM productos AS p
INNER JOIN inventario AS i
	ON p.producto_id = i.producto_id
LEFT JOIN Ventas_Productos_CTE AS v 
	ON p.producto_id = v.producto_id;


-- Consulta 3.2: Auditoría de Capital Financiero Inmovilizado en Almacén
/*El Gerente vio tu reporte corregido y ahora quiere priorizar el gasto.
No es lo mismo que te falte una batería de $85.00 a que te falte un líquido de frenos de $5.50.

Modifica el query anterior (o escribe uno nuevo) para agregar una columna llamada capital_atrapado.
Esta columna debe calcular cuánto dinero tiene la empresa invertido en el almacén por cada producto 
(es decir: stock_actual multiplicado por el costo_unitario del producto).

Ordéna el resultado de mayor a menor según ese capital atrapado*/
WITH Ventas_Productos_CTE AS
(
SELECT producto_id, SUM(cantidad_vendida) as ventas_producto
FROM ventas
GROUP BY producto_id

)
SELECT 
	p.producto_id, 
    p.nombre_producto, 
    i.stock_actual, 
    coalesce(v.ventas_producto,0) as unidades_vendidas,
	CASE
		WHEN i.stock_actual = 0 THEN 'CRITICO'
		WHEN i.stock_actual < i.stock_seguridad THEN 'REORDENAR'
		ELSE 'OK'
	END AS estado_actual,
    (p.costo_unitario * i.stock_actual) AS capital_atrapado
FROM productos AS p
INNER JOIN inventario AS i
	ON p.producto_id = i.producto_id
LEFT JOIN Ventas_Productos_CTE AS v 
	ON p.producto_id = v.producto_id
ORDER BY capital_atrapado DESC;


-- Consulta 3.3: Medición Preliminar de Estadísticas y Estabilidad de la Demanda
/*además de sumar las ventas, calcule la desviación estándar de las cantidades vendidas por producto.
Tu consulta final debe mostrar:
	1. producto_id y nombre_producto.
	2. total_unidades_vendidas.
	3. desviacion_estandar_ventas.
	4. promedio_ventas.*/
WITH Ventas_Mensuales_CTE AS (
    SELECT 
        producto_id,
        EXTRACT(YEAR FROM fecha_venta) as anio,
        EXTRACT(MONTH FROM fecha_venta) as mes,
        SUM(cantidad_vendida) AS total_vendido_mes
    FROM ventas
    GROUP BY producto_id, EXTRACT(YEAR FROM fecha_venta), EXTRACT(MONTH FROM fecha_venta)
),
Estadisticas_Demanda_CTE AS (
    SELECT 
        producto_id,
        SUM(total_vendido_mes) AS unidades_vendidas,
        AVG(total_vendido_mes) AS promedio_ventas_mensual,
        STDDEV(total_vendido_mes) AS desviacion_estandar_mensual
    FROM Ventas_Mensuales_CTE
    GROUP BY producto_id
)
SELECT
    p.producto_id, 
    p.nombre_producto, 
    COALESCE(e.unidades_vendidas, 0) AS unidades_vendidas,
    COALESCE(e.promedio_ventas_mensual, 0) AS prom_ventas_mensual,
    COALESCE(e.desviacion_estandar_mensual, 0) AS desv_estandar_mensual
FROM productos AS p
LEFT JOIN Estadisticas_Demanda_CTE AS e
    ON p.producto_id = e.producto_id;

-- Consulta 3.4: calcula simultáneamente la variabilidad de demanda (XYZ) mediante desviaciones mensuales.
/*Agrega la columna calculando el coeficiente_variacion y una columna clasificacion_xyz usando el siguiente criterio:

	CV = Desciacion Estandar Mensual / Promedio de Ventas Mensual
    
	- Si CV <= 0.2: Demanda muy estable (Clase X).
    - Si 0.2 < CV <= 0.5: Demanda moderada (Clase Y).
    - Si CV > 0.5: Demanda muy volátil e impredecible (Clase Z).*/
WITH Ventas_Mensuales_CTE AS 
(
    SELECT 
        producto_id,
        EXTRACT(YEAR FROM fecha_venta) as anio, 
        EXTRACT(MONTH FROM fecha_venta) as mes, 
        SUM(cantidad_vendida) AS total_vendido_mes
    FROM ventas
    GROUP BY producto_id, EXTRACT(YEAR FROM fecha_venta), EXTRACT(MONTH FROM fecha_venta)
),
Estadisticas_Demanda_CTE AS
(
    SELECT 
        producto_id,
        SUM(total_vendido_mes) AS unidades_vendidas,
        AVG(total_vendido_mes) AS promedio_ventas_mensual,
        STDDEV(total_vendido_mes) AS desviacion_estandar_mensual
    FROM Ventas_Mensuales_CTE
    GROUP BY producto_id
)
SELECT
    p.producto_id, 
    p.nombre_producto, 
    COALESCE(e.unidades_vendidas, 0) AS unidades_vendidas,
    COALESCE(e.promedio_ventas_mensual, 0) AS prom_ventas_mensual,
    COALESCE(e.desviacion_estandar_mensual, 0) AS desv_estandar_mensual,
    COALESCE(e.desviacion_estandar_mensual / NULLIF(e.promedio_ventas_mensual, 0), 0) AS coef_var,
    -- Clasificación XYZ
    CASE
        WHEN (e.desviacion_estandar_mensual / e.promedio_ventas_mensual) <= 0.2 THEN 'X'
        WHEN (e.desviacion_estandar_mensual / e.promedio_ventas_mensual) > 0.2 
             AND (e.desviacion_estandar_mensual / e.promedio_ventas_mensual) <= 0.5 THEN 'Y'
        WHEN (e.desviacion_estandar_mensual / e.promedio_ventas_mensual) > 0.5 THEN 'Z'
        ELSE 'Z'
    END AS clasificacion_xyz
FROM productos AS p
LEFT JOIN Estadisticas_Demanda_CTE AS e
    ON p.producto_id = e.producto_id;


-- FASE 4: CONSOLIDACIÓN DE LOGÍSTICA AVANZADA (VISTA MAESTRA)
-- =========================================================================
-- En este paso final, se unifica todo el desarrollo matemático anterior.
-- Se calcula simultáneamente la variabilidad de demanda (XYZ) mediante desviaciones mensuales,
-- y la inversión acumulada (ABC) por medio de funciones de ventana de Pareto.

CREATE OR REPLACE VIEW vista_analisis_xyz AS 
WITH Ventas_Mensuales_CTE AS (
    SELECT 
        producto_id,
        EXTRACT(YEAR FROM fecha_venta) as anio, 
        EXTRACT(MONTH FROM fecha_venta) as mes, 
        SUM(cantidad_vendida) AS total_vendido_mes
    FROM ventas
    GROUP BY producto_id, EXTRACT(YEAR FROM fecha_venta), EXTRACT(MONTH FROM fecha_venta)
),
Estadisticas_Demanda_CTE AS (
    SELECT 
        producto_id,
        SUM(total_vendido_mes) AS unidades_vendidas,
        AVG(total_vendido_mes) AS prom_ventas_mensual,
        STDDEV(total_vendido_mes) AS desviacion_estandar_mensual
    FROM Ventas_Mensuales_CTE
    GROUP BY producto_id
),
Resultado_XYZ_CTE AS (
    SELECT
        p.producto_id, 
        p.nombre_producto, 
        COALESCE(e.unidades_vendidas, 0) AS unidades_vendidas,
        COALESCE(e.prom_ventas_mensual, 0) AS prom_ventas_mensual,
        COALESCE(e.desviacion_estandar_mensual, 0) AS desv_estandar_mensual,
        COALESCE(e.desviacion_estandar_mensual / NULLIF(e.prom_ventas_mensual, 0), 0) AS coef_var,
        CASE
            WHEN (e.desviacion_estandar_mensual / e.prom_ventas_mensual) <= 0.2 THEN 'X'
            WHEN (e.desviacion_estandar_mensual / e.prom_ventas_mensual) > 0.2 
                 AND (e.desviacion_estandar_mensual / e.prom_ventas_mensual) <= 0.5 THEN 'Y'
            ELSE 'Z' -- Si no hay ventas (NULL), por seguridad operativa se cataloga en 'Z'
        END AS clasificacion_xyz
    FROM productos AS p
    LEFT JOIN Estadisticas_Demanda_CTE AS e ON p.producto_id = e.producto_id
),
Valor_Inventario_CTE AS (
    SELECT 
        i.producto_id,
        (i.stock_actual * p.costo_unitario) AS valor_monetario
    FROM inventario as i
    JOIN productos AS p ON i.producto_id = p.producto_id
),
Porcentaje_Acumulado_CTE AS (
    SELECT 
        producto_id,
        valor_monetario,
        SUM(valor_monetario) OVER() AS valor_total_inventario,
        SUM(valor_monetario) OVER(ORDER BY valor_monetario DESC) AS valor_acumulado
    FROM Valor_Inventario_CTE
),
Resultado_ABC_CTE AS (
    SELECT 
        producto_id,
        valor_monetario,
        (valor_acumulado / valor_total_inventario) * 100 AS pct_acumulado,
        CASE 
            WHEN (valor_acumulado / valor_total_inventario) <= 0.80 THEN 'A'
            WHEN (valor_acumulado / valor_total_inventario) <= 0.95 THEN 'B'
            ELSE 'C'
        END AS clasificacion_abc
    FROM Porcentaje_Acumulado_CTE
)
SELECT 
    xyz.producto_id,
    xyz.nombre_producto,
    xyz.unidades_vendidas,
    xyz.coef_var,
    xyz.clasificacion_xyz,
    abc.valor_monetario,
    abc.clasificacion_abc,
    CONCAT(abc.clasificacion_abc, xyz.clasificacion_xyz) AS matriz_abc_xyz
FROM Resultado_XYZ_CTE AS xyz
JOIN Resultado_ABC_CTE AS abc ON xyz.producto_id = abc.producto_id;


-- FASE 4: CONSOLIDACIÓN DE LOGÍSTICA AVANZADA (VISTA MAESTRA)
-- =========================================================================
-- En este paso final, se unifica todo el desarrollo matemático anterior.
-- y la inversión acumulada (ABC) por medio de funciones de ventana de Pareto.
CREATE OR REPLACE VIEW vista_analisis_xyz AS 
WITH Ventas_Mensuales_CTE AS (
    SELECT 
        producto_id,
        EXTRACT(YEAR FROM fecha_venta) as anio, 
        EXTRACT(MONTH FROM fecha_venta) as mes, 
        SUM(cantidad_vendida) AS total_vendido_mes
    FROM ventas
    GROUP BY producto_id, EXTRACT(YEAR FROM fecha_venta), EXTRACT(MONTH FROM fecha_venta)
),
Estadisticas_Demanda_CTE AS(
    SELECT 
        producto_id,
        SUM(total_vendido_mes) AS unidades_vendidas,
        AVG(total_vendido_mes) AS prom_ventas_mensual,
        STDDEV(total_vendido_mes) AS desviacion_estandar_mensual
    FROM Ventas_Mensuales_CTE
    GROUP BY producto_id
),
Resultado_XYZ_CTE AS(
	SELECT
		p.producto_id, 
		p.nombre_producto, 
		COALESCE(e.unidades_vendidas, 0) AS unidades_vendidas,
		COALESCE(e.prom_ventas_mensual, 0) AS prom_ventas_mensual,
		COALESCE(e.desviacion_estandar_mensual, 0) AS desv_estandar_mensual,
		COALESCE(e.desviacion_estandar_mensual / NULLIF(e.prom_ventas_mensual, 0), 0) AS coef_var,
		-- Clasificación XYZ
		CASE
			WHEN (e.desviacion_estandar_mensual / e.prom_ventas_mensual) <= 0.2 THEN 'X'
			WHEN (e.desviacion_estandar_mensual / e.prom_ventas_mensual) > 0.2 
				 AND (e.desviacion_estandar_mensual / e.prom_ventas_mensual) <= 0.5 THEN 'Y'
			WHEN (e.desviacion_estandar_mensual / e.prom_ventas_mensual) > 0.5 THEN 'Z'
			ELSE 'Z'
		END AS clasificacion_xyz
	FROM productos AS p
	LEFT JOIN Estadisticas_Demanda_CTE AS e
		ON p.producto_id = e.producto_id
),
Valor_Inventario_CTE AS(
    SELECT 
        i.producto_id,
        (i.stock_actual * p.costo_unitario) AS valor_monetario
    FROM inventario as i
    JOIN productos AS p
		ON i.producto_id = p.producto_id
),
Porcentaje_Acumulado_CTE AS(
    SELECT 
        producto_id,
        valor_monetario,
        SUM(valor_monetario) OVER() AS valor_total_inventario,
        SUM(valor_monetario) OVER(ORDER BY valor_monetario DESC) AS valor_acumulado
    FROM Valor_Inventario_CTE
),
Resultado_ABC_CTE AS(
SELECT 
    producto_id,
    valor_monetario,
    (valor_acumulado / valor_total_inventario) * 100 AS pct_acumulado,
    CASE 
        WHEN (valor_acumulado / valor_total_inventario) <= 0.80 THEN 'A'
        WHEN (valor_acumulado / valor_total_inventario) <= 0.95 THEN 'B'
        ELSE 'C'
    END AS clasificacion_abc
FROM Porcentaje_Acumulado_CTE
)
SELECT 
    xyz.producto_id,
    xyz.nombre_producto,
    xyz.unidades_vendidas,
    xyz.coef_var,
    xyz.clasificacion_xyz,
    abc.valor_monetario,
    abc.clasificacion_abc,
    -- combinación estratégica para la matriz (ej: AX, BY, CZ)
    CONCAT(abc.clasificacion_abc, xyz.clasificacion_xyz) AS matriz_abc_xyz
FROM Resultado_XYZ_CTE AS xyz
JOIN Resultado_ABC_CTE AS abc 
    ON xyz.producto_id = abc.producto_id;


-- Fin del script