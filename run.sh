#! /bin/bash 
export GLOO_VERSION=2.3.9
LICENSE_KEY=$1

helm repo add gloo-platform https://storage.googleapis.com/gloo-platform/helm-charts
helm repo update

helm install gloo-platform-crds gloo-platform/gloo-platform-crds \
   --namespace=gloo-mesh \
   --create-namespace \
   --version $GLOO_VERSION

helm install gloo-platform gloo-platform/gloo-platform \
   --namespace gloo-mesh \
   --version $GLOO_VERSION \
   --values ./install/gloo-gateway.yaml \
   --set licensing.glooGatewayLicenseKey=$LICENSE_KEY
   
# Creating defaults     
kubectl apply -f ./install/defaults

# App
kubectl apply -f apps/blog-app

# Appliying example      
kubectl apply -f ./manifests