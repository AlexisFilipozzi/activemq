#!/bin/sh

python /app/entrypoint/Init.py
chmod 600 ${ACTIVEMQ_CONFIG_DIR}/jmx.password
exec /opt/activemq/bin/activemq console
