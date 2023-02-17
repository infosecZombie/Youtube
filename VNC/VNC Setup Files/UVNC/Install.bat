@echo off

md %windir%\vnc
copy /y *.* %windir%\vnc

%windir%\vnc\winvnc -install

netsh advfirewall firewall add rule name=vnc action=allow dir=in protocol=tcp localport=5901