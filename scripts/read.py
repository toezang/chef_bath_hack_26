import serial
import asyncio
import re

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


def parse_ingredient(hex_line):
    # extract the readable word from the end of the hex dump line
    match = re.search(r"[a-zA-Z][a-zA-Z_]+", hex_line.split("  ")[-1].replace(".", ""))
    if match:
        return match.group().strip()
    return None


async def read():
    """
    Read continuous serial data
    """
    loop = asyncio.get_event_loop()
    data = await loop.run_in_executor(None, arduino.read_until, b"OK\r\n")
    print(f"Raw bytes: {repr(data)}")

    if len(data) == 0:
        with open("/tmp/serial_out.txt", "w") as f:
            f.write("Nothing\n")
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
            raw_line = data[
                0
            ]  # the hex dump line e.g. "66 6C 6F 75 72 00 ...  flour..."
            ingredient = parse_ingredient(raw_line)
            print("Parsed ingredient:", ingredient)

            with open("/tmp/serial_out.txt", "w") as f:
                f.write(str(data) + "\n")

            return ingredient  # returns "flour" instead of the raw line
        except Exception as e:
            print(f"Error: ${e}")
            return None
