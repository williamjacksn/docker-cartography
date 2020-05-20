FROM python:3.8.2-alpine3.11

ARG CARTOGRAPHY_VERSION="0.21.0"

ENV NEO4J_URI="bolt://neo4j:7687" \
    PYTHONUNBUFFERED="1"

RUN /usr/local/bin/pip install --no-cache-dir "cartography==${CARTOGRAPHY_VERSION}"

COPY docker-generate-credentials.py /cartography/docker-generate-credentials.py
COPY docker-entrypoint.sh /cartography/docker-entrypoint.sh
RUN chmod +x /cartography/docker-entrypoint.sh

ENTRYPOINT ["/cartography/docker-entrypoint.sh"]

LABEL org.opencontainers.image.authors="William Jackson <william@subtlecoolness.com>" \
      org.opencontainers.image.source="https://github.com/williamjacksn/docker-cartography" \
      org.opencontainers.image.title="Cartography" \
      org.opencontainers.image.version="${CARTOGRAPHY_VERSION}"
