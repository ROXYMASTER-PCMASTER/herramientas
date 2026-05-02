# generador_hash.py - generacion de hashes sha256 unicos
import hashlib

def generar_hash(*args: str) -> str:
    semilla = "-".join(args).encode()
    return hashlib.sha256(semilla).hexdigest()[:12]
