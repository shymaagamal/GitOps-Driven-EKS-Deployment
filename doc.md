# Continuous Delivery (CD) Setup

----> showing the ArgoCD UI deploying our app 
(image)

🤖 ArgoCD Image Updater Setup
 1. Create a values.yaml File
u can finde it under HELM/values.yaml

### 🔧 `values.yaml` Configuration Summary

| 🔑 Key                    | 📄 Description                                                                 |
|--------------------------|---------------------------------------------------------------------------------|
| `fullnameOverride`       | Sets the name of the Helm release and Kubernetes resources.                    |
| `config.logLevel`        | Sets log level to `debug` for more visibility during development.              |
| `config.registries`      | Defines DockerHub as the container registry to monitor for image tags.         |
| `credentials`            | Points to a Kubernetes secret (`dockerhub-creds`) that stores DockerHub credentials. |
| `rbac.create`            | Tells Helm to create RBAC roles and bindings for the updater.                  |
| `serviceAccount.create`  | Creates a dedicated service account for the image updater.                     |
| `serviceAccount.name`    | Explicitly names the service account as `argocd-image-updater`.                |


📦 2. Install ArgoCD Image Updater with Helm

- Once your values file is ready, install the chart with:
```bash
helm install argocd-image-updater argo/argocd-image-updater \
  --namespace argocd \
  -f values.yaml
```
🔐 3. Create DockerHub Secret

To allow the Image Updater to authenticate with DockerHub:
```bash
kubectl create secret docker-registry dockerhub-creds \
  --docker-server=https://index.docker.io/v1/ \
  --docker-username=shaimaagamal \
  --docker-password=your_actual_docker_pat \
  --namespace=argocd
```
✅ 4. Verify the Secret

```bash
kubectl get secret dockerhub-creds --namespace=argocd

```
note about Kustimization file and mention where it is 

# 🚀 CD Pipeline Output

