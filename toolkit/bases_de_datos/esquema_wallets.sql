-- esquema_wallets.sql - tablas de economia de tokens
-- fuente: implementacion propia para roxymaster v8.3

CREATE TABLE IF NOT EXISTS wallets (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    usuario_id INTEGER UNIQUE NOT NULL,
    balance REAL DEFAULT 0,
    minado_total REAL DEFAULT 0,
    recolectado_total REAL DEFAULT 0,
    comprado_total REAL DEFAULT 0,
    retirado_total REAL DEFAULT 0,
    staking_total REAL DEFAULT 0,
    staking_desde TEXT,
    actualizado TEXT DEFAULT (datetime('now','localtime')),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS transacciones (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    origen_id INTEGER,
    destino_id INTEGER,
    tipo TEXT NOT NULL,
    monto REAL NOT NULL,
    concepto TEXT,
    fecha TEXT DEFAULT (datetime('now','localtime'))
);

CREATE TABLE IF NOT EXISTS reserva (
    id INTEGER PRIMARY KEY CHECK(id=1),
    tokens REAL DEFAULT 0,
    soles REAL DEFAULT 0
);

INSERT OR IGNORE INTO reserva (id, tokens, soles) VALUES (1, 0, 0);
