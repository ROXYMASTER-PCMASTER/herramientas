# worker_async_base.py - agente asincrono con websocket
# fuente: https://github.com/python-websockets/websockets (licencia BSD)
import asyncio, websockets, json, logging

class AgenteAsync:
    def __init__(self, uri: str, nombre: str):
        self.uri = uri
        self.nombre = nombre
        self.conectado = False

    async def iniciar(self):
        while True:
            try:
                async with websockets.connect(self.uri) as ws:
                    self.conectado = True
                    await ws.send(json.dumps({"tipo": "handshake", "nombre": self.nombre}))
                    async for msg in ws:
                        await self.procesar(json.loads(msg))
            except Exception as e:
                logging.error(f"error: {e}")
                self.conectado = False
                await asyncio.sleep(5)

    async def procesar(self, mensaje: dict):
        pass
