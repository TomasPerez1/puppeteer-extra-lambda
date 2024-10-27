#!/bin/bash

echo "command - npx tsc"
npx tsc

echo "command - aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 156041417839.dkr.ecr.us-east-1.amazonaws.com"
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 156041417839.dkr.ecr.us-east-1.amazonaws.com

echo "command - docker build --platform linux/amd64 --progress=plain -t property-scraper ."
docker build --platform linux/amd64 --progress=plain -t property-scraper .

echo "command - docker tag property-scraper:latest 156041417839.dkr.ecr.us-east-1.amazonaws.com/property-scraper:latest"
docker tag property-scraper:latest 156041417839.dkr.ecr.us-east-1.amazonaws.com/property-scraper:latest

echo "command - docker push 156041417839.dkr.ecr.us-east-1.amazonaws.com/property-scraper:latest"
docker push 156041417839.dkr.ecr.us-east-1.amazonaws.com/property-scraper:latest