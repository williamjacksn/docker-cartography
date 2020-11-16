# docker-cartography

A Docker image for [lyft/cartography][a].

[a]: https://github.com/lyft/cartography

```sh
docker image pull ghcr.io/williamjacksn/cartography
```

This image is also available [on Docker Hub][b] as `williamjackson/cartography`.

[b]: https://hub.docker.com/r/williamjackson/cartography

## Usage

In your current working directory, create a file named `docker-compose.yaml` with the following contents. Include your
actual AWS Access Key ID and Secret Access Key.

```yaml
version: '3.8'

services:
  cartography:
    image: ghcr.io/williamjacksn/cartography
    environment:
      AWS_ACCESS_KEY_ID: replace this text with your access key id
      AWS_DEFAULT_REGION: us-west-2
      AWS_SECRET_ACCESS_KEY: replace this text with you secret access key
      NEO4J_URI: bolt://neo4j:7687

  neo4j:
    image: neo4j:3.5.14
    environment:
      NEO4J_AUTH: none
    volumes:
      - neo4j-data:/data
    ports:
      - 7474:7474
      - 7687:7687

volumes:
  neo4j-data:
```

Launch a Neo4j container:

```sh
docker-compose up -d neo4j
```

Run Cartography:

```sh
docker-compose up cartography
```

After Cartography finishes syncing, open http://localhost:7474/ in your browser.
