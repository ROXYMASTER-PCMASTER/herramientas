# hmac_signer.py - firmador y verificador hmac-sha256
# fuente: https://docs.python.org/3/library/hmac.html (stdlib)
import hmac, hashlib, json, time

class HmacSigner:
    def __init__(self, secreto: str):
        self.secreto = secreto.encode()

    def firmar(self, payload: dict) -> dict:
        ts = int(time.time())
        data = f"{ts}:{json.dumps(payload, sort_keys=True)}".encode()
        firma = hmac.new(self.secreto, data, hashlib.sha256).hexdigest()
        return {"payload": payload, "firma": firma, "timestamp": ts}

    def verificar(self, mensaje: dict) -> bool:
        ts = mensaje.get("timestamp", 0)
        firma = mensaje.pop("firma", "")
        data = f"{ts}:{json.dumps(mensaje['payload'], sort_keys=True)}".encode()
        esperada = hmac.new(self.secreto, data, hashlib.sha256).hexdigest()
        return hmac.compare_digest(firma, esperada)
