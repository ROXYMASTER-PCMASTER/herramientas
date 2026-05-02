-- esquema_perfiles.sql - tablas de perfiles y pcbots
-- fuente: implementacion propia para roxymaster v8.3

CREATE TABLE IF NOT EXISTS perfiles (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    usuario_id INTEGER NOT NULL,
    nombre_perfil TEXT,
    tipo TEXT DEFAULT 'local',
    estado TEXT DEFAULT 'inactivo',
    ip_wan TEXT,
    hash_id TEXT UNIQUE,
    horas_conexion REAL DEFAULT 0,
    horas_en_uso REAL DEFAULT 0,
    horas_hh REAL DEFAULT 0,
    ultimo_heartbeat TEXT,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS pcbots_registrados (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    usuario_id INTEGER NOT NULL,
    pcbot_id TEXT UNIQUE NOT NULL,
    hostname TEXT,
    ip_local TEXT,
    ip_tailscale TEXT,
    modo TEXT DEFAULT 'conectado',
    uptime_horas REAL DEFAULT 0,
    perfiles_activos INTEGER DEFAULT 0,
    ultimo_heartbeat TEXT,
    fecha_registro TEXT DEFAULT (datetime('now','localtime')),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE
);
