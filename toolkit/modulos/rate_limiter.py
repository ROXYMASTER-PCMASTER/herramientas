# rate_limiter.py - limitador de tasa simple para fastapi
from datetime import datetime, timedelta

class RateLimiter:
    def __init__(self, max_peticiones: int = 30, ventana_seg: int = 60):
        self.max = max_peticiones
        self.ventana = timedelta(seconds=ventana_seg)
        self.historial = {}

    def permitir(self, clave: str) -> bool:
        ahora = datetime.now()
        if clave not in self.historial or (ahora - self.historial[clave][-1]) > self.ventana:
            self.historial[clave] = [ahora]
            return True
        self.historial[clave] = [t for t in self.historial[clave] if ahora - t < self.ventana]
        if len(self.historial[clave]) < self.max:
            self.historial[clave].append(ahora)
            return True
        return False
