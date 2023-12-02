FROM ghcr.io/tna76874/podman-xampp:0f0cbcdbae200162797144a0688cb3b31eba655e-BASE

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN apt-get update && apt-get install -y inotify-tools

RUN ln -s /opt/lampp/bin/mysql /usr/local/bin/mysql

ENV JUPYTER_TOKEN=''

RUN mkdir -p /home/jovyan/import

COPY ./scripts/db_import_inotify.sh /usr/local/bin/db_import_inotify.sh
RUN chmod +x /usr/local/bin/db_import_inotify.sh