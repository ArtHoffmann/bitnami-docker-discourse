#!/bin/bash

# shellcheck disable=SC1091

set -o errexit
set -o nounset
set -o pipefail
# set -o xtrace # Uncomment this line for debugging purpose

# Load Discourse environment
. /opt/bitnami/scripts/discourse-env.sh

# Load PostgreSQL Client environment for 'postgresql_remote_execute' (after 'discourse-env.sh' so that MODULE is not set to a wrong value)
if [[ -f /opt/bitnami/scripts/postgresql-client-env.sh ]]; then
    . /opt/bitnami/scripts/postgresql-client-env.sh
elif [[ -f /opt/bitnami/scripts/postgresql-env.sh ]]; then
    . /opt/bitnami/scripts/postgresql-env.sh
fi

# Load libraries
. /opt/bitnami/scripts/libdiscourse.sh

# Ensure Discourse environment variables are valid
discourse_validate

# Ensure Discourse is initialized
discourse_initialize
