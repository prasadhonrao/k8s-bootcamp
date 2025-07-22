# Use Alpine Linux as the base image (much smaller than Debian - ~5MB vs ~100MB)
FROM alpine:latest

# Update package index and install curl for HTTP requests and testing
# Alpine uses 'apk' package manager instead of 'apt-get'
RUN apk update && apk add --no-cache curl

# Keep the container running indefinitely so we can exec into it for debugging
# This makes it a utility container for network testing and troubleshooting
CMD ["sleep", "infinity"]