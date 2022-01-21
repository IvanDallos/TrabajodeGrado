# TrabajodeGrado

En este repositorio se encuentran los principales script que se utilizaron para la elaboración del trabajo de grado.

AnalisisRelaciones.m:
AnalisisReportes.m:

CTERelacionBanda.m: Código de matlab utilizado para adquirir las constantes de las relaciones de banda adquiridas en RelacionBanda.m y MasRelacionBanda.m. Se debe ejecutar desde RelacionBanda.m.

CorrePSK.m: Código de matlab utilizado para ejecutar la correlación de Pearson, Spearman y Kendall. Tiene 2 entradas (Datos a correlacionar) y 6 salidas (Rho-Pearson, Rho-Spearman, Rho-Kendall, Pval-Pearson, Pval-Spearman, Pval-Kendall).

Datos.xlsx: Base de datos utilizada en la elaboración del trabajo. Contiene la base de datos de construcción (Modelo único y modelo doble), validación, turbidez Puerto Mallarino y punto Milán. Adicionalmente tiene una tabla de análisis individual de datos para obtener la ecuación de turbidez.

GraficoBandas:  Código de Google Earth Engine el cual permite descargar los datos de reflectancia de las imágenes satelitales en un periodo de tiempo establecido.

MasRelacionBanda.m: Código de matlab utilizado para adquirir 2 relaciones de banda adicionales. Se debe ejecutar desde RelacionBanda.m.

RelacionBanda.m:  Código de matlab utilizado para análisar e indicar resultados del proyecto. Necesita la relación de banda establecida y la ecuación de turbidez.

VisualizarImagenes: Código de Google Earth Engine el cual permite descargar las imágenes satelitales en un periodo de tiempo establecido para análisis individual.

En el github hace falta poner un README.txt que explique como se usan los rutinas y tenga una descripción de los datos.
