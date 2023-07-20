#!/bin/sh

echo "Welcome to dockerized solution for building mkdocs"

if [ -d "mkdocs_project" ]; then
   echo "Required directory exists..."
else
   echo "INFO: Creating directory"	 
   mkdir mkdocs_project	
fi

if [ -x "$(command -v docker)" ]; then
    echo "INFO: Found Docker installation, proceeding.."
else
    echo "Please Install docker and try again"
fi

echo "INFO: Bulding the dokcer image..."

sudo docker build -t mkdocs:v1.0.0 .

echo "Do you want to produce the sample project and generate site folder?"
read -p "Continue? (y/n): " confirm

sudo docker run -it --rm -v $PWD:/docs -w /docs/mkdocs_project -u $(id -u ${USER}):$(id -g ${USER}) mkdocs:v1.0.0 produce

echo "INFO: Site produced successfully, generated tar file can also be hosted in any webserver"

echo "Do you want to serve the webiste with mkdocs generated format?"
read -p "Continue? (y/n): " confirm

sudo docker run -it --rm -v $PWD:/docs -w /docs/mkdocs_project -p 8000:8000 -u $(id -u ${USER}):$(id -g ${USER}) mkdocs:v1.0.0 serve
