#!/bin/bash

# List of services
output=$(kubectl get pods -n xxxx | grep -e xxx)

services=($(echo "$output" | awk '{print $1}'))

# Loop through services
for service in "${services[@]}"
do
    echo $service
    # Get logs for the service
    kubectl logs -n xxxx $service > $service.log &
done
