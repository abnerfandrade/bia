ECR_REGISTRY="920373031420.dkr.ecr.us-east-1.amazonaws.com"
VERSAO=$(git rev-parse HEAD | cut -c 1-7)
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin $ECR_REGISTRY
docker build -t bia .
docker tag bia:latest $ECR_REGISTRY/bia:latest
docker push $ECR_REGISTRY/bia:latest
