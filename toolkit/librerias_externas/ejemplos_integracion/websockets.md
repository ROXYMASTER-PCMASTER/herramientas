# websockets asincronos en python
# fuente: https://github.com/python-websockets/websockets

# servidor minimo:
import asyncio, websockets
async def handler(ws, path):
    async for msg in ws:
        await ws.send(f"eco: {msg}")
asyncio.run(websockets.serve(handler, "0.0.0.0", 5006))

# cliente minimo:
import asyncio, websockets
async def cliente():
    async with websockets.connect("ws://localhost:5006") as ws:
        await ws.send("hola")
        print(await ws.recv())
asyncio.run(cliente())
