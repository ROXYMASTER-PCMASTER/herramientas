# cifrador_aes.py - cifrado/descifrado aes-256-gcm
# fuente: https://github.com/Legrandin/pycryptodome (licencia MIT)
import os
from Crypto.Cipher import AES

class CifradorAES:
    def __init__(self, clave: str):
        self.clave = clave.encode().ljust(32)[:32]

    def cifrar(self, texto: str) -> str:
        nonce = os.urandom(12)
        cipher = AES.new(self.clave, AES.MODE_GCM, nonce=nonce)
        cifrado, tag = cipher.encrypt_and_digest(texto.encode())
        return (nonce + tag + cifrado).hex()

    def descifrar(self, datos_hex: str) -> str:
        raw = bytes.fromhex(datos_hex)
        nonce, tag, cifrado = raw[:12], raw[12:28], raw[28:]
        cipher = AES.new(self.clave, AES.MODE_GCM, nonce=nonce)
        return cipher.decrypt_and_verify(cifrado, tag).decode()
