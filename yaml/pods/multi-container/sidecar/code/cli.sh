docker build -t prasadhonrao/sidecar-server .
docker build -t prasadhonrao/sidecar-logger -f Dockerfile.logger .
docker push prasadhonrao/sidecar-server
docker push prasadhonrao/sidecar-logger

kubectl apply -f deployment.yaml

kubectl get pods --watch

# Port-forward to the server container
kubectl port-forward sidecar-app-6485fcbdbc-h89st 3000:3000

# Access the server container
curl http://localhost:3000/
curl http://localhost:3000/favicon.ico
curl http://localhost:3000/index.html

# check the logs of the logger container
kubectl logs sidecar-app-6485fcbdbc-h89st -c logger -f