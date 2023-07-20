#!/bin/sh

# Assigning the docker run arg to a variable
input="$1"

# a switch case to perform the required steps
case "$input" in
    #case 1 - printing the required info, which is default option
    "help")
        echo """
      	This wrapper helps in generating the website content
      	and build the content suitable to the format of mkdocs
      	
      	Pass any of these argument like help (default), produce, serve
      
      	help: just to get some insights of how to run this
      	produce: generates the sample doc and then build it to get 
                       index.html, css files and etc..
      	serve: used to start webserver to serve the static content	 
	      """
        exit 0	
    ;;
    
    #case 2 - producing the sample project
    "produce")
        echo "checking if mkdocs.yml file precent.."
	if [ -f "mkdocs.yml" ]; then
          echo "INFO: File exists..."
        else
	  echo "INFO: No sample project found, hence creating a sample project"
	  mkdocs new .
        fi
      	
	mkdocs build
      	tar -czf mkdocsdeploy.tar.gz docs/ mkdocs.yml
      	tar -czf site.tar.gz site/*
        rm -rf docs/ mkdocs.yml site/	
    ;;

    #case 3 - serving mkdocs static site
    "serve")
        echo "Serving mkdocs site"
	tar -xzf mkdocsdeploy.tar.gz
      	mkdocs serve --dev-addr=0.0.0.0:8000
esac
