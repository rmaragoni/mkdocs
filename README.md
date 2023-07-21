
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
     Jenkinsfile        - Jenkinsfile which automates the build and testing the mkdocs site

### How to Use?

Inorder to use this project for producing and serving the project, follow the below steps 

1. first clone this repo into your local workspace
2. Run script called **mkdockerize.sh** with **help** argument to get inputs on how to run this

   sh mkdockerize.sh help

3. if you pass **produce** argument to generate  sample project and build it, which also generates site folder suitable for nginx/apache webservers hostable files
4. if you pass **serve** argument it takes the tar file generated from the above produce and extract it in container in some location and start serving it 8000 port
5. if you would like to run all (build, produce, serve) in one go, dont pass any args. By default it performs the all actions

   sh mkdockerize.sh

6. Once the site is running, use _curl http://127.0.0.1:8000_ to access document site
