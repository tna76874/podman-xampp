@echo off
REM Initialisiere Podman-Maschine
podman machine init

REM Starte Podman-Maschine
podman machine start

REM Pull Podman-Image
podman pull ghcr.io/tna76874/podman-xampp:latest

REM Öffe Browser
start http://localhost:8080
start http://localhost:8800

REM Führe den XAMPP Container aus
podman run -it -p 127.0.0.1:8080:80 -p 127.0.0.1:8800:8888 -p 41061:22 ghcr.io/tna76874/podman-xampp:latest

pause