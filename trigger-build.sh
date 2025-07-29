#!/bin/bash

set -a
source .env
set +a

# ======================REACT========================= #
CRUMB=$(curl -s --user "$USERNAME:$API_TOKEN" \
  "$JENKINS_URL/crumbIssuer/api/json" | jq -r '.crumb')
curl -X POST "$JENKINS_URL/job/$REACT_JOB_NAME/build" \
  --user "$USERNAME:$API_TOKEN" \
  -H "Jenkins-Crumb: $CRUMB"
# ======================REACT========================= #