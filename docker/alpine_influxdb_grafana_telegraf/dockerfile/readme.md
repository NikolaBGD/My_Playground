# Deploy influxdb-telegraf-grafana by Container to AWS ECS
---

## Introduction
---
It is building.

## Usage
---
1. `docker build . -t $name`
2. Login AWS account via web and Create a repository.
3. Login via awscli for pushing image.
	- pip install awscli
	- aws ecr get-login --no-include-email --region $region
4. Copy the output above and run it.
5. `docker tag $tag_name` (see `View Push Commands` on aws web)
6. `docker push $images_name:$tag_name` (see `View Push Commands` on aws web)
7. Check if it is pushed or not.
8. Create Cluster and config it.
9. Create Task by container
10. `Cluster --> the cluster --> Tasks --> Run new Task`
11. Check if it successfully run via web(*Hint:* Public DNS name can be found in EC2 instance manager).

