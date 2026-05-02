# api_crud_base.py - plantilla para endpoints crud con fastapi
# fuente: https://github.com/tiangolo/fastapi (licencia MIT)
from fastapi import APIRouter, Request, HTTPException

router = APIRouter()

@router.get("/api/{recurso}")
async def listar(request: Request):
    # TODO: verificar token y obtener lista desde bd
    pass

@router.post("/api/{recurso}")
async def crear(request: Request):
    pass

@router.put("/api/{recurso}/{id}")
async def actualizar(id: int, request: Request):
    pass

@router.delete("/api/{recurso}/{id}")
async def eliminar(id: int, request: Request):
    pass
