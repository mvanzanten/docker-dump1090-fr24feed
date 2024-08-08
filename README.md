# Dump1090 Flightaware Docker (RTL-SDR V4) 
![build](https://github.com/mvanzanten/docker-dump1090/actions/workflows/build.yml/badge.svg)

Docker image can be found here [uacmarine556/kali-linux-novnc](https://hub.docker.com/r/uacmarine556/kali-linux-novnc).
This is a version of Dump1090 with the RTL-SDR V4 driver running FlightAware

Docker image can be found here [uacmarine556/dump1090](https://hub.docker.com/r/uacmarine556/dump1090).

## Prerequisites
### Raspberry Pi
Before you fire up the container make sure your pi has the `dvb_usb_rtl28xxu` driver blacklisted, and rebooted

`echo 'blacklist dvb_usb_rtl28xxu' | sudo tee --append /etc/modprobe.d/blacklist-dvb_usb_rtl28xxu.conf`

### Windows
#### Pass USB device on Windows to WSL
[Official Documentation](https://learn.microsoft.com/en-us/windows/wsl/connect-usb)

Run the following commands in powershell
1. Install `winget install --interactive --exact dorssel.usbipd-win`
2. Run `usbipd list` before plugging in USB
3. Plug in USB then run `usbipd list` again to determine the `busid ` of the device
4. Run `usbipd bind --busid <busid>`
5. Check `/dev/bus/usb` for existing devices
6. Run `usbipd attach --wsl --busid <busid>`
7. Verify in WSL with `lsusb` command that the device is there
8. Check `/dev/bus/usb` for the new device


## Usage
### Run
`docker-compose up`

### Build Locally
`docker build .`

### Accessing Skyview
Visit http://localhost:8024