# have used 4000 instead of 5000 as 4000 was occupied by something being run in parallel

# 1
Dockerfile

# 2
docker-compose up
http://127.0.0.1:4000

# 3
cd terraform
terraform init
terraform plan
terraform apply 

# 4
cd kubernetes_manifests
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml

# 5
Jenkinsfile
