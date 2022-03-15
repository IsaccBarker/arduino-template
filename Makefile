FQBN=
CORE=
SERIAL=

all:
ifeq ($(FQBN),)
	@echo "Please visit https://arduino.github.io/arduino-cli/0.21/getting-started/ to continue setup. Then set the FQBN env variable."
	@echo "This might take the form of: \`arduino:samd:mkr1000\`"
	@exit 1
else ifeq ($(SERIAL,))
	@echo "Please visit https://arduino.github.io/arduino-cli/0.21/getting-started/ to continue setup. Then set the SERIAL env variable".
	@echo "This might take the form of: \`/dev/ttyWTF\`"
	@exit 1
endif
	arduino-cli compile --fqbn $(FQBN) Exercize
	arduino-cli upload -p $(SERIAL) --fqbn $(FQBN) MyFirstSketch

setup:
	arduino-cli core update-index
	arduino-cli board list
ifeq ($(CORE),)
	@echo "Please visit https://arduino.github.io/arduino-cli/0.21/getting-started/ to continue setup. Then set the CORE env variable."
	@echo "This might take the form of: \`arduino:samd\`"
	@exit 1
endif
	arduino-cli core install $(CORE)

