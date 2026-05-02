# ejemplo de websocket para roxymaster
fuente: https://pypi.org/project/websockets/
instalacion: pip install websockets

## servidor minimo (para pcmaster)
import asyncio, websockets

async def handler(websocket, path):
    async for message in websocket:
        await websocket.send(f"eco: {message}")

asyncio.run(websockets.serve(handler, "0.0.0.0", 5006))

## cliente minimo (para pcbot)
import asyncio, websockets

async def cliente():
    async with websockets.connect("ws://100.111.179.65:5006") as websocket:
        await websocket.send("hola")
        respuesta = await websocket.recv()
        print(respuesta)

asyncio.run(cliente())
