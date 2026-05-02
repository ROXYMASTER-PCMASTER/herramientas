# db_sqlite_async.py - conexion async a sqlite
# fuente: https://github.com/omnilib/aiosqlite (licencia MIT)
import aiosqlite

class DBAsync:
    def __init__(self, ruta: str):
        self.ruta = ruta

    async def ejecutar(self, sql: str, params: tuple = None):
        async with aiosqlite.connect(self.ruta) as db:
            db.row_factory = aiosqlite.Row
            if params:
                await db.execute(sql, params)
            else:
                await db.execute(sql)
            await db.commit()

    async def consultar(self, sql: str, params: tuple = None):
        async with aiosqlite.connect(self.ruta) as db:
            db.row_factory = aiosqlite.Row
            cursor = await db.execute(sql, params or ())
            return [dict(r) for r in await cursor.fetchall()]
