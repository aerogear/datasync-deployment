#!/bin/bash
cd "$(dirname "$0")" || exit 1

NAMESPACE=`oc project -q`

echo "Generating Prometheus configuration file"
sed "s/NAMESPACE_PLACEHOLDER/${NAMESPACE}/g" ./prometheus/prometheus-config.yaml.txt > ./prometheus/prometheus-config.yaml

# Create the prom secret
echo "Provisioning Prometheus"
oc create secret generic prom --from-file=./prometheus/prometheus-config.yaml
# Create the prom-alerts secret
oc create secret generic prom-alerts --from-file=./prometheus/alertmanager-config.yaml
# Create the prometheus instance
oc process -f ./prometheus/prometheus.yaml | oc apply -f - 
echo "Prometheus provisioned"

echo "Provisioning Grafana"
oc create configmap grafana-config --from-file=grafana.ini=./grafana/grafana-config-map.ini
oc create configmap grafana-datasources --from-file=datasources.yml=./grafana/grafana-datasources.yml
oc create configmap grafana-providers --from-file=provider.yml=./grafana/grafana-dashboard-provider.yml
oc create configmap grafana-dashboards --from-file=datasync-dashboard.json=./grafana/sync-dashboard.json
oc process -f ./grafana/grafana.yaml | oc apply -f -
echo "Grafana Provisioned"


