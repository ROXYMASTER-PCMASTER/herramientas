# validador_email.py - validacion de formato de email
import re

PATRON_EMAIL = r"^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"

def es_email_valido(email: str) -> bool:
    return bool(re.match(PATRON_EMAIL, email.lower().strip()))
