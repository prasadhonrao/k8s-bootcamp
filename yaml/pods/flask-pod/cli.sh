# Build the Docker image
docker build -t prasadhonrao/flask-pod:latest .

# Push the image to Docker Hub
docker push prasadhonrao/flask-pod:latest

# Deploy the pod
kubectl apply -f pod.yaml

# Get the pod details
kubectl get pods

# Forward the port
kubectl port-forward flask-pod 5000:5000

# Test the pod
curl http://localhost:5000