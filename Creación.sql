CREATE SCHEMA IF NOT EXISTS staging;
CREATE SCHEMA IF NOT EXISTS dw;
CREATE SCHEMA IF NOT EXISTS mart;


SELECT schema_name
FROM information_schema.schemata
WHERE schema_name IN ('staging', 'dw', 'mart')
ORDER BY schema_name;


CREATE TABLE IF NOT EXISTS dw.control_etl (
    id_control SERIAL PRIMARY KEY,
    nombre_proceso VARCHAR(100),
    fecha_ejecucion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado VARCHAR(50),
    observacion TEXT
);

SELECT * FROM dw.control_etl;

INSERT INTO dw.control_etl (
    nombre_proceso,
    estado,
    observacion
)
VALUES (
    'Preparación de base de datos',
    'Correcto',
    'Se crearon los esquemas staging, dw y mart para el proyecto SINADEF.'
);