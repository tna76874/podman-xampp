FROM ghcr.io/tna76874/podman-xampp:latest-BASE

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN ln -s /opt/lampp/bin/mysql /usr/local/bin/mysql

ENV JUPYTER_TOKEN=''

RUN mkdir -p /home/jovyan/import && \
    ln -s /opt/lampp/htdocs/www /home/jovyan

COPY ./scripts/db_import_inotify.sh /usr/local/bin/db_import_inotify.sh
RUN chmod +x /usr/local/bin/db_import_inotify.sh

COPY ./notebooks/settings.ipynb /home/jovyan/
