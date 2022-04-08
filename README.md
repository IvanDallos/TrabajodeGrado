# TrabajodeGrado

En este repositorio se encuentran los principales scripts que se utilizaron para la elaboración del trabajo de grado.

AnalisisCodigo4: Código de Matlab utilizado para la elaboración de la justificación del proyecto. Indica las veces, horas de afección y cantidad de usuarios afectados con el código 4. Es necesario indicar el año y la tabla de reportes de la SUI como entradas. Hace un llamado de AnalisisReportes.m

AnalisisReportes.m: Realiza un análisis a los reportes de la SUI de todos los códigos para que sean más faciles de leer.  Es necesario indicar la tabla de reportes de la SUI.

CTERelacionBanda.m: Código de Matlab utilizado para adquirir las constantes de las relaciones de banda adquiridas en RelacionBanda.m y MasRelacionBanda.m. Se debe ejecutar desde RelacionBanda.m.

CorrePSK.m: Código de Matlab utilizado para ejecutar la correlación de Pearson, Spearman y Kendall. Tiene 2 entradas (Datos a correlacionar) y 6 salidas (Rho-Pearson, Rho-Spearman, Rho-Kendall, Pval-Pearson, Pval-Spearman, Pval-Kendall).

Datos.xlsx: Base de datos utilizada en la elaboración del trabajo. Contiene la base de datos de construcción (Modelo único y modelo doble), validación, turbidez Puerto Mallarino y punto Milán. Adicionalmente tiene una tabla de análisis individual de datos para obtener la ecuación de turbidez.

GraficoBandas:  Código de Google Earth Engine el cual permite descargar los datos de reflectancia de las imágenes satelitales en un periodo de tiempo establecido.

MasRelacionBanda.m: Código de Matlab utilizado para adquirir 2 relaciones de banda adicionales. Se debe ejecutar desde RelacionBanda.m.

RelacionBanda.m:  Código de Matlab utilizado para obtener la relación de banda inicial.

ReportesSUI.xlsx: Contiene la base de datos de los reportes de la SUI desde el año 2009 hasta el 2020. Necesaria para ejecutar AnalisisCodigo4.m y AnalisisReportes.m.

VisualizarImagenes: Código de Google Earth Engine el cual permite descargar las imágenes satelitales en un periodo de tiempo establecido para análisis individual.

PrediccionTurbidez: Script final que predice turbidez según información de bandas satelitales dadas. Las ecuaciones presentes en este script son obtenidas de acuerdo con scripts anteriores como lo son RelacionBanda, MasRelacionBanda, CTERelacionBanda.

#Victor Cordoba e Iván Dallos
