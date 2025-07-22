# Build the image
docker build -t prasadhonrao/nginx-custom-html .

# Push the image to Docker Hub
docker push prasadhonrao/nginx-custom-html

# Create a container
docker run -d --rm --name nginx-custom-html -p 80:80 prasadhonrao/nginx-custom-html

# Curl the container to check if it's running
curl -v http://localhost

# Exec into the container and check th HTML file
docker exec -it nginx-custom-html sh

# Check the HTML file
cat /usr/share/nginx/html/index.html

# Exit the container shell
exit

# Stop the container
docker stop nginx-custom-html

# Check the container status
docker ps

# Check all containers
docker ps -a
