# docker-cartography

A Docker image for [lyft/cartography](https://github.com/lyft/cartography).

## Usage

First, launch a Neo4j container:

```sh
docker container run \
  -e NEO4J_AUTH=none \
  -v neo4j-data:/data \
  -p 7474:7474 \
  -p 7687:7687 \
  -d \
  neo4j:3.5.12
```

Then, run Cartography:

```sh
docker container run \
  -e AWS_ACCESS_KEY_ID=... \
  -e AWS_SECRET_ACCESS_KEY=... \
  -e AWS_DEFAULT_REGION=us-west-2 \
  -e NEO4J_URI=bolt://localhost:7687 \
  --rm \
  williamjackson/cartography
```

After Cartography finishes syncing, open http://localhost:7474/ in your browser.
