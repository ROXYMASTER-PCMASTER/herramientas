# integracion fastapi-users en server.py
# fuente: https://github.com/fastapi-users/fastapi-users
# 1. instalar: pip install fastapi-users[sqlalchemy] python-jose passlib[bcrypt]
# 2. en server.py agregar:
from fastapi_users import FastAPIUsers
from fastapi_users.authentication import JWTStrategy, AuthenticationBackend, BearerTransport

SECRET = "cambiar-por-secreto-largo"
bearer_transport = BearerTransport(tokenUrl="/api/auth/jwt/login")

def get_jwt_strategy() -> JWTStrategy:
    return JWTStrategy(secret=SECRET, lifetime_seconds=3600*24*7)

auth_backend = AuthenticationBackend(name="jwt", transport=bearer_transport, get_strategy=get_jwt_strategy)
fastapi_users = FastAPIUsers(get_user_manager, [auth_backend])

app.include_router(fastapi_users.get_auth_router(auth_backend), prefix="/api/auth/jwt")
app.include_router(fastapi_users.get_register_router(), prefix="/api/auth")
# 3. proteger endpoints: current_user = fastapi_users.current_user(active=True)
