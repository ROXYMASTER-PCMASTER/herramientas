# logger_async.py - logging asincrono estructurado en json
import json, logging, asyncio

class AsyncJsonLogger:
    def __init__(self, archivo: str):
        self.logger = logging.getLogger(archivo)
        self.logger.setLevel(logging.INFO)
        handler = logging.FileHandler(archivo, encoding="utf-8")
        self.logger.addHandler(handler)

    async def info(self, msg: str, extra: dict = None):
        self.logger.info(json.dumps({"msg": msg, "extra": extra or {}}))

    async def error(self, msg: str, extra: dict = None):
        self.logger.error(json.dumps({"msg": msg, "extra": extra or {}}))
