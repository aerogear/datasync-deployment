# Usage

1. Make sure you have `oc` installed and targeted the namespace where the sync app is deployed.
2. Run the script to provision Prometheus and Grafana:
    ```
    ./install-metrics.sh
    ```
3. Add the following annotation to the `Deployment` or `DeploymentConfig` of your sync apps (change the value for the endpoint to match the actual metrics endpoint if it's not `/metrics`):

    ```
    # If it's HTTP, use this annotation
    org.aerogear.metrics/plain_endpoint: /metrics
    # Or if it's HTTPS, use this one
    org.aerogear.metrics/ssl_endpoint: /metrics
    ```

4. Add the following label to the `Deployment` or `DeploymentConfig` of your sync apps:

   ```
   datasync: 'yes'
   ```

5. Wait for both Prometheus and Grafana up and running. Login to Grafana and you should be able to find a dashboard for the sync app.