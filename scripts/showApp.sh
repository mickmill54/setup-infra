#!/bin/bash

LOG_LOCATION=./logs
exec > >(tee -i $LOG_LOCATION/showApp.log)
exec 2>&1

export STAGING_URL=$(kubectl -n staging get svc front-end -o json | jq -r '.status.loadBalancer.ingress[0].hostname')
export PRODUCTION_URL=$(kubectl -n production get svc front-end -o json | jq -r '.status.loadBalancer.ingress[0].hostname')

echo "--------------------------------------------------------------------------"
echo "Demo application running @"
echo "Staging    : http://$STAGING_URL"
echo "Production : http://$PRODUCTION_URL"
echo "--------------------------------------------------------------------------"
echo ""
