
MkDocs is a fast, simple and downright gorgeous static site generator that's geared towards building project documentation. Documentation source files are written in Markdown, and configured with a single YAML configuration file.

# How to Generate Skeleton of mkdocs project
When we are getting started with mkdocs, we need the installation of python and pip installations on either server/inside docker container and then run below command to generate sample folder structure
        
    mkdocs new <project name>
    
This will create a _**docs**_ folder inside the project directory and creates _**mkdocs.yaml**_ file. This yaml is used to instruct how to build and serve the static content

### Sample Project Overview

Below are the listed files are used for finishing the sample project

     README.md          - Current page which describes about how to use and all
     Dockerfile         - A Dockerfile for building the mkdocs docker image
     mkdocswrapper.sh   - A wrapper script used for producing and serving the website with sample doc
     mkdockerize.sh     - A script to automate build, generating the site folder tar ball, and serving the static website in the mkdocs format

### How to Use?

Inorder to use this project for producing and serving the project, follow the below steps 

1. first clone this repo into your local workspace
2. Run script called **mkdockerize.sh** using

   sh mkdockerize.sh

3. This script first build the dokcer image with the help of Dockerfile and tag the image with name of mkdocs:v1.0.04
4. Once the image is build, it prompts for y/n for producing the sample static content.
5. A docker run command will be executed by passing volume as current directlory, ports for serving the traffic, permissions for creating the produced content and **produce** as a argument to the entrypoint which triggers another script to perform creating a sample project and build it then create a tar file(generated site folder will be zipped) and copy into main folder
6. Once the produce step is completed, it propmts for y/n for serving the sample static content.
7. A docker run command will be executed by passing volume as current directlory, ports for serving the traffic, permissions for creating the produced content and **serve** as a argument to the entrypoint which serve the traffic in the format of mkdocs
