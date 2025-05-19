
---

# Project Setup

> Note: Port `4000` is used instead of `5000` due to a conflict.


---

### 1. Dockerfile

Refer to `Dockerfile` for this.

---

### 2. Build & Run Locally

```bash
docker-compose up
```

Access app at: [http://127.0.0.1:4000](http://127.0.0.1:4000)

---

### 3. Provision Infrastructure with Terraform

```bash
cd terraform
terraform init
terraform plan
terraform apply
```

---

### 4. Deploy to Kubernetes

- login into registry:

```bash
doctl registry login
```

- build image and push to new registry

```bash
docker build -t registry.digitalocean.com/shishir123-registry/test:0.1 --platform linux/amd64 .
docker push registry.digitalocean.com/shishir123-registry/test:0.1
```

- Make changes to image name in deployment.yaml 
- Updating kubernetes config
- Set context to newly created kubernetes cluster

```bash
doctl kubernetes cluster kubeconfig save b8919404-268c-4668-8389-9c6e008e4888
```

- Apply manifest files

```bash
cd kubernetes_manifests
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```

---

### 5. CI/CD Pipeline

Refer to `Jenkinsfile` for automated build → push → deploy flow.

---
