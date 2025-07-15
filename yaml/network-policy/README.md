# Kubernetes Network Policy

A Kubernetes Network Policy is a resource that controls the network traffic between pods in a cluster. It acts as a firewall for pods, defining which pods can communicate with each other based on labels, namespaces, and ports. Network policies are crucial for implementing security measures in a Kubernetes environment by restricting network access according to your application requirements.

## Key Features

- **Pod-to-Pod Communication Control**: Define which pods can communicate with each other
- **Namespace Isolation**: Control traffic between different namespaces
- **Port-based Restrictions**: Allow or deny traffic on specific ports
- **Ingress and Egress Rules**: Control both incoming and outgoing traffic
- **Label-based Selection**: Use labels to select pods for network policy rules

## Network Policy Types

### 1. Ingress Rules

Control incoming traffic to selected pods

### 2. Egress Rules

Control outgoing traffic from selected pods

### 3. Default Deny All

Block all traffic to/from pods by default

## Examples

### Example 1: Basic Network Policy

This example shows a basic network policy that allows ingress traffic from pods with specific labels:

```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: allow-frontend-to-backend
  namespace: default
spec:
  podSelector:
    matchLabels:
      app: backend
  policyTypes:
    - Ingress
  ingress:
    - from:
        - podSelector:
            matchLabels:
              app: frontend
      ports:
        - protocol: TCP
          port: 8080
```

### Example 2: Default Deny All

This policy denies all ingress and egress traffic for pods in the namespace:

```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: default-deny-all
  namespace: default
spec:
  podSelector: {}
  policyTypes:
    - Ingress
    - Egress
```

### Example 3: Allow Traffic from Specific Namespace

This policy allows ingress traffic from pods in a specific namespace:

```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: allow-from-namespace
  namespace: production
spec:
  podSelector:
    matchLabels:
      app: web-app
  policyTypes:
    - Ingress
  ingress:
    - from:
        - namespaceSelector:
            matchLabels:
              name: monitoring
      ports:
        - protocol: TCP
          port: 80
```

## Important Notes

- Network policies are namespace-scoped resources
- They require a network plugin that supports NetworkPolicy (like Calico, Cilium, or Weave)
- Network policies are additive - multiple policies can apply to the same pod
- If no network policies select a pod, all traffic is allowed
- Network policies only restrict traffic between pods, not external traffic

## Common Use Cases

1. **Microservices Security**: Restrict communication between different microservices
2. **Multi-tenancy**: Isolate different teams or applications in the same cluster
3. **Compliance**: Meet security requirements by controlling network access
4. **Database Protection**: Restrict database access to specific application pods
5. **Development/Production Isolation**: Separate environments within the same cluster

## Best Practices

- Start with a default deny policy and then add specific allow rules
- Use meaningful labels for pod and namespace selection
- Test network policies in a development environment first
- Document your network policy rules clearly
- Regularly review and update network policies as your application evolves
