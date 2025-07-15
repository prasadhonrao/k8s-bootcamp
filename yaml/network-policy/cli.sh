#!/bin/bash

# Network Policy Demo Script
echo "=== Kubernetes Network Policy Demo ==="

# Create test deployments
echo "Creating test deployments..."
kubectl apply -f test-deployments.yaml

# Wait for deployments to be ready
echo "Waiting for deployments to be ready..."
kubectl wait --for=condition=available --timeout=300s deployment/frontend-deployment
kubectl wait --for=condition=available --timeout=300s deployment/backend-deployment
kubectl wait --for=condition=available --timeout=300s deployment/database-deployment

# Show initial pod communication (should work)
echo "=== Testing initial pod communication (before network policies) ==="
kubectl get pods -l app=frontend -o wide
kubectl get pods -l app=backend -o wide
kubectl get pods -l app=database -o wide

# Test communication from frontend to backend
echo "Testing communication from frontend to backend..."
FRONTEND_POD=$(kubectl get pods -l app=frontend -o jsonpath='{.items[0].metadata.name}')
BACKEND_POD_IP=$(kubectl get pods -l app=backend -o jsonpath='{.items[0].status.podIP}')
kubectl exec $FRONTEND_POD -- curl -s --connect-timeout 5 http://$BACKEND_POD_IP:8080 || echo "Connection failed"

# Apply default deny all policy
echo "=== Applying default deny all policy ==="
kubectl apply -f default-deny-all.yaml

# Test communication again (should fail)
echo "Testing communication after default deny policy..."
kubectl exec $FRONTEND_POD -- curl -s --connect-timeout 5 http://$BACKEND_POD_IP:8080 || echo "Connection blocked by network policy"

# Apply allow frontend to backend policy
echo "=== Applying allow frontend to backend policy ==="
kubectl apply -f allow-frontend-to-backend.yaml

# Test communication again (should work)
echo "Testing communication after allow policy..."
kubectl exec $FRONTEND_POD -- curl -s --connect-timeout 5 http://$BACKEND_POD_IP:8080 || echo "Connection still blocked"

# Apply database access policy
echo "=== Applying database access policy ==="
kubectl apply -f allow-db-access.yaml

# Show all network policies
echo "=== Current Network Policies ==="
kubectl get networkpolicies

# Describe network policies
echo "=== Network Policy Details ==="
kubectl describe networkpolicy default-deny-all
kubectl describe networkpolicy allow-frontend-to-backend
kubectl describe networkpolicy allow-db-access

# Clean up
echo "=== Cleanup ==="
read -p "Do you want to clean up the resources? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    kubectl delete -f test-deployments.yaml
    kubectl delete -f default-deny-all.yaml
    kubectl delete -f allow-frontend-to-backend.yaml
    kubectl delete -f allow-db-access.yaml
    echo "Resources cleaned up successfully!"
fi

echo "=== Demo completed ==="
