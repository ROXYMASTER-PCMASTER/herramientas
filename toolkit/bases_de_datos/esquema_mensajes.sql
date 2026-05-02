-- esquema_mensajes.sql - tablas de mensajes admin-usuarios
-- fuente: implementacion propia para roxymaster v8.3

CREATE TABLE IF NOT EXISTS mensajes_admin (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    texto TEXT NOT NULL,
    alcance TEXT DEFAULT 'todos',
    admin_id INTEGER NOT NULL,
    fecha TEXT DEFAULT (datetime('now','localtime')),
    FOREIGN KEY (admin_id) REFERENCES usuarios(id)
);

CREATE TABLE IF NOT EXISTS mensajes_usuarios (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    mensaje_id INTEGER NOT NULL,
    usuario_id INTEGER NOT NULL,
    leido INTEGER DEFAULT 0,
    fecha_lectura TEXT,
    FOREIGN KEY (mensaje_id) REFERENCES mensajes_admin(id) ON DELETE CASCADE,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE
);
