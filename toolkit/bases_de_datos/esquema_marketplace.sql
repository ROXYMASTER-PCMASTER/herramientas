-- esquema_marketplace.sql - tablas de mercado p2p
-- fuente: implementacion propia para roxymaster v8.3

CREATE TABLE IF NOT EXISTS ofertas_marketplace (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    uid_vendedor INTEGER NOT NULL,
    cantidad_kbt REAL NOT NULL,
    precio_pen REAL NOT NULL,
    tipo TEXT DEFAULT 'venta',
    activo INTEGER DEFAULT 1,
    creado TEXT DEFAULT (datetime('now','localtime')),
    FOREIGN KEY (uid_vendedor) REFERENCES usuarios(id)
);

CREATE TABLE IF NOT EXISTS ordenes_marketplace (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    tipo TEXT NOT NULL,
    wallet_vendedor TEXT,
    wallet_comprador TEXT,
    vendedor_uid INTEGER,
    comprador_uid INTEGER,
    cantidad REAL NOT NULL,
    precio_unitario REAL NOT NULL,
    total REAL,
    estado TEXT DEFAULT 'activa',
    fecha_creacion TEXT DEFAULT (datetime('now','localtime')),
    fecha_ejecucion TEXT,
    fecha_cancelacion TEXT,
    FOREIGN KEY (vendedor_uid) REFERENCES usuarios(id),
    FOREIGN KEY (comprador_uid) REFERENCES usuarios(id)
);
