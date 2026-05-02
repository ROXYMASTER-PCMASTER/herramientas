-- esquema_usuarios.sql - tablas de autenticacion y usuarios
-- fuente: implementacion propia para roxymaster v8.3

CREATE TABLE IF NOT EXISTS usuarios (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    email TEXT UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    username TEXT,
    rol TEXT DEFAULT 'usuario',
    wallet_id INTEGER,
    codigo_referido TEXT UNIQUE,
    referido_por TEXT DEFAULT 'pcmaster',
    referido_cambiado INTEGER DEFAULT 0,
    nivel_fiabilidad TEXT DEFAULT 'bronce',
    uptime_horas REAL DEFAULT 0,
    pcbot_id TEXT,
    modo TEXT DEFAULT 'conectado',
    ultimo_login TEXT,
    fecha_registro TEXT DEFAULT (datetime('now','localtime')),
    activo INTEGER DEFAULT 1,
    FOREIGN KEY (wallet_id) REFERENCES wallets(id)
);

CREATE TABLE IF NOT EXISTS sesiones (
    token TEXT PRIMARY KEY,
    usuario_id INTEGER NOT NULL,
    email TEXT NOT NULL,
    rol TEXT NOT NULL,
    fecha_creacion TEXT DEFAULT (datetime('now','localtime')),
    fecha_expiracion TEXT NOT NULL,
    ip_origen TEXT,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE
);
