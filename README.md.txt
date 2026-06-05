# 📊 Optimización de Inventarios mediante Análisis Avanzado ABC-XYZ y Power BI

## 📋 Descripción del Proyecto
Este proyecto resuelve un problema crítico en la gestión de la cadena de suministro (*Supply Chain*): el capital inmovilizado y el riesgo de quiebre de stock en un inventario de distribución tecnológica y mobiliario corporativo.

Utilizando **SQL Avanzado (MySQL)**, se diseñó un pipeline de datos transaccionales para clasificar dinámicamente los productos cruzando dos metodologías fundamentales:
1. **Análisis ABC (Criterio Financiero):** Segmentación basada en el valor monetario del inventario inmovilizado (Principio de Pareto - 80/15/5).
2. **Análisis XYZ (Criterio de Variabilidad):** Segmentación basada en el Coeficiente de Variación ($CV$) de la demanda mensual para medir la predictibilidad de las ventas.

El resultado final es una **Matriz Estratégica ABC-XYZ** completamente automatizada a través de una Vista Lógica en SQL y visualizada en un **Dashboard Interactivo de Power BI** para la toma de decisiones ejecutivas.

---

## 🛠️ Tecnologías Utilizadas
* **Base de Datos:** MySQL Server (SQL Avanzado: CTEs, Window Functions, Vistas, CASE WHEN).
* **Visualización & BI:** Power BI Desktop (Modelado de datos, DAX, Storytelling).
* **Formato de Orígenes:** CSV Transaccionales.

---

## 🚀 Estructura del Proyecto

* `/SQL`: Contiene el script maestro `script_maestro.sql` estructurado cronológicamente en 4 fases (Diseño DDL, Carga DML, Consultas de Auditoría y Creación de la Vista Final).
* `/PowerBI`: Archivo `.pbix` con el modelo relacional y tableros interactivos.
* `/Images`: Capturas de pantalla de la interfaz del reporte.

---

## 📉 Arquitectura de Datos e Ingeniería SQL
El corazón analítico del proyecto reside en la base de datos. La matriz se consolidó mediante una única vista optimizada (`vista_analisis_xyz`) que ejecuta de forma secuencial:
* Consolidación transaccional por año y mes.
* Cálculo de Desviación Estándar (`STDDEV`) y Promedios Mensuales para obtener el Coeficiente de Variación (XYZ).
* Cálculo del porcentaje acumulado sobre el valor del inventario total usando funciones de ventana (`SUM() OVER`) para la clasificación de Pareto (ABC).

*(El código completo y documentado paso a paso se encuentra en la carpeta `/SQL`)*.

---

## 🖥️ Estructura del Dashboard e Interfaz de Usuario

El reporte interactivo se divide en tres perspectivas clave y complementarias para la toma de decisiones:

### 1. Panel de Optimización de Inventarios (Matriz ABC-XYZ)
Esta es la vista estratégica central del proyecto. Integra los cálculos de variabilidad y valor monetario realizados en SQL. Permite al usuario identificar instantáneamente qué productos caen en el cuadrante crítico **AX** (alta inversión, ventas estables que exigen control estricto) o en cuadrantes **CZ** (baja inversión, demanda impredecible). Incluye un análisis de Pareto interactivo y la distribución porcentual por categorías.

![Optimización de Inventarios](../Images/Optimizacion_Inventarios_View.png)

### 2. Panel de Control de Stock & Logística de Almacenes
Una vista puramente operativa diseñada para la gestión diaria de los almacenes (`ALM-CENTRAL`, `ALM-ACCESORIOS`, etc.). Expone de forma gráfica el balance entre el Stock Actual y el Stock de Seguridad, disparando alertas automáticas sobre qué productos específicos se encuentran en estado de **REORDENAR** o en nivel **CRÍTICO** para mitigar de inmediato cualquier riesgo de quiebra de stock.

![Control de Stock](../Images/Control_Stock_Y_Logistica_Almacenes_View.png)

### 3. Panel de Rendimiento de Ventas
Perspectiva histórica-comercial que analiza el comportamiento transaccional de la empresa. Muestra de forma acumulada las unidades vendidas, el top de productos con mayor salida y la evolución temporal de la demanda mensual. Es la base que alimenta la lógica analítica de la desviación estándar utilizada en la matriz XYZ.

![Rendimiento de Ventas](../Images/Rendimiento_Ventas_View.png)

---

## 💡 Conclusiones y Retorno de Inversión (ROI)
* **Reducción de Capital Atrapado:** Al segmentar los productos 'A', la empresa puede liberar hasta un 20% de flujo de caja optimizando los niveles de stock de seguridad de alta inversión.
* **Mitigación de Rupturas:** El sistema automatizado de alertas detecta tempranamente productos en estado 'REORDENAR', asegurando la continuidad del negocio en categorías clave de Tecnología.