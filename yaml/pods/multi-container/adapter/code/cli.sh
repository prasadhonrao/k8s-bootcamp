docker build -t prasadhonrao/adapter-server .
docker build -t prasadhonrao/adapter-logger -f Dockerfile.adapter .
docker push prasadhonrao/adapter-server
docker push prasadhonrao/adapter-logger

kubectl apply -f deployment.yaml

kubectl get pods

# Port-forward to the server container
kubectl port-forward adapter-app-d56999f9f-gjxws 3000:3000

# Access the server container
curl http://localhost:3000/
curl http://localhost:3000/favicon.ico
curl http://localhost:3000/index.html

# check the logs of the logger container
kubectl logs adapter-app-d56999f9f-gjxws -c logger -f

# exec into server container and check the logs
kubectl exec -it adapter-app-d56999f9f-gjxws -c server -- sh

# exec into logger container and check the logs
kubectl exec -it adapter-app-d56999f9f-gjxws -c logger -- sh