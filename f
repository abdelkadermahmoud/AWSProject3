- docker tag reverseproxy abdelkaderm/reverseproxy:gitHub
  - docker tag udagram-api-user abdelkaderm/udagram-api-user:gitHub
  - docker tag udagram-frontend abdelkaderm/udagram-frontend:gitHub
  - docker tag udagram-api-feed abdelkaderm/udagram-api-feed:gitHub

# Tasks to perform after the process is successful. Formatting the Docker username and password as below enables you to programmatically log in without having the password exposed in logs.
after_success:
  -docker images
  - echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
  - docker push abdelkaderm/udagram-frontend
  - docker push abdelkaderm/reverseproxy
  - docker push abdelkaderm/udagram-api-feed
  - docker push abdelkaderm/udagram-api-user
