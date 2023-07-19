
MkDocs is a fast, simple and downright gorgeous static site generator that's geared towards building project documentation. Documentation source files are written in Markdown, and configured with a single YAML configuration file.

### How to Generate Skeleton of mkdocs project
When we are getting started with mkdocs, we need the installation of python and pip installations on either server/inside docker container and then run below command to generate sample folder structure
        
    mkdocs new <project name>
    
This will create a docs folder inside the project directory and creates mkdocs.yaml file. This yaml is used to instruct how to build and serve the static content

In this sample project we are generating the sample project while building the docker image only, so if you just run docker build it creates the sample project and keep it ready

Use below command to build the docker image

    docker build -t mkdocs:v1.0.0 .    
