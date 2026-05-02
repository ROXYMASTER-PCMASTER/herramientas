# sistema de usuarios
fuente: implementacion propia en roxymaster
archivos reales del proyecto:
- pcmaster/scripts/auth.py (registro, login, hash de contraseñas)
- pcmaster/scripts/api_auth.py (endpoints /api/login, /api/register, /api/verify)
- pcmaster/scripts/db.py (tablas usuarios, sesiones)
uso: importar estos modulos en server.py
