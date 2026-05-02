import hashlib
def generar_hash(*a): return hashlib.sha256("-".join(a).encode()).hexdigest()[:12]
