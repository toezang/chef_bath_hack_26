import asyncio
import socket
from scripts.read import read

queue = asyncio.Queue()

# UDP setup for Godot
sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)


async def read_serial():
    while True:
        try:
            data = await read()
            if data:
                print(f"Card detected: {data}")
                await queue.put(data)
                sock.sendto(str(data).encode(), ("127.0.0.1", 9999))
            else:
                print("nothing")
        except Exception as e:
            pass
        await asyncio.sleep(0.1)


async def startup():
    await read_serial()


if __name__ == "__main__":
    asyncio.run(startup())
