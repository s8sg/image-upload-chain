#!/bin/bash

echo "Deploying image-upload-chain"
faas-cli login -u admin --password a03ce3295aa8d586d3df696ac6182540c7e73b64624a2350a7708e6127dc48f3
faas-cli deploy -f stack.yml

echo "Done"
