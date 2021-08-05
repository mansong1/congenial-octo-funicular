[![Build Status](https://cloud.drone.io/api/badges/mansong1/congenial-octo-funicular/status.svg)](https://cloud.drone.io/mansong1/congenial-octo-funicular)

GKE Cluster using terraform


## Fetching SA Token

ACCOUNT_SECRET=$(kubectl get sa ${ACCOUNT_NAME} -n ${NAMESPACE} -o jsonpath="{.secrets[].name}")
kubectl get secret ${ACCOUNT_SECRET} -n ${NAMESPACE} -o go-template='{{index .data "ca.crt"}}' | base64 --decode > ca.crt

SERVICE_ACCOUNT_TOKEN_IN_K8S=$(kubectl get secret ${ACCOUNT_SECRET} -n ${NAMESPACE} -o jsonpath="{.data['token']}" | base64 --decode)
echo "${SERVICE_ACCOUNT_TOKEN_IN_K8S}" > sa.token