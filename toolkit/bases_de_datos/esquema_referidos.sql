-- esquema_referidos.sql - tablas de sistema de referidos
-- fuente: implementacion propia para roxymaster v8.3

CREATE TABLE IF NOT EXISTS referidos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    referidor_id INTEGER NOT NULL,
    referido_id INTEGER NOT NULL UNIQUE,
    nivel INTEGER NOT NULL,
    comisiones_generadas REAL DEFAULT 0,
    fecha_activacion TEXT,
    FOREIGN KEY (referidor_id) REFERENCES usuarios(id),
    FOREIGN KEY (referido_id) REFERENCES usuarios(id)
);

CREATE TABLE IF NOT EXISTS codigos_referido (
    usuario_id INTEGER PRIMARY KEY,
    codigo TEXT UNIQUE NOT NULL,
    activo INTEGER DEFAULT 1,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);
