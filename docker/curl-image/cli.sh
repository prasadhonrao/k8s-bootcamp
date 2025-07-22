docker build -t prasadhonrao/curl-image .

docker image list | grep curl-image

docker push prasadhonrao/curl-image

docker run -d --rm --name curl-container prasadhonrao/curl-image

docker exec -it curl-container sh

curl -v microsoft.com

exit

docker stop curl-container
