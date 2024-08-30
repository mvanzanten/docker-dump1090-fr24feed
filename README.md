# Dump1090, FR24Feed, and Flightaware on Docker (RTL-SDR V4) 

This is a version of Dump1090 with the RTL-SDR V4 driver running FlightAware and FR24Feed

Docker images in use [uacmarine556/dump1090](https://hub.docker.com/r/uacmarine556/dump1090) and [uacmarine556/fr24feed](https://hub.docker.com/r/uacmarine556/fr24feed).

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
```
cd dump1090
docker build . -t uacmarine556/dump1090
cd ..
cd fr24feed
docker build . -t uacmarine556/fr24feed
```

### Accessing Skyview
Visit http://localhost:8024

### Accessing FR24Feed
Visit http://localhost:8754
