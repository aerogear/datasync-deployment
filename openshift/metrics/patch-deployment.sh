#!/bin/bash
cd "$(dirname "$0")" || exit 1

if [ $# -eq 0 ]; then
  echo "Usage: ./patch-deployment.sh <DeploymentConfig_Name>"
  exit 1
fi

DEPLOYMENT_NAME="$1"
echo "Patch DeploymentConfig $DEPLOYMENT_NAME"
oc patch dc $DEPLOYMENT_NAME -p '{"spec":{"template":{"metadata": {"annotations": {"org.aerogear.metrics/plain_endpoint": "/metrics"}, "labels":{"datasync": "yes"}}}}}'