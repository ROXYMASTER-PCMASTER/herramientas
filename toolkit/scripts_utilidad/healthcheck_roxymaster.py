# healthcheck_roxymaster.py - endpoint de salud para fastapi
from fastapi import APIRouter
router = APIRouter()
@router.get("/api/health")
async def health(): return {"estado":"saludable","version":"8.3","puertos":{"http":8086,"ws":5006}}
