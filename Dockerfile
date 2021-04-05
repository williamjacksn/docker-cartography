FROM python:3.9.3-alpine3.13

ENV NEO4J_URI="bolt://neo4j:7687" \
    PYTHONUNBUFFERED="1"

COPY requirements.txt /cartography/requirements.txt
RUN /usr/local/bin/pip install --no-cache-dir --requirement /cartography/requirements.txt

COPY docker-generate-credentials.py /cartography/docker-generate-credentials.py
COPY docker-entrypoint.sh /cartography/docker-entrypoint.sh
RUN chmod +x /cartography/docker-entrypoint.sh

ENTRYPOINT ["/cartography/docker-entrypoint.sh"]

LABEL org.opencontainers.image.authors="William Jackson <william@subtlecoolness.com>" \
      org.opencontainers.image.source="https://github.com/williamjacksn/docker-cartography" \
      org.opencontainers.image.title="Cartography"
