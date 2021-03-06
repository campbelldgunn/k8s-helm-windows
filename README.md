# Helm Client for Windows

### Container Details
[![](https://images.microbadger.com/badges/image/campbelldgunn/k8s-helm-win.svg)](http://microbadger.com/images/campbelldgunn/k8s-helm-win "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/campbelldgunn/k8s-helm-win.svg)](http://microbadger.com/images/campbelldgunn/k8s-helm-win "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/commit/campbelldgunn/k8s-helm-win.svg)](http://microbadger.com/images/gunnertime/k8s-helm-win "Get your own commit badge on microbadger.com")


# Supported tags and respective `Dockerfile` links
* `v2.8.0`, `latest`    [(v2.8.0/Dockerfile)](https://github.com/campbelldgunn/k8s-helm-win/blob/v2.8.0/Dockerfile)

## Overview
This container provides the Helm client for use with Kubernetes

## Building
To build a image use the following command: `docker build -t campbelldgunn/k8s-helm-win`

## Verifying
to verfiy that the image built and executes, use the following command: `docker run campbelldgunn/k8s-helm-win version`

## Run with tunneling
`kubectl run -it helm --env=HELM_HOST=<HOST>:<PORT> --image=campbelldgunn/k8s-helm --command /bin/sh -n kube-system --rm=true`

## Run without tunneling
`kubectl run -it helm --image=campbelldgunn/k8s-helm --command /bin/sh -n kube-system --rm=true`
