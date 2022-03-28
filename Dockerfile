FROM python:3.10.4-alpine3.15

RUN /usr/sbin/adduser -g python -D python

USER python
RUN /usr/local/bin/python -m venv /home/python/venv

ENV PATH="/home/python/venv/bin:${PATH}" \
    PYTHONUNBUFFERED="1"

COPY --chown=python:python requirements.txt /home/python/cartography/requirements.txt
RUN /home/python/venv/bin/pip install --no-cache-dir --requirement /home/python/cartography/requirements.txt

ENTRYPOINT ["/home/python/venv/bin/cartography"]

LABEL org.opencontainers.image.authors="William Jackson <william@subtlecoolness.com>" \
      org.opencontainers.image.source="https://github.com/williamjacksn/docker-cartography" \
      org.opencontainers.image.title="Cartography"
