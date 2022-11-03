#!/usr/bin/env bash

## Complete the following steps to get Docker running locally
## This file was used to create the Original App image

# Step 1:
# Build image and add a descriptive tag
docker build -t web-app:1.0 .

# Step 2:
# List docker images
docker image ls

# Step 3:
# Run flask app
docker run -p 8000:5000 web-app:1.0
