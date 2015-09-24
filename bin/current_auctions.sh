#!/bin/sh

# This example is a template to connect to Oracle
# The JDBC URL and SQL must be replaced by working ones.

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
bin=${DIR}/../bin
lib=${DIR}/../lib
#"schedule" : "0-59 0-59 0-23 ? * *",
java \
    -cp "${lib}/*" \
    -Dlog4j.configurationFile=${bin}/log4j2.xml \
    org.xbib.tools.Runner \
    org.xbib.tools.JDBCImporter \
    current-auctions-state-prod.json