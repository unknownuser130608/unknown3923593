@echo off
mode con: cols=90 lines=45
:a
title -=[HWID Checker]=-
color 0c
cls
echo SMBIOS
echo [92m------------[91m
wmic bios get serialnumber
wmic csproduct get uuid
echo CPU
echo [92m------------[91m
wmic cpu get serialnumber
wmic cpu get processorid
echo Baseboard
echo [92m------------[91m
wmic baseboard get serialnumber
echo MacAddress
echo [92m------------[91m
wmic path Win32_NetworkAdapter where "PNPDeviceID like '%%PCI%%' AND NetConnectionStatus=2 AND AdapterTypeID='0'" get MacAddress
echo GPU
echo [92m------------[91m
wmic PATH Win32_VideoController GET Description,PNPDeviceID
echo Press any key to check serials again.
pause >nul
goto a