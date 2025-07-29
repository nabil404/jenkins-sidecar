#!/bin/bash

JENKINS_URL="http://localhost:8888"
USERNAME="admin"
API_TOKEN="11e342d9c1abfc4af2289571c4da7d4e93"
JOB_NAME="sidecar-react"

# Get crumb
CRUMB=$(curl -s --user "$USERNAME:$API_TOKEN" \
  "$JENKINS_URL/crumbIssuer/api/json" | jq -r '.crumb')

# Trigger job with crumb
curl -X POST "$JENKINS_URL/job/$JOB_NAME/build" \
  --user "$USERNAME:$API_TOKEN" \
  -H "Jenkins-Crumb: $CRUMB"
