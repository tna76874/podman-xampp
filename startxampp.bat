@echo off
REM Initialisiere Podman-Maschine
podman machine init

REM Starte Podman-Maschine
podman machine start

REM Generiere zufälliges Token
set TOKEN=%RANDOM%%RANDOM%%RANDOM%%RANDOM%%RANDOM%

REM Pull Podman-Image
podman pull ghcr.io/tna76874/podman-xampp:latest

REM Öffe Browser
start http://localhost:8080/phpmyadmin/
start http://localhost:8888/?token=%TOKEN%

REM Führe den XAMPP Container aus
podman run -it -p 127.0.0.1:8080:80 -p 127.0.0.1:8888:8888 -e JUPYTER_TOKEN='' ghcr.io/tna76874/podman-xampp:latest

pause