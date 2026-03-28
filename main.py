import asyncio
from scripts.read import read

queue = asyncio.Queue()


async def read_serial():
    while True:
        try:
            data = await read()
            if data:
                print(f"Card detected: {data}")
                await queue.put(data)
        except Exception as e:
            # print(f"Error reading serial: {e}")
            pass
        await asyncio.sleep(0.1)


async def startup():
    await read_serial()


if __name__ == "__main__":
    asyncio.run(startup())
