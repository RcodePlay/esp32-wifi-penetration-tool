# ESP32 Wi-Fi Penetration Tool

To read the original README file, that explains how it all works, visit the [original project on GitHub](https://github.com/risinek/esp32-wifi-penetration-tool)

<p align="center">
    <img src="doc/images/logo.png" alt="Logo">
</p>

## My upgrades to the code

- **Updated the UI**
- **Optimized code for building**
- **Fixed errors from original code**

## Usage

1. [Build](#Build) and [flash](#Flash) project onto ESP32 (DevKit or module)
1. Power ESP32
1. Management AP is started automatically after boot
1. Connect to this AP\
   By default:
   _SSID:_ `ManagementAP` and _password:_ `mgmtadmin`
1. In browser open `192.168.4.1` and you should see a web client to configure and control the ESP32

## Build

This project is currently developed using ESP-IDF 4.1. It may be broken on newer version.

(Recommended) Project can be built in the usual ESP-IDF way:

```shell
idf.py build
```

## Flash

If you have setup ESP-IDF, the easiest way is to use:

```shell
idf.py flash
```

In case you don't want to setup whole ESP-IDF, you can use pre-build binaries included in [`build/`](build/) and flash them using [`esptool.py`](https://github.com/espressif/esptool) (Requires Python. This is not the recommended way, because the build files aren't usually updated).

Example command (follow instructions in [esptool repo](https://github.com/espressif/esptool)):

```
esptool.py -p /dev/ttyS5 -b 115200 --after hard_reset write_flash --flash_mode dio --flash_freq 40m --flash_size detect 0x8000 build/partition_table/partition-table.bin 0x1000 build/bootloader/bootloader.bin 0x10000 build/esp32-wifi-penetration-tool.bin
```

On Windows you can use official [Flash Download Tool](https://www.espressif.com/en/support/download/other-tools).

## Documentation

If you want to read the official documentation, you can read it in the original project.

## Contributing

Feel free to contribute. Don't hestitate to refactor current code base. Please stick to Doxygen notation when commenting new functions and files. This project is mainly build for educational and demonstration purposes, so verbose documentation is welcome.

## Disclaimer

This software is intended for educational and authorized security research purposes only. Misuse of this software to interfere with or disrupt networks without permission is illegal. The authors disclaim any responsibility for damages or illegal activities conducted using this code.

## License

Even though this project is licensed under MIT license (see [LICENSE](LICENSE) file for details), don't be shy or greedy and share your work.
