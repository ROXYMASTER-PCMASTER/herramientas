-- esquema_seguridad.sql - tablas de eventos de seguridad
-- fuente: implementacion propia para roxymaster v8.3

CREATE TABLE IF NOT EXISTS eventos_seguridad (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    tipo TEXT NOT NULL,
    pcbot_id TEXT,
    detalle TEXT,
    ip_origen TEXT,
    fecha TEXT DEFAULT (datetime('now','localtime'))
);

CREATE TABLE IF NOT EXISTS logs_admin (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    admin_id INTEGER NOT NULL,
    accion TEXT NOT NULL,
    detalle TEXT,
    fecha TEXT DEFAULT (datetime('now','localtime')),
    FOREIGN KEY (admin_id) REFERENCES usuarios(id)
);
