# Web App Installation Guide

## Prerequisites
- Python 3.12
- pip

## Installation Scripts
- **Windows**: Use `scripts/loopy_install_windows.ps1` for automated installation
  ```powershell
  .\scripts\loopy_install_windows.ps1
  ```
- **Linux/macOS**: Use `scripts/loopy_install.sh` for automated installation
  ```bash
  chmod +x scripts/loopy_install.sh
  ./scripts/loopy_install.sh
  ```

## Part 1: FirmataExpress Installation

### Arduino IDE Installation
1. Go to [Arduino download page](https://www.arduino.cc/en/Main/Software)
2. Select distribution for your operating system

## Configuring The Boards Manager

The Arduino IDE boards manager must be configured to use the ESP-32 Arduino Core. The procedure is found [on this page](https://docs.espressif.com/projects/arduino-esp32/en/latest/installing.html).

## Install The Telemetrix4ESP32 Sketch

To install the Telemetrix4Esp32 sketch, from the Arduino IDE main menu, open **_Tools/Manage Libraries..._**

The following screenshot is from version 2 of the Arduino IDE:

![Arduino Library Manager](./images/ard_lib_mgr2.png)

In the search edit box, enter ***Telemetrix***.

Select Telemetrix4Esp32 and press the ***Install*** button.

After the installation is complete, from the Arduino main menu, select File/Examples/Telemetrix4Esp32/Telemetrix4Esp32WIFI. The sketch's source code will appear in the Editor window.

## Configure Your Network Values In the Sketch

The sketch must be modified to contain your WIFI(network) SSID and password.

![Set Network Values](./images/set_network_values2.png)

Replace "YOUR_NETWORK_SSID" and "YOUR_NETWORK_PASSWORD" with the values for your network. Make sure that double quotes are still in place for both values.

Save the sketch.

## Upload The Sketch To the ESP-32

To upload the sketch to the NodeMCU, plug a USB cable into the NodeMCU and your computer, and from the Arduino IDE main menu Tools selection, choose Board/esp32, and from that menu, select the board you are using. In my case, I am using a DoIt NodeMCU 1.0. Next, select the Com port from the Tools/Port menu of the Arduino IDE.

Now, click on the Upload arrow (the horizontal arrow) below the Arduino IDE Main menu. The sketch will take several seconds to compile and load.

## Determine The IP Address Assigned To The ESP-32

To determine the IP address assigned to the NodeMCU, open the Arduino IDE Serial Monitor (the button in the upper right of the Arduino IDE), set the speed to 115200, and press the reset button on the NodeMCU. Within 15 seconds, you should see a message telling you the NodeMCU's IP address. Write this value down since you will need it later when using the Scratch3 Editor.

![IP Address](./images/ip_address2.png)

**NOTE:** When you reset the NodeMCU, the onboard LED will stay lit until a connection is made with your router. You must wait for the LED to extinguish before starting the s32 script.

**Step 3: Start Server**
- **Windows**: Use `scripts/loopy_esp32_install_windows.ps1` for automated server startup
  ```powershell
  .\scripts\looply_install_windows.ps1P
  ```
- **Linux/macOS**: Use `scripts/loopy_esp32_install.sh` for automated server startup
  ```bash
  chmod +x scripts/loopy_install.sh
  ./scripts/looply_install.sh
  ```p
  
**Step 3: Web App**
- In the looply webapp please provide the IP you have got in the arduino IDE in order to connect it to the board

## Important Cautions
- Always properly terminate the server
- Failure to close correctly may cause startup issues on next attempt
- If server fails, reboot computer and reinstall

## Troubleshooting
- Refer to installation scripts in `scripts/` directory
- Ensure all dependencies are correctly installed
### Arduino IDE Installation