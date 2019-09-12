#!/bin/sh

/usr/local/bin/python /cartography/docker-generate-credentials.py
# /usr/local/bin/cartography --neo4j-uri ${NEO4J_URI} --neo4j-user ${NEO4J_USER} --neo4j-password-env-var NEO4J_PASSWORD
/usr/local/bin/cartography --neo4j-uri "${NEO4J_URI}"
