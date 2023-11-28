FROM docker.io/tomsik68/xampp:8

# Installiere Python, pip und Build-Tools
RUN apt-get update && apt-get upgrade -y &&\
    apt-get install -y python3 python3-pip python3-venv

# Erstelle und aktiviere eine virtuelle Umgebung
RUN python3 -m venv /venv
ENV PATH="/venv/bin:$PATH"

# Installiere Jupyter in der virtuellen Umgebung
RUN pip install --no-cache-dir jupyter
# Setze das Arbeitsverzeichnis
WORKDIR /app

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 8888
EXPOSE 3306
EXPOSE 22
EXPOSE 80
