# test_unitario_base.py - plantilla de pruebas con pytest + httpx
# fuente: https://github.com/pytest-dev/pytest (licencia MIT)
import pytest
from httpx import AsyncClient

@pytest.mark.asyncio
async def test_health():
    from main import app
    async with AsyncClient(app=app) as ac:
        r = await ac.get("/api/health")
        assert r.status_code == 200
        assert "estado" in r.json()
