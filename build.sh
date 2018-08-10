#!/bin/bash

echo "Get faas-colorization"
[ ! "$(ls | grep faas-colorization)" ] && git clone https://github.com/alexellis/faas-colorization.git
echo "Building faas-colorization"
faas-cli build -f stack.yml --regex colorization

echo "Get facedetect"
[ ! "$(ls | grep open-faas-functions)" ] && git clone https://github.com/nicholasjackson/open-faas-functions.git
echo "Get opencv template"
faas-cli template pull https://github.com/nicholasjackson/open-faas-templates
echo "Building facedetect"
faas-cli build -f stack.yml --regex facedetect

echo "Get image-resizer"
[ ! "$(ls | grep cdn_faas)" ] && git clone https://github.com/s8sg/cdn_faas.git
echo "Building image-resizer"
faas-cli build -f stack.yml --regex image-resizer

echo "Get faaschain template"
faas-cli template pull https://github.com/s8sg/faaschain
echo "Building image-upload-chain"
faas-cli build -f stack.yml --regex image-upload-chain 

echo "Done"
