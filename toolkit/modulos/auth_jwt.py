# auth_jwt.py - autenticacion jwt con python-jose
# fuente: https://github.com/mpdavis/python-jose (licencia MIT)
from datetime import datetime, timedelta
from jose import jwt

SECRETO = "cambiar-por-secreto-real"
ALGORITMO = "HS256"

def crear_token(uid: int, rol: str) -> str:
    payload = {
        "uid": uid,
        "rol": rol,
        "exp": datetime.utcnow() + timedelta(days=7)
    }
    return jwt.encode(payload, SECRETO, algorithm=ALGORITMO)

def verificar_token(token: str) -> dict:
    return jwt.decode(token, SECRETO, algorithms=[ALGORITMO])
