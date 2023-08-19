::::: This Batch file extracts the wifi passwords in clear text even the ssid has spaces in it (maximum 7 words and 6 spaces) :::::: 

@echo off
setlocal enabledelayedexpansion


for /f "skip=9 tokens=1,2,3,4,5,6,7,8,9,10 delims=: " %%a in ('netsh wlan show profiles') do ( 
  set d=%%d
  set e=%%e
  set f=%%f
  set g=%%g
  set h=%%h
  set i=%%i
  set j=%%j

  if defined d (
   set ssid=!d!
  )
  if defined e (
   set ssid=!ssid! !e!
  )
  if defined f (
   set ssid=!ssid! !f!
  )
  if defined g (
   set ssid=!ssid! !g!
  )
  if defined h (
   set ssid=!ssid! !h!
  )
  if defined i (
   set ssid=!ssid! !i!
  )
  if defined j (
   set ssid=!ssid! !j!
  )

REM @echo !ssid!
@netsh wlan show profile name="!ssid!" key=clear | findstr /c:"SSID name" /c:"Key Content" && echo.
)
endlocal