docker build -t prasadhonrao/ambassador-server .
docker build -t prasadhonrao/ambassador -f Dockerfile.ambassador .
docker build -t prasadhonrao/ambassador-weather-api -f Dockerfile.weather .

docker push prasadhonrao/ambassador-server
docker push prasadhonrao/ambassador
docker push prasadhonrao/ambassador-weather-api

kubectl apply -f deployment.yaml

kubectl get pods

kubectl logs -f ambassador-app-5c5df4d68-z42ph -c ambassador

kubectl port-forward ambassador-app-5c5df4d68-z42ph 3000:3000

