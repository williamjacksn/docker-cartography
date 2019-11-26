FROM python:3.8.0-alpine3.10

ENV AWS_ACCESS_KEY_ID="" \
    AWS_DEFAULT_REGION="" \
    AWS_SECRET_ACCESS_KEY="" \
    CARTOGRAPHY_VERSION="0.13.1" \
    NEO4J_URI="bolt://neo4j:7687" \
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
