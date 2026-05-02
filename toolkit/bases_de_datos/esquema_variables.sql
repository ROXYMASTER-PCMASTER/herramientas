-- esquema_variables.sql - tabla de variables globales configurables
-- fuente: implementacion propia para roxymaster v8.3

CREATE TABLE IF NOT EXISTS variables_globales (
    clave TEXT PRIMARY KEY,
    valor TEXT NOT NULL
);

INSERT OR IGNORE INTO variables_globales (clave, valor) VALUES
    ('k', '20.00'),
    ('fx', '3.70'),
    ('p_token', '1.00'),
    ('g', '9.00'),
    ('beta', '0.0'),
    ('hh_mult', '2.0'),
    ('comision_marketplace', '0.15'),
    ('comision_retiro_0_30', '0.33'),
    ('comision_retiro_31_60', '0.25'),
    ('comision_retiro_61_90', '0.15'),
    ('comision_retiro_90_plus', '0.00'),
    ('comision_referido', '0.10'),
    ('limite_retiro_mensual_usd', '999.00');
