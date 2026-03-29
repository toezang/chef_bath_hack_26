import serial
import asyncio

port = "/dev/tty.usbmodem11101"
try:
    arduino = serial.Serial(
        port=port, baudrate=115200, timeout=1, dsrdtr=False, rtscts=False
    )
    print("Arduino connected!")
except Exception as e:
    print(
        f"No Arduino found at {port}. Are you sure it is plugged in, or the USB modem is set correctly?"
    )
    print(f"Error: {e}")


async def read():
    """
    Read continuous serial data
    """
    loop = asyncio.get_event_loop()
    data = await loop.run_in_executor(None, arduino.read_until, b"OK\r\n")
    print(f"Raw bytes: {repr(data)}")

    if len(data) == 0:
        print("Nothing yet")
        return None
    else:
        # Parse input
        data = data.decode("utf-8", errors="ignore")
        data = data.split("\r\n")
        data = list(filter(None, data))
        print("data:", data)
        print()
        # Return the ID
        try:
            with open("/tmp/serial_out.txt", "w") as f:
                f.write(str(data) + "\n")
            return data[-2]
        except Exception as e:
            # If cannot read the UID, this will fail. Will need to try again
            print(f"Error: ${e}")
            return None
