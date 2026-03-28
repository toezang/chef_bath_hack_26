SERIAL_DEV := /dev/cu.usbmodem1101
SKETCH_NAME := sketch
SERIAL_BAUD := 115200

.PHONY: monitor
# To escape: Ctrl+A, Ctrl+\, y
monitor:
	screen $(SERIAL_DEV) $(SERIAL_BAUD)

.PHONY: flash
flash: build
	   arduino-cli upload -p $(SERIAL_DEV) --fqbn arduino:avr:uno sketch

.PHONY: build
build: $(BUILD_DIR)/$(SKETCH_NAME).ino.elf

$(BUILD_DIR)/$(SKETCH_NAME).ino.elf: $(wildcard $(SKETCH_NAME)/*.ino)
	   arduino-cli compile --fqbn arduino:avr:uno --output-dir build $(SKETCH_NAME)

.PHONY: list
list: $(wildcard $(SKETCH_NAME)/*.ino)
	echo $^

.PHONY: clean
clean:
	   rm -rf build

